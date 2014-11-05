# Set the terminal title (and preserve the cwd when opening new tabs)
precmd() {
  title "zsh" "%m" "%55<...<%~"
}

# Modify the prompt to contain git branch name if applicable
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo " %{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}"
  fi
}
setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

# Load our own completion functions
fpath=(~/.zsh/completion $fpath)

# Completion
autoload -U compinit
compinit

# Load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# Make color constants available
autoload -U colors
colors

# Enable colored output from ls, etc
export CLICOLOR=1

# History settings
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY     # save every command before it is executed
setopt SHARE_HISTORY          # retrieve the history file every time history is called upon
setopt EXTENDED_HISTORY       # add timestamps to history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Awesome cd movements from zshkit
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_MINUS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt CDABLE_VARS
DIRSTACKSIZE=5

# Enable extended globbing
setopt EXTENDED_GLOB

# Allow [ or ] whereever you want
unsetopt NOMATCH

# Menus & auto-complete setup

# Case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Colorize the auto-complete menu
zstyle ':completion:*' list-colors ''

# Highlight the currently selected item in the auto-complete menu
# and make the menu navigable by arrow keys
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
