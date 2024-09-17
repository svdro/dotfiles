# Zed

## setup

```bash
# remove the zed user settings
rm ~/.config/zed/*.json

# symlink the settings
ln -s ~/dotfiles/zed/keymap.json ~/.config/zed/
ln -s ~/dotfiles/zed/settings.json ~/.config/zed/
```

# TODO:

- [ ] file finder/ project panel (open files in new splits)
- [ ] search (figure out `pane: deploy search`)
- [ ] comments (`copy` and `yank` keybinding)
- [ ] keybindings don't work in **empty panes**
- [ ] fix contexts that are currently ignored by keybindings
  - [x] **EmptyPane**
  - [ ] extensions _(what's the context)_
- [ ] tasks - many of the features that are not easily implemented in zed can probably be done with tasks

## Notes

### **Search** in **Assistant** is broken

- `vim::SearchSubmit` is not working in the assistant panel
- instead of taking the **search term** from the **search bar** in the assistant panel,
  it takes the **search term** from the **search bar** in the last selected **editor** context.

### zed **aliases** vim commands

- useres _cannot_ currently change aliases.
- `:vs` opens a new split to the left, which is the default behavior, but irritating
