export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/local/share/npm/bin

source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh

PS1_TIME='\[\e[1;30m\]\t\[\e[0m\]'
PS1_USER_AT_HOST='\[\e[1;32m\]\u@local\[\e[0m\]'
PS1_PATH='\[\e[1;34m\]\w\[\e[m\]\[\e[1;33m\]'
PS1_GIT_BRANCH='$(__git_ps1 "→ %s")'
PS1_PROMPT='\[\e[1;37m\]\n\[\e[0;31m\]\$\[\e[0m\]'

export PS1="\n$PS1_TIME $PS1_USER_AT_HOST:$PS1_PATH $PS1_GIT_BRANCH $PS1_PROMPT "

export EDITOR=/usr/local/bin/nvim

# colours for man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export HISTTIMEFORMAT='%F %T '

alias ls='ls -h --color=auto'
alias vi='nvim'

if [[ `uname` == "Darwin" ]]; then
  alias ls='ls -GhF'
fi

alias ber='bundle exec rake'
alias bert='bundle exec rake test'
alias berc='bundle exec rails console'
alias be='bundle exec'
alias bi='bundle install'

# jump to the root folder of a git repo
alias a='cd $(git rev-parse --show-cdup)'

function f () {
  find . -type f ! -path "*/.git/*" ! -path "*/.vagrant/*" ! -path "*/node_modules/*" ! -name "*.pyc" \
    | grep "$1"
}

FILE=$HOME/.bash_profile.local && test -f $FILE && source $FILE
