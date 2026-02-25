# OS Detection
if [[ "$OSTYPE" == "darwin"* ]]; then
    IS_MAC=true
else
    IS_MAC=false
fi

# Load Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load Homebrew (macOS only)
if [[ "$IS_MAC" == true ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Load plugins
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-you-should-use
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=$HOME/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Load aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# Git upstream branch syncer
# Usage: gsync master (checks out master, pull upstream, push origin)
gsync() {
 if [[ ! "$1" ]] ; then
     echo "You must supply a branch."
     return 0
 fi
 BRANCHES=$(git branch --list $1)
 if [ ! "$BRANCHES" ] ; then
    echo "Branch $1 does not exist."
    return 0
 fi
 git checkout "$1" && \
 git pull upstream "$1" && \
 git push origin "$1"
}

# Homebrew auto-update (macOS only)
if [[ "$IS_MAC" == true ]]; then
  export HOMEBREW_AUTO_UPDATE_SECS=604800
fi

export export PATH=$PATH:$HOME/.local/bin

# Shell integrations
# Source fzf key bindings and completion
if [[ "$IS_MAC" == true ]]; then
  # macOS with Homebrew
  source <(fzf --zsh)
else
  # Linux - use the setup that comes with package installation
  source /usr/share/fzf/key-bindings.zsh 2>/dev/null
  source /usr/share/fzf/completion.zsh 2>/dev/null
fi
eval "$(oh-my-posh init zsh --config $HOME/.ohmyposh.toml)"
if [[ "$CLAUDECODE" != "1" ]]; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# opencode
export OPENCODE_CONFIG_DIR=$HOME/.agents/
export PATH=$HOME/.opencode/bin:$PATH

# OpenClaw Completion
source "$HOME/.openclaw/completions/openclaw.zsh"

export PATH=$PATH:$HOME/.maestro/bin
