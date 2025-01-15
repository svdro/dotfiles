# dotfiles

## setup

```bash
# clone the dotfiles repo
cd ~
git clone https://github.com/svdro/dotfiles.git
```

basic setup:

```bash
# alacritty
ln -s ~/dotfiles/alacritty ~/.config/

# tmux
ln -s ~/dotfiles/tmux ~/.config/
```

zed:

- [zed config](./zed/README.md) for more details

```bash
# remove the zed user settings (if any)
rm ~/.config/zed/*.json

# symlink keymap and settings
ln -s ~/dotfiles/zed/keymap.json ~/.config/zed/
ln -s ~/dotfiles/zed/settings.json ~/.config/zed/
```

nvim:

- [nvim config](./nvim/README.md) for more details

```bash
# dependencies
sudo pacman -S wl-clipboard
sudo pacman -S ttf-hack-nerd
sudo pacman -S nodejs npm
sudo pacman -S unzip
sudo pacman -S ripgrep

# symlink the nvim config
ln -s ~/dotfiles/nvim ~/.config/nvim
```

sway:

- [sway config](./sway/README.md)
- [swaync config](./swaync/README.md)
- [waybar config](./waybar/README.md)
