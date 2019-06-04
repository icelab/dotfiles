setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY   # Save every command before it is executed
setopt SHARE_HISTORY        # Retrieve the history file every time history is called upon
setopt EXTENDED_HISTORY     # Add timestamps to history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
