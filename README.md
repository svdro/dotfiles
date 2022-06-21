# dotfiles

## nvim

### Plugins

 * language servers:
   * pyright: `pip install pyright`
   * tsserver: `npm install -g typescript-language-server typescript`
   * gopls: (comes with go)
   * sumneko_lua: `brew install lua-language-server`
 * code formatting (null-ls):
   * black `pip install black`
   * prettier `npm i prettier` (does not work)
   * gofmt (comes with go)
   * stylua `brew install stylua`
 * for pictograms in cmp popups to work, install a [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) font.
 * for Treesitter (syntax highlighting) to enable all languages ->  :TSInstall all

### TODO:
  * [ ] Null-ls: get prettier to work for js.
  * [ ] Diagnostics: figure out how to ignore individual error messages.
  * [ ] Telescope: give a little more love to Telescope config.

## alacritty

 * if ~/.config/alacritty is a symlink, live reload config does not work. Restart after changing "alacritty.yml".
 * install [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) font.
