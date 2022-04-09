source /etc/zsh/zshrc.default.inc.zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=nvim

alias vi='nvim'

# tmux by default
if [ -z "$TMUX" ] && [ -n "$SSH_TTY" ] && [[ $- =~ i ]]; then
  tmux -CC attach-session || tmux -CC new-session
  exit
fi
