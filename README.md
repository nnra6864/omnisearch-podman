This is a Podman container made for omnisearch using:

1. [pasta](https://passt.top/passt/about/)
2. [omnisearch](https://git.bwaaa.monster/omnisearch/about/)
3. [beaker](https://git.bwaaa.monster/beaker/about/)

## Usage

### Install packages

Arch
```sh
sudo pacman -S podman docker-compose passt
```

### Cloning

```sh
git clone --recurse https://github.com/nnra6864/omnisearch-podman
```

### Configuring

While some configuration is available in `*.env` files, most configs can be found in mounted directories.

#### Env

Make sure to remove `.example` from all the `.env` files or the container won't start:
```sh
sh -c 'for f in *.env.example; do cp "$f" "${f%.example}"; done'
```

```properties
# Controls the text used in all the labels, as well as the tab name
APP_NAME=OmniSearch
```

### Building

```sh
podman compose build --no-cache
```

### Running

```sh
podman compose up -d
```

### Updating

```sh
podman compose down; podman compose build --no-cache && podman compose up -d
```

### Stopping

```sh
podman compose down
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
