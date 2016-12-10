# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# cask
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.cask/bin

export PATH

# alias
alias ll='ls -alF'
alias rm='rm -i'
alias ls='ls -F --color=auto'

# 重複履歴を無視
export HISTCONTROL=ignoredups

# 空白から始めたコマンドを無視
export HISTCONTROL=ignorespace

# コマンドは履歴保存対象から外す
export HISTIGNORE="fg*:bg*:history*:ls*"

# historyサイズ増量
export HISTSIZE=10000

# historyに時刻を追加
HISTTIMEFORMAT='%Y/%m/%d %T ';
export HISTTIMEFORMAT


