# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# サーバ名を色付け@ピンク
PS1="[\u@\[\e[0;35m\]\h\[\e[0m\] \W]\\$ "


