# Ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"

# Load asdf
if [ -d /usr/local/opt/asdf ]; then
  . /usr/local/opt/asdf/asdf.sh
fi

# To use a local bin/ dir, mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

export -U PATH
