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

GNU Stow handles the symlinking of my dotfiles.

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

> _Optional:_ update the directories you want to override in `.gitconfig` and update name and email in `.gitconfig_work`.

Finally use GNU Stow to create symlinks

```
stow .
```

> Source: https://youtu.be/y6XCebnB9gs

## Customization

My `.zshrc` file is usable as is but to use its full potential you will need to install some additional packages.

### Nerd Fonts

Nerd Fonts are a collection of fonts that include icons and symbols for programming languages, file types, and other common characters: https://www.nerdfonts.com/

### Oh My Posh

Oh My Posh is a collection of themes and plugins for any terminal: https://ohmyposh.dev/

```bash
brew install jandedobbeleer/oh-my-posh/oh-my-posh
<!-- or -->
curl -s https://ohmyposh.dev/install.sh | bash -s
```

### Zoxide

Zoxide is a command line file manager that allows you to quickly navigate and open files in your terminal.

```bash
brew install zoxide
<!-- or -->
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

### fzf

fzf is a command line fuzzy finder that allows you to quickly find files and directories in your terminal.

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

### Claude

> Source: https://github.com/citypaul/.dotfiles
