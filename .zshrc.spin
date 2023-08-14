source /etc/zsh/zshrc.default.inc.zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=nvim

alias rgit="rg -g '!*test*' -g '!*spec*' "
alias vi='nvim'

export FZF_DEFAULT_COMMAND="rg --files"
export TERM='xterm-256color'

# tmux by default
if [ -z "$TMUX" ] && [ -n "$SSH_TTY" ] && [[ $- =~ i ]]; then
  tmux -CC attach-session || tmux -CC new-session
  exit
fi
