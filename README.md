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
monk load polygon.yaml
```

### Run Matic nodes with nginx
```
monk run polygon/testnet
```
