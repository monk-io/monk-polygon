FROM maticnetwork/heimdall:v0.2.0-mumbai-42a1beac

ENV MONIKER="DefaultTestNodeName"
ENV SEEDS="4cd60c1d76e44b05f7dfd8bab3f447b119e87042@54.147.31.250:26656,b18bbe1f3d8576f4b73d9b18976e71c65e839149@34.226.134.117:26656"
ENV DEFAULT_ETH_URL=https://goerli.infura.io/v3/743cd22c52c143899161ddacf91da781

RUN ls -la /root/heimdall/
ENV HEIMDALLDIR /root/.heimdalld
RUN git clone https://github.com/maticnetwork/launch.git

ENV CONFIGPATH launch/testnet-v4/sentry/sentry/heimdall/config
COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
