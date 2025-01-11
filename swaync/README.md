# SwayNotificationCenter

### setup

```bash
# arch
sudo pacman -S swaync

# ubuntu
sudo apt install sway-notification-center

# link to .config
ln -s ~/dotfiles/swaync ~/.config/
```

### usage

```bash
# make sure no other notification daemon is running
ps aux | grep -E "dunst|mako"
killall dunst
killall mako

# start swaync
swaync

# reload config/css
swaync -R
swaync -rs

# toggle notification center
swaync -t

# do not disturb on/off
swaync -df
swaync -do
```
