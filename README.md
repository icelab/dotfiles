# Icelab Dotfiles

## Requirements

Set zsh as your login shell:

```sh
chsh -s $(which zsh)
```

## Install

Check out the dotfiles:

```sh
git clone https://github.com/icelab/dotfiles.git ~/.dotfiles-icelab
```

Install the dotfiles:

```sh
~/.dotfiles-icelab/bin/setup
```

## Make your own customizations

Put your customizations in dotfiles ending with `.local`:

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

## Combine with your personal dotfiles

The `rcrc` configuration in these dotfiles looks for a separate
`~/.dotfiles-personal` directory. If you create this directory, fill it with
dotfiles, and then run `rcup`, those personal dotfiles will be used in
combination with (and in preference to) these ones. See [Tim's
dotfiles](https://github.com/timriley/dotfiles) as an example.

## Credits

Thanks to Thoughtbot for [rcm](https://github.com/thoughtbot/rcm) and [their own
dotfiles](https://github.com/thoughtbot/dotfiles), which formed the basis for
this collection.

These dotfiles are maintained by [Icelab](http://icelab.com.au/).
