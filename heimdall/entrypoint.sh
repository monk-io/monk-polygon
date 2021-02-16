#!/bin/bash

BOR_URL=${BOR_URL:-localhost}


echo "the node configuration"
if [ ! -f $HEIMDALLDIR/config/heimdall-config.toml ]; then
    echo "the node configuring"
    heimdalld init
    # echo "eth_rpc_url = \"${DEFAULT_ETH_URL}\"" >> $HEIMDALLDIR/config/heimdall-config.toml
    # echo "moniker = \"${MONIKER}\"" >> $HEIMDALLDIR/config/config.toml
    # echo "seeds = \"${SEEDS}\"" >> $HEIMDALLDIR/config/config.toml
fi;

# bor_rpc_url = "http://localhost:8545"
sed -i '/eth_rpc_url = "http:\/\/localhost:9545"/c'"eth_rpc_url = "\"${DEFAULT_ETH_URL}\""" $HEIMDALLDIR/config/heimdall-config.toml
sed -i '/seeds = ""/c'"seeds = "\"${SEEDS}\""" $HEIMDALLDIR/config/config.toml
sed -i '/bor_rpc_url = "http:\/\/localhost:8545"/c'"bor_rpc_url = "\""http:\/\/${BOR_URL}:8545\"" $HEIMDALLDIR/config/heimdall-config.toml
# sed -i '/moniker = "72d9af00cd52"/c'"moniker = "\"${SEEDS}\""" $HEIMDALLDIR/config/config.toml
rm -rf $HEIMDALLDIR/config/genesis.json
cp $CONFIGPATH/genesis.json $HEIMDALLDIR/config/
echo "the node configured"
echo "heimdall start"
mkdir -p ./logs/
touch ./logs/heimdalld.log
touch ./logs/heimdalld-rest-server.log
touch ./logs/bridge.log
heimdalld start > ./logs/heimdalld.log &
heimdalld rest-server > ./logs/heimdalld-rest-server.log &
sleep 100
bridge start --all > ./logs/bridge.log &

# tail logs
tail -f ./logs/heimdalld.log ./logs/heimdalld-rest-server.log ./logs/bridge.log