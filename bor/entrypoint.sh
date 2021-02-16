#!/usr/bin/env sh

if [ ! -f /root/.bor/data/bor/static-nodes.json ]; then
  echo "configuring node"
  cat ./setup.sh
  sh ./setup.sh
  echo "node configured"
fi;

echo '["enode://320553cda00dfc003f499a3ce9598029f364fbb3ed1222fdc20a94d97dcc4d8ba0cd0bfa996579dcc6d17a534741fb0a5da303a90579431259150de66b597251@54.147.31.250:30303","enode://f0f48a8781629f95ff02606081e6e43e4aebd503f3d07fc931fad7dd5ca1ba52bd849a6f6c3be0e375cf13c9ae04d859c4a9ae3546dc8ed4f10aa5dbb47d4998@34.226.134.117:30303"]' > /root/.bor/data/bor/static-nodes.json

HEIMDALL_URL=${HEIMDALL_URL:-localhost}
echo "starting node"
echo $HEIMDALL_URL
BOR_DIR=${BOR_DIR:-~/.bor}
DATA_DIR=$BOR_DIR/data
bor --datadir $DATA_DIR \
  --heimdall http://$HEIMDALL_URL:1317 \
  --port 30303 \
  --rpc --rpcaddr '0.0.0.0' \
  --rpcvhosts '*' \
  --rpccorsdomain '*' \
  --rpcport 8545 \
  --ipcpath $DATA_DIR/bor.ipc \
  --rpcapi 'db,eth,net,web3,txpool,bor' \
  --syncmode 'full' \
  --networkid '80001' \
  --miner.gaslimit '200000000' \
  --miner.gastarget '20000000' \
  --txpool.nolocals \
  --txpool.accountslots '128' \
  --txpool.globalslots '20000'  \
  --txpool.lifetime '0h16m0s' \
  --maxpeers 200 \
  --metrics \
  --pprof --pprofport 7071 --pprofaddr '0.0.0.0' \
  --bootnodes enode://320553cda00dfc003f499a3ce9598029f364fbb3ed1222fdc20a94d97dcc4d8ba0cd0bfa996579dcc6d17a534741fb0a5da303a90579431259150de66b597251@54.147.31.250:30303,enode://f0f48a8781629f95ff02606081e6e43e4aebd503f3d07fc931fad7dd5ca1ba52bd849a6f6c3be0e375cf13c9ae04d859c4a9ae3546dc8ed4f10aa5dbb47d4998@34.226.134.117:30303