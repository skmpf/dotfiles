# My dotfiles

This directory contains my personal dotfiles.

## Requirements

Ensure you have the following installed on your system

### Git

```
brew install git
<!-- or -->
sudo apt-get install git
```

### GNU Stow

```
brew install stow
<!-- or -->
sudo apt-get install stow
```

## Installation

First, checkout the dotfiles repo in your $HOME directory using git

```
git clone https://github.com/skmpf/dotfiles.git ~/.dotfiles
cd .dotfiles
```

Update name and email in `.gitconfig`. You can also change the default editor if you don't like `vim` (use `code --wait` for VSCode).

> _Optional:_ update the directories you want to override in `.gitconfig` and update name and email in `.gitconfig_pro`.

Finally use GNU Stow to create symlinks

```
stow .
```

> Source: https://youtu.be/y6XCebnB9gs

## .zshrc

My `.zshrc` file is usable as is but to use its full potential you will need to install some additional packages and a Nerd Font.

### Nerd Fonts

https://www.nerdfonts.com/

### Zoxide

```bash
brew install zoxide
<!-- or -->
sudo apt-get install zoxide
```

### fzf

```bash
brew install fzf
<!-- or -->
sudo apt-get install fzf
```

Finally, source the `.zshrc` file

```bash
source ~/.zshrc
```

> Source: https://youtu.be/ud7YxC33Z3w
