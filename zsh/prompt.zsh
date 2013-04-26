local user_host='%n@%m'
local root_prompt='%{$fg_bold[red]%}!!%{$reset_color%}'

PROMPT='%{$fg[blue]%}${user_host} %{$fg_bold[green]%}%{$reset_color%}%c $(git_prompt_info)→ % %{$reset_color%}'

if [[ $EUID -eq 0 ]]
then
  # Apply a warning when working as root
  PROMPT="$PROMPT$root_prompt "
fi

function return_code {
  echo "%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
}

function rbenv_version {
  if which rbenv > /dev/null;
  then
    echo `rbenv version-name`
  fi
}

RPROMPT='$(return_code)%{$fg[cyan]%}$(rbenv_version)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg[yellow]%}\xE2\x9A\xA1\xEF\xB8\x8E%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=") "
