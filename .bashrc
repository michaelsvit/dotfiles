#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

safe_source() {
    if [[ -f "$1" ]]; then
        source "$1"
    fi
}

PS1='[\u@\h \W]\$ '

export EDITOR=nvim
export VISUAL=$EDITOR
export XDG_CONFIG_HOME=~/.config
export HISTSIZE=1000000
export GPG_TTY=$(tty)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export PATH="$HOME/bin:$PATH"

if [[ -f /home/msvit/.ansible/env.sh ]]; then
    export ANSIBLE_DONT_CHANGE_PROMPT=1
    . /home/msvit/.ansible/env.sh
    # To disable ansible, comment out, but do not delete the following:
    activate_ansible
fi

if [[ $(uname) = 'Darwin' ]]; then
    [[ -f /usr/local/etc/bash_completion.d/git-completion.bash ]] && source /usr/local/etc/bash_completion.d/git-completion.bash
    export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
elif [ "$(uname)" == "Linux" ]; then
	[[ -f /home/linuxbrew/.linuxbrew/bin/brew ]] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    [[ -f /usr/share/bash-completion/completions/git ]] && source /usr/share/bash-completion/completions/git
fi

[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

eval "$(fasd --init auto)"
