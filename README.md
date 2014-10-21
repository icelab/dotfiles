# Icelab Dotfiles

## Requirements

Set zsh as your login shell:

```sh
chsh -s $(which zsh)
```

## Install

Install [rcm](https://github.com/thoughtbot/rcm):

```sh
brew tap thoughtbot/formulae
brew install rcm
```

Check out the dotfiles:

```sh
git clone https://github.com/icelab/dotfiles.git ~/.dotfiles-icelab
```

Install the dotfiles:

```sh
env RCRC=~/.dotfiles-icelab/rcrc rcup
```

## Make your own customizations

Put your customizations in dotfiles appended with `.local`:

* `~/.aliases.local`
* `~/.gitconfig.local`
* `~/.zshrc.local`

For example, your `~/.aliases.local` might look like this:

```
# Personal git shortcuts
alias gs='git status'
alias gd='git diff'
```

Your `~/.gitconfig.local` might look like this:

```
[user]
  name = Tim Riley
  email = tim@icelab.com.au
```

Your `~/.zshenv.local` might look like this:

```
# Use Sublime Text as default editor
export VISUAL=subl
export EDITOR=$VISUAL
```

## Credits

Thanks to Thoughtbot for [their dotfiles](https://github.com/thoughtbot/dotfiles), which formed the basis for this collection, and [rcm](https://github.com/thoughtbot/rcm).

These dotfiles are maintained by [Icelab](http://icelab.com.au/).
