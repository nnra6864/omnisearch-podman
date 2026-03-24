This is a podman container made for omnisearch using:

1. [pasta](https://passt.top/passt/about/)
2. [omnisearch](https://git.bwaaa.monster/omnisearch/about/)
3. [beaker](https://git.bwaaa.monster/beaker/about/)

# Usage

## Install packages

Arch

```sh
sudo pacman -S podman podman-compose passt
```

## Building

Everything is automated, simply run:

```sh
podman-compose build
```

This should take less than a minute

## Running

Configure `compose.yml` and `.env` and run:

```sh
podman-compose up -d
```

## Configuring

While some configuration is available in `compose.yml` and `.env`, most config files and directories are found in the `omnisearch` dir.
To locate it, look at your `compose.yml`.
By default, it should be in the same directory as the compose file:

```yml
volumes:
    - ./omnisearch:/etc/omnisearch:U
```

Keep in mind that all edits will require sudo, or simply switching to the podman user:

```sh
podman unshare
```

### Env

```properties
# This controls the text used in all the labels, as well as the tab name
APP_NAME=OmniSearch
```

## Stopping

```sh
podman-compose down
```
