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
setopt HIST_REDUCE_BLANKS     # remove superfluous blanks from each command
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

# Handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# Load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# Load nodenv if available
if which nodenv &>/dev/null ; then
  eval "$(nodenv init -)"
fi

# Load dotfiles scripts
export PATH="$HOME/.bin:$PATH"

# To use a local bin/ dir, mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
