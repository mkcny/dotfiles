export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/local/share/npm/bin

source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh

PS1_TIME='\[\e[1;30m\]\t\[\e[0m\]'
PS1_USER_AT_HOST='\[\e[1;32m\]\u\[\e[0m\]'
PS1_PATH='\[\e[1;34m\]\w\[\e[m\]\[\e[1;33m\]'
PS1_GIT_BRANCH='$(__git_ps1 "→ %s")'
PS1_PROMPT='\[\e[1;37m\]\n\[\e[0;31m\]\$\[\e[0m\]'

export PS1="\n$PS1_TIME $PS1_PATH $PS1_GIT_BRANCH $PS1_PROMPT "

export EDITOR=/usr/local/bin/nvim

export HISTTIMEFORMAT='%F %T '

alias ls='ls -h --color=auto'

if [[ `uname` == "Darwin" ]]; then
  alias ls='ls -GhF'
fi

alias ag='ag --color-path "32" --color-match "31" --color-line-number "34"'

function f () { find . -type f | grep -i "$*"; }

export FZF_DEFAULT_COMMAND='find . -type f'

# lets ctrl-q be mapped in vim
stty start undef

FILE=$HOME/.bash_profile.local && test -f $FILE && source $FILE
