# dotfiles

### alacritty

setup:

- clone this repo and copy the **alacritty** folder to the **.config** dir

  ```bash
  cd ~
  git clone https://github.com/svdro/dotfiles.git
  mv ~/dotfiles/alacritty ~/.config/alacritty
  ```

- or create a **symlink** symlink

  ```bash
  ln -s ~/dotfiles/alacritty ~/.config/alacritty
  ```

### tmux

- clone this repo and copy the **.tmux.conf** file to the home dir
  ```bash
  cd ~
  git clone https://github.com/svdro/dotfiles.git
  mv ~/dotfiles/.tmux.conf ~/.tmux.conf
  ```
- or create a **symlink** symlink

  ```bash
  ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
  ```

- if already running tmux, reload the config

  ```bash
  tmux source-file ~/.tmux.conf
  ```

- otherwise, start tmux
  ```bash
  tmux new
  ```

### nvim

dependencies:

- **ripgrep**
  - arch: `sudo pacman -S ripgrep`
  - macos: `brew install ripgrep`

setup:

- clone this repo and copy the **nvim** folder to the **.config** dir

  ```bash
  cd ~
  git clone https://github.com/svdro/dotfiles.git
  mv ~/dotfiles/nvim ~/.config/nvim
  ```

- or create a **symlink** symlink

  ```bash
  ln -s ~/dotfiles/nvim ~/.config/nvim
  ```

- open nvim

  ```bash
  cd ~/config/nvim
  nvim .
  ```

- wait for **Lazy** to install all packages and for **Mason** to setup all **language servers**,**formatters**, etc
- (optional) setup **Copilot**: `:Copilot setup`
