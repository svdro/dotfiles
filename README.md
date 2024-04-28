# dotfiles

### nvim

dependencies:

- **ripgrep**
  - arch: `sudo pacman -S ripgrep`
  - macos: `brew install ripgrep`

setup:

- clone this repo and copy the **nvim** folder to the **.config** dir

  ```
  cd ~
  git clone https://github.com/svdro/dotfiles/tree/main
  mv ~/dotfiles/nvim ~/.config/nvim
  ```

- or create a **symlink** symlink

  ```
  ln -s ~/dotfiles/nvim ~/.config/nvim
  ```

- open nvim

  ```
  cd ~/config/nvim
  nvim .
  ```

- wait for **Lazy** to install all packages and for **Mason** to setup all **language servers**,**formatters**, etc
- (optional) setup **Copilot**: `:Copilot setup`

### alacritty

setup:

- clone this repo and copy the **alacritty** folder to the **.config** dir

  ```
  cd ~
  git clone https://github.com/svdro/dotfiles/tree/main
  mv ~/dotfiles/alacritty ~/.config/alacritty
  ```

- or create a **symlink** symlink

  ```
  ln -s ~/dotfiles/alacritty ~/.config/alacritty
  ```
