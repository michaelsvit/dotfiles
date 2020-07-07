#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f /usr/share/bash-completion/completions/git ]] && source /usr/share/bash-completion/completions/git
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

PS1='[\u@\h \W]\$ '

export EDITOR=nvim
export VISUAL=$EDITOR
export XDG_CONFIG_HOME=~/.config
export HISTSIZE=1000000

if [ "$(uname)" == "Linux" ]; then
	[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

eval "$(fasd --init auto)"
#eval "$(pyenv init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

if [ -f /home/msvit/.ansible/env.sh ]; then
    . /home/msvit/.ansible/env.sh
    # To disable ansible, comment out, but do not delete the following:
    activate_ansible
fi
