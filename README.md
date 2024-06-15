# AstroNvim Config

**NOTE:** This is for AstroNvim v4+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

#### Start Neovim from different config location:

You can start nvim using different configuration location path. Useful, when trying new configuration and installing new versions.

```shell
NVIM_APPNAME=astronvim_v4 nvim
```

# Troubleshooting

When building `neovim` from scratch, you may end up seeing errors related to missing or not working cmake or c compiler.

If that is the case, make sure you have installed the latest cmake

```shell
brew install cmake
```

If that doesn't help, make sure the SDROOT environment variable is properly set.

```shell
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
```
