# dotfiles

## Installation
### Prerequisites
```
sudo apt install build-essential curl cmake
```

Install rust (for installing [eza](https://github.com/eza-community/eza))
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### CLI Tools
- [eza](https://github.com/eza-community/eza)
    ```
    cargo install eza
    ```

- [starship](https://github.com/starship/starship)
    ```
    cargo install starship --locked
    ```

- [ripgrep](https://github.com/BurntSushi/ripgrep)
    ```
    sudo apt-get install ripgrep
    ```

- [sharkdp/fd](https://github.com/sharkdp/fd)
    ```
    sudo apt install fd-find
    ```


### Neovim
See [docs/nvim.md](docs/nvim.md) for requirements, installation, and updating an existing machine.

### zsh installation
#### Ubuntu
```
sudo apt install zsh
```


## Setup

Use `deploy.sh` to symlink configs into place:

```sh
# Deploy everything
./deploy.sh

# Deploy a specific target
./deploy.sh nvim
./deploy.sh tmux
./deploy.sh git
./deploy.sh zsh
```

The script backs up any existing files (e.g. `~/.gitconfig` → `~/.gitconfig.bak`) before creating symlinks.
