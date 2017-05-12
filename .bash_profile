# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:/usr/local/bin
export PATH

# for cask
export EMACS=emacs

# cask
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.cask/bin

export PATH

# alias
alias ll='ls -alF'
alias rm='rm -i'
alias ls='ls -F --color=auto'
alias ekill='emacsclient -e "(kill-emacs)"'
alias e='emacsclient -a ""'
#alias emacs='emacsclient -a ""'

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


export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
type pyenv >/dev/null 2>&1
if [ $? = 0 ]; then
    eval "$(pyenv init -)"
fi

