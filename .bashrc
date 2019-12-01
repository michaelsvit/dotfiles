#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

PS1='[\u@\h \W]\$ '

export EDITOR=nvim
export VISUAL=EDITOR
export XDG_CONFIG_HOME=~/.config

eval "$(fasd --init auto)"
eval "$(thefuck --alias)"
