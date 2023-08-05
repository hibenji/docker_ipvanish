# IPVANISH
IPVANISH docker container

## Building
`docker build -t vpn .`

## Docker run usage
```Shell
docker run \
  --cap-add=NET_ADMIN \
  --device=/dev/net/tun \
  --name=ipvanish \
  -e 'USERNAME=IPVANISH_USERNAME' \
  -e 'PASSWORD=IPVANISH_PASSWORD' \
  vpn
```

### Optional run flags
```Shell
  --dns 209.222.18.222 \
  --dns 209.222.18.218 \
```

## Docker Compose
```yml
services:
  ipvanish:
    cap_add:
    - NET_ADMIN
    container_name: ipvanish
    devices:
    - /dev/net/tun
    environment:
      PASSWORD: YOUR_PASSWORD
      REGION: YOUR_REGION
      USERNAME: YOUR_USERNAME
    image: vpn
    ports:
    - <portsNeededByOtherService>
  busybox:
    container_name: busybox
    image: busybox
    network_mode: service:ipvanish
    command: ifconfig | grep inet
version: '2'
```

### Optional run flags
```yml
services:
  ipvanish:
    dns:
    # Google
    - 8.8.8.8
    - 8.8.4.4
```

## List Regions
```Shell
docker run vpn ls
```
