# Matt Kirman's dotfiles

A collection of opinionated settings for OS X, zsh, Ruby, Rails, git,
homebrew, rbenv and vim. This repo was initially set up so I could easily
transfer settings between computers, but if you share a similar setup
you may find these useful.

Inspired by [holman/dotfiles](https://github.com/holman/dotfiles).

## Installation

* `git clone git://github.com/mattkirman/dotfiles` - this can be
  anywhere in your home directory (I keep mine in `~/Dropbox` for those
  rare occasions where I've got Dropbox access but no Git)
* `cd dotfiles`
* `rake install`

The install task will symlink the appropriate files in `dotfiles` to
your home directory. Everything should be configured and tweaked from
within this directory though.

## Components

* **topic/*.zsh**: Any files ending in `.zsh` get loaded into your
  zsh environment.
* **topic/*.symlink**: Any files ending in `*.symlink` get symlinked
  into your `$HOME`. These get symlinked when you run `rake install`.
  You're given the option to back up or skip symlinks if a conf file
  already exists.
* **topic/*.completion.sh**: Any files ending in `completion.sh` get
  loaded as autocomplete functions.

## Add-ons

* If you have installed [rbenv](https://github.com/sstephenson/rbenv)
  then the current ruby is displayed in the right prompt.
* If you have [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
  installed then that's loaded as well.
* Git repository branch status is displayed in the left prompt (when
  inside a repository).

## Aliases/Functions

### cURL

* `headers URL` - Display request/response headers for a URL.

### Git

* `gco` - Alias of `git checkout`.
* `git count` - Show the number of commits made to a repository.
* `gl` - Generates a pretty Git log with branch trees.
* `git remote-create BRANCH_NAME [REMOTE]` - Creates a new local topic branch as well as
  a corresponding remote branch based on the branch you currently have
  checked out.
* `git remote-delete BRANCH_NAME [REMOTE]` - Deletes the local branch then the local branch.
* `git remote-publish` - Publishes an existing local topic branch to the
  remote server.
* `git remote-rename BRANCH_NAME [REMOTE]` - Rename a remote branch and
  its local tracking branch.
* `git remote-track BRANCH_NAME [REMOTE]` - Track an existing remote
  branch locally and checkout the branch.

### Tmux

* `tmx` - Share Tmux windows between sessions. This allows you to share
  windows without forcing you to share the same view.
* `tssh HOST` - Open a remote Tmux session on HOST over SSH. To close
  the SSH session just detach Tmux.

### Shell

* `e FILE` - Opens a file in your `$EDITOR`.
* `extract ARCHIVE` - Extracts an archive using the correct command
  based on the file extension.
* `reload!` - Made any changes to your config? `reload!` is your friend.
