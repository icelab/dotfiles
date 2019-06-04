# Set the terminal title (and preserve the cwd when opening new tabs)
precmd() {
  title "zsh" "%m" "%55<...<%~"
}
