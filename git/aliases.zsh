alias g='git'
compdef g=git

alias gst='git status'
compdef _git gst=git-status

alias gco='git checkout'

alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

alias gc='git commit -v'
compdef _git gc=git-commit

alias gca='git commit -v -a'
compdef _git gc=git-commit

alias gcm='git checkout master'

alias gr='git remote'
compdef _git gr=git-remote

alias gb='git branch'
compdef _git gb=git-branch

alias gba='git branch -a'
compdef _git gba=git-branch

alias gcount='git shortlog -sn'
compdef gcount=git

alias gcl='git config --list'

alias glg='git log --stat --max-count=5'
compdef _git glg=git-log

alias glgg='git log --graph --max-count=5'
compdef _git glgg=git-log

alias glgga='git log --graph --decorate --all'
compdef _git glgga=git-log

alias ga='git add'
compdef _git ga=git-add

alias gm='git merge'
compdef _git gm=git-merge
