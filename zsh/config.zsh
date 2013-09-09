fpath=($DOTFILES_DIR/zsh/completion $DOTFILES_DIR/zsh/functions $fpath)

autoload -U $DOTFILES_DIR/zsh/functions/*(:t)
autoload -U zmv

setopt extendedglob
setopt HIST_IGNORE_SPACE

bindkey "^[[3~" delete-char
