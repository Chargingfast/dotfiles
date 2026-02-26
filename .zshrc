# 11/5/23 TTurner: adding directory colors from ls

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd


#11/5/23 Tturner Adding color coded git prompter

#autoload -Uz compinit && compinit
#autoload -Uz add-zsh-hook
#autoload -Uz vcs_info

#add-zsh-hook precmd vcs_info

#zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:*' formats " %F{cyan}%c%u(%b)%f"
#zstyle ':vcs_info:*' actionformats " %F{cyan}%c%u(%b)%f %a"
#zstyle ':vcs_info:*' stagedstr "%F{green}"
#zstyle ':vcs_info:*' unstagedstr "%F{red}"
#zstyle ':vcs_info:*' check-for-changes true

#zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

#+vi-git-untracked() {
#  if git --no-optional-locks status --porcelain 2> /dev/null | grep -q "^??"; then
#    hook_com[staged]+="%F{red}"
#  fi
#}

#setopt PROMPT_SUBST
#export PROMPT='%n@%m %~ $vcs_info_msg_0_ %# '


# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~


# Set to superior editing mode

set -o vi

export VISUAL=nvim
export EDITOR=nvim
export TERM="tmux-256color"

# Directories

export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$REPOS/dotfiles"
export LAB="$REPOS/lab"
export SCRIPTS="$DOTFILES/scripts"
export ICLOUD="$HOME/icloud"
export ZETTELKASTEN="$HOME/Zettelkasten"

# ~~~~~~~~~~~~~~ Alias Config ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias k='kubectl'
alias kgp='kubectl get pods'
alias sb='cd /Users/timturner/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Second\ Brain'
alias scripts='cd $SCRIPTS'
alias repo='cd $REPOS'
alias lab='cd $REPOS/lab'
alias lg='lazygit'
alias gs='git status'
alias gp='git pull'
alias la='ls -lathr'
alias c='clear'
alias e='exit'
alias config='cd /Users/timturner/.config'

# Repos

alias lab='cd $LAB'
alias dot='cd $GHREPOS/dotfiles'
alias repos='cd $REPOS'
alias ghrepos='cd $GHREPOS'
alias gr='ghrepos'
alias cdgo='cd $GHREPOS/go/'
alias rob='cd $REPOS/github.com/rwxrob'

# ls

alias ls='ls --color=auto'
alias la='ls -lathr'



# ~~~~~~~~~~~~~~~ Zshell History ~~~~~~~~~~~~~~~~~~~~~~~~
HISTSIZE=50000
SAVEHIST=100000
HISTFILE=~/.zsh_history

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~


setopt extended_glob null_glob

path=(
    $path                           # Keep existing PATH entries
    /opt/homebrew/bin
    $HOME/bin
    $HOME/.local/bin
    $HOME/dotnet
    $SCRIPTS
    $HOME/.krew/bin
    $HOME/.rd/bin                   # Rancher Desktop
    /home/vscode/.local/bin         # Dev Container Specifics
    /root/.local/bin                # Dev Container Specifics
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH


# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~


PURE_GIT_PULL=0


if [[ "$OSTYPE" == darwin* ]]; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
else
  fpath+=($HOME/.zsh/pure)
fi

autoload -U promptinit; promptinit
prompt pure




# ~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~~~~~~~~~~~


fpath+=~/.zfunc

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select

# ~~~~~~~~~~~~~~~ Sourcing ~~~~~~~~~~~~~~~~~~~~~~~~


#source "$HOME/.privaterc"
source <(fzf --zsh)
source <(kubectl completion zsh)
eval "$(direnv hook zsh)"

fpath+=~/.zfunc; autoload -Uz compinit; compinit


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/timturner/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# OpenClaw Completion
source "/Users/timturner/.openclaw/completions/openclaw.zsh"
