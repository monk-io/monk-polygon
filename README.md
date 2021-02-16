# MATIC NODE

### Build Matic Bor
```
docker build -t monk/matic-bor ./bor
```

### Build Heimdall Bor
```
docker build -t monk/matic-heimdall ./heimdall
```

### Load Matic
```
mncc load matic.yaml
```

### Run Matic nodes with nginx
```
mncc run matic2/testnet
```
