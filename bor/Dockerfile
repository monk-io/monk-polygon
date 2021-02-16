FROM maticnetwork/bor:v0.2.1

RUN apk update && apk add git bash
RUN git clone https://github.com/maticnetwork/launch.git
WORKDIR ./launch/testnet-v4/sentry/sentry/bor
RUN chmod +x ./start.sh && chmod +x ./setup.sh
COPY entrypoint.sh .
CMD ["./entrypoint.sh"]
ENTRYPOINT ["./entrypoint.sh"]
