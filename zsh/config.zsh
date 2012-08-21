fpath=($DOTFILES_DIR/zsh/functions $fpath)

autoload -U $DOTFILES_DIR/zsh/functions/*(:t)
autoload -U zmv

setopt extendedglob

bindkey "^[[3~" delete-char
