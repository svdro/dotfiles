# Zed

## setup

```bash
# remove the zed user settings
rm ~/.config/zed/*.json

# symlink the settings
ln -s ~/dotfiles/zed/keymap.json ~/.config/zed/
ln -s ~/dotfiles/zed/settings.json ~/.config/zed/
```

### dependencies

- **python** _(for formatting)_ -> `black`

# TODO:

- [x] **python**, `formatting` (do I need to enable this or get an extension?)
- [ ] file finder/ project panel (open files in new splits)
- [x] search (figure out `pane: deploy search`)
- [x] comments (`copy` and `yank` keybinding)
- [ ] tasks

## Notes

- to see the **active context** - `debug: open key context view` in the **command palette**
- `~/.config/zed/` is where the settings are stored
- `~/.local/share/zed/` is where the data is stored
