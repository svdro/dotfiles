# Waybar

Basic [cattpuccin](https://github.com/catppuccin) style [waybar](https://github.com/Alexays/Waybar) configuration.

## setup

### install waybar & dependencies

```bash
# ubuntu
apt install waybar playerctl

# arch
sudo pacman -S waybar playerctl
```

### install optional dependencies

- install mullvad vpn (optional) - ([ubuntu](https://mullvad.net/en/download/vpn/linux), [arch](https://mullvad.net/en/help/install-mullvad-app-linux) )
- **waybar** expects the **mullvad vpn desktop file** in `/opt/Mullvad\ VPN/mullvad-vpn\`
- install sway (optional)

### link the waybar configuration
```bash
# symlink the "dotfiles/waybar" directory to "~/.config/"
ln -s ~/dotfiles/waybar ~/.config/
```

## dependencies:

- [waybar](https://github.com/Alexays/Waybar)
- [sway](https://github.com/swaywm/sway) - **wm widgets**
- [playerctl](https://github.com/acrisci/playerctl) - `media.sh`/**music widget**
- [mullvad vpn](https://mullvad.net/en/download/) - `mullvad.sh`/**vpn widget**

### not yet implemented:

- [ ] System tray
- [ ] Temperature sensors
- [ ] Idle inhibitor (prevent screen from turning off)
- [ ] GPU stats

### TODO:

- [ ] cleanup mullvad/media scripts
- [ ] cpu/memory/disk widgets
- [ ] battery tooltip
