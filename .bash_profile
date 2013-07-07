export PATH=/usr/local/bin:$PATH:$HOME/bin:/usr/local/share/npm/bin

source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh
export PS1='\n\[\e[1;30m\]\t\[\e[0m\] \[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[m\]\[\e[1;33m\] $(__git_ps1 "→ %s") \[\e[1;37m\]\n\[\e[0;31m\]\$\[\e[0m\] '

# colours for man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export HISTTIMEFORMAT='%F %T '

alias vim='mvim -v'
alias vi='mvim -v'

alias l='ls -Gh'
alias ll='ls -Glh'
alias la='ls -laGh'

alias h='cd ~'
alias ..='cd ..'
alias ...='cd ../..'

alias f='find . -type f | grep -v \\.git | grep'
alias ios='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

