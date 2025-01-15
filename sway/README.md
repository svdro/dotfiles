# Sway config

## setup

```bash
# symlink the "dotfiles/sway" directory to "~/.config/"
ln -s ~/dotfiles/sway ~/.config/
```

## dependencies

- [sway](https://github.com/swaywm/sway)
- [swaylock](https://github.com/swaywm/swaylock)
- [swayidle](https://github.com/swaywm/swayidle)
- [swaync](https://github.com/ErikReider/SwayNotificationCenter?tab=readme-ov-file#sway-usage)
- [waybar](https://github.com/Alexays/Waybar?tab=readme-ov-file)
- [tofi](https://github.com/philj56/tofi)
- [alacritty](https://github.com/alacritty/alacritty)

- pactl/pauvcontrol
- [playerctl](https://github.com/acrisci/playerctl)
- [brightnessctl](https://github.com/Hummer12007/brightnessctl)
  - NOTE: on some distros `sudo usermod -aG video $USER` is required to run brightnessctl without sudo
- [grimshot](https://github.com/OctopusET/sway-contrib)

- [jq](https://github.com/jqlang/jq) - for getting current active output script

## nvidia

sway doesn't start with an nvidia gpu.
to launch anyway, modify the desktop entry:

- edit `~/usr/share/wayland-sessions/sway.desktop`
- change the `Exec sway` line to `Exec sway --unsupported-gpu`

## keybindings

### actions

- **Mod + Return** - Open terminal
- **Mod + Mod2 + Backspace** - system mode (lock, logout, suspend, reboot, shutdown)
- **Mod + d** - Open tofi (app launcher)

### workspace

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

## dark mode

flatpak:

```bash
# override GTK theme for consistent dark mode in flatpak apps
flatpak override --user --env=GTK_THEME=Adwaita-dark
```

nautilus:

- create a custom desktop entry in `~/.local/share/applications/nautilus.desktop`:

```
[Desktop Entry]
Type=Application
Name=Nautilus
Exec=env GTK_THEME="Adwaita-dark" nautilus
```

## TODO

- [x] sway
- [x] swaylock/swayidle
- [x] wofi/rofi/tofi - tofi
- [x] waybar
- [x] notifications
- [ ] system wide dark mode
