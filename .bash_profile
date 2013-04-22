source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh
export PS1='\n\[\e[1;30m\]\t\[\e[0m\] \[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[m\]\[\e[1;33m\] $(__git_ps1 "→ %s") \[\e[1;37m\]\n\[\e[0;31m\]\$\[\e[0m\] '

alias vim='mvim -v'
alias vi='mvim -v'

alias l='ls -Gh'
alias ll='ls -Glh'
alias la='ls -laGh'

alias h='cd ~'
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'

alias f='find . -type f | grep -v \\.git | grep'
