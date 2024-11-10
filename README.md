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


### Neovim installation
#### Ubuntu
0. Prerequisites
    ```sh
    sudo apt update
    sudo apt install fuse libfuse2
    ```

1. Download the AppImage (v0.9+ is needed for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim))
    - [Neovim releases](https://github.com/neovim/neovim/releases)

2. Make the AppImage executable
    ```
    chmod u+x nvim.appimage
    ```

3. Move Neovim to system path
    ```
    sudo mv nvim.appimage /usr/local/bin/nvim
    ```
    
4. Install [packer](https://github.com/wbthomason/packer.nvim) for package management
    ```
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```

### zsh installation
#### Ubuntu
```
sudo apt install zsh
```


## Setup
- TODO
