source /etc/zsh/zshrc.default.inc.zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=vi

alias rgit="rg -g '!*test*' -g '!*spec*' "

export FZF_DEFAULT_COMMAND="rg --files"

# tmux by default
if [ -z "$TMUX" ] && [ -n "$SSH_TTY" ] && [[ $- =~ i ]]; then
  tmux -CC attach-session || tmux -CC new-session
  exit
fi
