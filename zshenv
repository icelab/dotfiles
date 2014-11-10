# Install Homebrew cask packages in /Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Load rbenv if available
if which rbenv &>/dev/null ; then
  eval "$(rbenv init - --no-rehash)"
fi

# Add the local nodenv installation to the path
export PATH="$HOME/.nodenv/bin:$PATH"

# Load nodenv if available
if which nodenv &>/dev/null ; then
  eval "$(nodenv init -)"
fi

# Load dotfiles scripts
export PATH="$HOME/.bin:$PATH"

# To use a local bin/ dir, mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
