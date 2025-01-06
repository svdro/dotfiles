# Sway config

## TODO

- [x] sway
- [x] swaylock/swayidle
- [x] wofi/rofi/tofi - tofi
- [ ] waybar
- [ ] notifications

## Dependencies

- [sway](https://github.com/swaywm/sway)
- [swaylock](https://github.com/swaywm/swaylock)
- [swayidle](https://github.com/swaywm/swayidle)

- [tofi](https://github.com/philj56/tofi)
- [alacritty](https://github.com/alacritty/alacritty)

- pactl/pauvcontrol
- [playerctl](https://github.com/acrisci/playerctl)
- [brightnessctl](https://github.com/Hummer12007/brightnessctl)
  - NOTE: on some distros `sudo usermod -aG video $USER` is required to run brightnessctl without sudo
- [grimshot](https://github.com/OctopusET/sway-contrib)

## Keybindings

### Actions

- **Mod + Return** - Open terminal
- **Mod + Mod2 + Backspace** - system mode (lock, logout, suspend, reboot, shutdown)
- **Mod + d** - Open tofi (app launcher)

### Workspace

- **Mod + 1-9** - Switch to workspace 1-9
- **Mod + Shift + 1-9** - Move focused container to workspace 1-9
- **Mod + h/j/k/l** - Focus container in direction h/j/k/l
- **Mod + Shift + h/j/k/l** - Move container in direction h/j/k/l
- **Mod + Mod2 + h/j/k/l** - Move workspace to monitor in direction h/j/k/l
- **Mod + b** - Split horizontal Layout
- **Mod + v** - Split vertical Layout
- **Mod + f** - Toggle fullscreen
- **Mod + w** - tabbed layout
- **Mod + e** - toggle split layout
