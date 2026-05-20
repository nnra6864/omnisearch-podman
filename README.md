This is a Podman quadlet made for omnisearch using:

1. [pasta](https://passt.top/passt/about/)
2. [omnisearch](https://git.bwaaa.monster/omnisearch/about/)
3. [beaker](https://git.bwaaa.monster/beaker/about/)

## Usage

### Install packages

Arch

```sh
sudo pacman -S podman passt
```

### Cloning

Quadlet has to be cloned in the right place in order for systemd to detect it:
```sh
git clone --recurse https://github.com/nnra6864/omnisearch-podman ~/.config/containers/systemd/omnisearch
```

### Configuring

While some configuration is available in `*.container` and `*.env` files, most config files and directories are found in the `data` dir.

#### Env

```properties
# Controls the text used in all the labels, as well as the tab name
APP_NAME=OmniSearch
```

### Building and running

1. Remove old builds if found:
    ```sh
    podman rmi -f localhost/omnisearch:latest
    ```
2. Reload the daemon to get the latest service:
    ```sh
    systemctl --user daemon-reload
    ```
3. Build and start the service:
    ```sh
    systemctl --user start omnisearch.service
    ```

### Stopping

```sh
systemctl --user stop omnisearch.service
```

# ☦ Ι̅Ϲ̅ Χ̅Ϲ̅ ΝΙΚΑ — Ὁ Ὤν

Εἰς δόξαν τοῦ Θεοῦ<br>
*To the glory of God*

Τῇ Ὑπεραγίᾳ Θεοτόκῳ δόξα<br>
*Glory to the Most Holy Theotokos*

Δόξα τῷ Θεῷ πάντων ἕνεκεν<br>
*Glory to God for all things*

ΑΜΗΝ

☦
