export PATH=$HOME/bin:$HOME/go/bin:$PATH:/usr/local/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export FZF_DEFAULT_COMMAND="rg --files"
export EDITOR=nvim
alias vi=nvim

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
export PATH="/usr/local/sbin:$PATH"
