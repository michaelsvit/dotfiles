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
export VISUAL=$EDITOR
export XDG_CONFIG_HOME=~/.config

if [ "$(uname)" == "Linux" ]; then
	[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

eval "$(fasd --init auto)"
#eval "$(pyenv init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
