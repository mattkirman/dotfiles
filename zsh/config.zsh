autoload -U $DOTFILES_DIR/zsh/functions/*(:t)
autoload -U zmv

setopt extendedglob
setopt HIST_IGNORE_SPACE

bindkey "^[[3~" delete-char
