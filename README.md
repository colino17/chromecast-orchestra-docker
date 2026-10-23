# Chromecast Orchestra
A central orchestration server deployed via Docker Compose for managing Chromecast deployments on a LAN

## Docker Compose

```yaml
services:
  chromecast-orchestra:
    container_name: chromecast-orchestra
    image: ghcr.io/colino17/chromecast-orchestra-docker:latest
    restart: always
    volumes:
      - /path/to/data:/data
    environment:
      - TZ=Canada/Atlantic
      - CCORC_WEB_USER=admin
      - CCORC_WEB_PASS=password
    ports:
      - 9276:9276
```
## Connecting Devices
Devices need to be added to "data/devices.conf" with the following format "name ipaddress". Once added, go to the Web UI, select the newly added device, and try to send a text message. This should trigger the authorization dialog on the device. After you accept then the device should connect properly.

## Manifests
There are various manifests within the data directory that can be used for syncing statuses between devices. These include apps to install, disable, or uninstall, settings to apply, and permissions to grant.

| Manifest | Purpose | Format |
|----------|---------|--------|
| apks.txt | Installs/Updates APKs using APKs stored in the "apks" folder | `<package> <version> <file>` |
| disable.txt | Disables listed packages | `<package>` |
| playstore.txt | Installs packages from the Play Store | `<package>` |
| shell.txt | Runs specific shell commands on sync | `<command>` |
| uninstall.txt | Uninstalls existing packages | `<package>` |

## Share Folder
Anything placed in the "share" folder will be pushed to the "Documents" folder of your device on a sync. This is a quick way to distribute settings/backup files to multiple devices at once. Note that this simply places the files on the device. You will still need to manually restore any backups using the methods built into the respective apps.

## Commands
There are various commands that can be run from inside the container. These commands can be run on different target devices, whether that be a single device, multiple devices (comma separated), or "all" devices (the pull and text commands need to target a specific single device).

| Purpose | Command |
|---------|---------|
| Sync manifests and push settings files to devices | `ccorc sync <target>` |
| Run shell commands on devices | `ccorc shell <target> "<command>"` |
| Input text on a specific device | `ccorc text <target> "<text>"` |
| Pull files from a target device's Documents folder | `ccorc pull <target>` |
| Display commands | `ccorc help` |

## WEB UI
There is a Web UI available at http://ipaddress:9276 that allows you to input text. If no username and password are specified via compose then the Web UI won't have any authentication method.

## Disclosure
Claude was heavily used to assist the development of the subject code. Gemini was also used as a secondary code auditing tool.
