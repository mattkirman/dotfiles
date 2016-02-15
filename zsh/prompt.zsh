setopt PROMPT_SUBST

local user_host='%n@%m'
local root_prompt='%{$fg_bold[red]%}!!%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg[yellow]%}\xE2\x9A\xA1%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=") "

function return_code {
  echo "%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
}

function preexec {
  (( $#_elapsed > 10 )) && set -A _elapsed $_elapsed[-10,-1]
  typeset -ig _start=SECONDS
}

function precmd {
  (( _start >= 0 )) && set -A _elapsed $_elapsed $(( SECONDS-_start ))
   _start=-1
 }

function elapsed_time {
  elapsed=$_elapsed[-1]

  if [[ $elapsed -gt 0 ]]; then
    (( minutes = $elapsed / 60 ))
    (( seconds = $elapsed - (minutes * 60) ))

    time="${seconds}s"
    if [[ $minutes != "0" ]]; then
      time="${minutes}m ${time}"
    fi

    echo "%{$fg[yellow]%}[$time]%{$reset_color%}"
  fi
}

function timestamp {
  echo " %{$fg[cyan]%}$(date +"%H:%M:%S")%{$reset_color%}"
}

PROMPT='%{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)→ %{$reset_color%}'
RPROMPT='$(return_code)%{$reset_color%}$(elapsed_time)$(timestamp)'

if [[ $EUID -eq 0 ]]
then
  # Apply a warning when working as root
  PROMPT="$PROMPT$root_prompt "
fi
