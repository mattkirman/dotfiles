setopt PROMPT_SUBST

local user_host='%n@%m'
local root_prompt='%{$fg_bold[red]%}!!%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg[yellow]%}\xE2\x9A\xA1\xEF\xB8\x8E%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=") "

function return_code {
  echo "%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
}

function timestamp {
  echo " %{$fg[cyan]%}$(date +"%H:%M:%S")%{$reset_color%}"
}

PROMPT='%{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)→ %{$reset_color%}'
RPROMPT='$(return_code)%{$reset_color%}$(timestamp)'

if [[ $EUID -eq 0 ]]
then
  # Apply a warning when working as root
  PROMPT="$PROMPT$root_prompt "
fi
