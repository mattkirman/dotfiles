# smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# jobs
setopt long_list_jobs

# pager
export PAGER="less"
export LESS="-R"

export LC_CTYPE=$LANG
