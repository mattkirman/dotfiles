# Matt Kirman's dotfiles

A collection of opinionated settings for OS X, zsh, Ruby, Rails, git,
homebrew, rvm and vim. This repo was initially set up so I could easily
transfer settings between computers, but if you share a similar setup
you may find these useful.

Inspired by [holman/dotfiles](https://github.com/holman/dotfiles).

## Installation

* `git clone git://github.com/mattkirman/dotfiles` - this can be
  anywhere in your home directory (I keep mine in `~/Dropbox`)
* `cd dotfiles`
* `rake install`

The install task will symlink the appropriate files in `dotfiles` to
your home directory. Everything should be configured and tweaked from
within this directory though.

## Components

* **topic/*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
* **topic/*.symlink**: Any files ending in `*.symlink` get symlinked
  into your `$HOME`. These get symlinked when you run `rake install`.
* **topic/*.completion.sh**: Any files ending in `completion.sh` get
  loaded as autocomplete functions.

## Add-ons

* A departure from `holman/dotfiles`, I use [rvm](https://rvm.io/)
  rather than [rbenv](https://github.com/sstephenson/rbenv). If you have
  rvm installed the current ruby and gemset will show up in the right
  prompt.
* If you have [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
  installed then we will load it.
