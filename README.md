# chromecast-orchestra-docker
A central orchestration server for managing Chromecast deployments on a LAN


## Docker Compose

```yaml
services:
  chromecast-orchestra:
    container_name: chromecast-orchestra
    image: ghcr.io/colino17/chromecast-orchestra-docker:latest
    restart: always
    network_mode: host
    volumes:
      - /path/to/data:/data
    environment:
      - TZ=Canada/Atlantic
```
