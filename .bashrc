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

append_to_path() {
    if [[ -n "$1" ]]; then
        export PATH="$1:$PATH"
    fi
}

PS1='[\u@\h \W]\$ '

export EDITOR=nvim
export VISUAL=$EDITOR
export XDG_CONFIG_HOME=~/.config
export HISTSIZE=1000000
export GPG_TTY=$(tty)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

append_to_path ~/bin

if [[ -f /home/msvit/.ansible/env.sh ]]; then
    export ANSIBLE_DONT_CHANGE_PROMPT=1
    . /home/msvit/.ansible/env.sh
    # To disable ansible, comment out, but do not delete the following:
    activate_ansible
fi

if [[ $(uname) = 'Darwin' ]]; then
    safe_source /usr/local/etc/bash_completion.d/git-completion.bash
    append_to_path /Library/Frameworks/Python.framework/Versions/3.8/bin
elif [ "$(uname)" == "Linux" ]; then
    safe_source /usr/share/bash-completion/completions/git
fi

safe_source ~/.bash_aliases
safe_source ~/.fzf.bash

eval "$(fasd --init auto)"
