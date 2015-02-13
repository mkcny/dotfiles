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

alias ls='ls -GhF'
alias l='ls'
alias ll='ls -l'
alias la='ls -la'

alias h='cd ~'
alias ..='cd ..'
alias ...='cd ../..'

# jump to the root folder of a git repo
alias a='cd $(git rev-parse --show-cdup)'

function f () {
  find . -type f ! -path "*/.git/*" ! -path "*/.vagrant/*" ! -path "*/node_modules/*" ! -name "*.pyc" \
    | grep "$1"
}

alias ios='open /Applications/Xcode.app/Contents/Developer/Applications/iOS\ Simulator.app'

FILE=$HOME/.bash_profile.local && test -f $FILE && source $FILE
