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
- [ ] search (figure out `pane: deploy search`)
- [ ] comments (`copy` and `yank` keybinding)
- [ ] fix contexts that are currently ignored by keybindings
  - [ ] project search _what's the context?_
  - [x] **EmptyPane**
  - [ ] extensions _(what's the context)_
  - [ ] exit fullscreen doesn't work when the terminal is in fullscreen
- [ ] tasks - many of the features that are not easily implemented in zed can probably be done with tasks

## Notes

### **Search** in **Assistant** is broken

- `vim::SearchSubmit` is not working in the assistant panel
- instead of taking the **search term** from the **search bar** in the assistant panel,
  it takes the **search term** from the **search bar** in the last selected **editor** context.

### local data storage

- `~/.config/zed/` is where the settings are stored
- `~/.local/share/zed/` is where the data is stored
