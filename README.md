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


rcup -d ~/.dotfiles-icelab  -x README.md -x LICENSE
```

## Credits

Thanks to Thoughtbot for [their dotfiles](https://github.com/thoughtbot/dotfiles), which formed the basis for this collection, and [rcm](https://github.com/thoughtbot/rcm).

These dotfiles are maintained by [Icelab](http://icelab.com.au/).
