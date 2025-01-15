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

python

- [zed docs python](https://zed.dev/docs/languages/python):
- ensure **black** is installed in the base environment

protols:

- [zed docs proto](https://zed.dev/docs/languages/proto)

```bash
# ensure rust is installed
curl https://sh.rustup.rs -sSf | sh
rustup self uninstall` to uninstall

# install protols
cargo install protols
```

## Notes

- To view the **active context**, run `debug: open key context view` from the **command palette**.
- The settings are stored in `~/.config/zed/`.
- Data is stored in `~/.local/share/zed/`.

### python

When working with different python environments copy the env path into the **local settings**:

```json
{
  // LSP Settings
  "lsp": {
    "pyright": {
      "settings": {
        "python.analysis": {
          "diagnosticMode": "workspace"
          // "typeCheckingMode": "strict"
        },
        "python": {
          "pythonPath": "~/miniconda3/envs/ml/bin/python"
        }
      }
    }
  }
}
```

# TODO:

- [ ] file finder/ project panel (open files in new splits)
- [x] comments (`copy` and `yank` keybinding)
- [ ] tasks
