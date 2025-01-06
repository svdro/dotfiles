# Sway config

## Dependencies

- [alacritty](https://github.com/alacritty/alacritty)
- pactl/pauvcontrol
- [playerctl](https://github.com/acrisci/playerctl)
- [brightnessctl](https://github.com/Hummer12007/brightnessctl)
  - NOTE: on some distros `sudo usermod -aG video $USER` is required to run brightnessctl without sudo
- [grimshot](https://github.com/OctopusET/sway-contrib)

## Keybindings

### Actions

- **Mod + Return** - Open terminal

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
