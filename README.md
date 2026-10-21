# Chromecast Orchestra
A central orchestration server deployed via Docker Compose for managing Chromecast deployments on a LAN

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
## Connecting Devices
Devices need to be added to "data/devices.conf" with the following format "name, Wireless IP, Ethernet IP (optional)". Once added, each device needs to be paired manually once (this includes enabling developer settings, turning on wireless debugging, and pairing with the device code). The command for pairing is:
```
ccorc pair <ip>:<pairing-port> <code>
```

## Manifests
There are various manifests within the data directory that can be used for syncing statuses between devices. These include apps to install, disable, or uninstall, settings to apply, and permissions to grant.

## Commands
There are various commands that can be run from inside the container.

Check device statuses with:
`ccorc ccorc status all`

Discover devices through mDNS with:
`ccorc doctor`

Sync manifests to all devices with:
`ccorc sync all`

Sync manifests to a specific machine with:
`ccorc sync bedroom-hd`

Sync specific manifests with:
`ccorc sync --settings`

Uninstall specific apps with:
`ccorc uninstall all com.foo.bar`

Install APKs with:
`ccorc install all /data/apks/x.apk`

Install Apps from the Play Store with:
`ccorc playstore all com.foo.bar`

Use ADB shell commands with:
`ccorc shell all 'settings put secure foo 1'`
