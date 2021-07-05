source /home/msvit/.bootstrap_rc
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

safe_eval() {
    if [[ -x $(command -v "$1") ]]; then
        eval "$($@)"
    fi
}

append_to_path() {
    if [[ -d "$1" ]]; then
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
safe_source ~/.env

append_to_path ~/bin
append_to_path /opt/intellij/bin

if [[ -f /home/msvit/.ansible/env.sh ]]; then
    . /home/msvit/.ansible/env.sh
    # To disable ansible, comment out, but do not delete the following:
    activate_ansible
    safe_source ~/.p4env
fi

if [[ $(uname) = 'Darwin' ]]; then
    safe_source /usr/local/etc/bash_completion.d/git-completion.bash
    append_to_path /Library/Frameworks/Python.framework/Versions/3.8/bin
elif [ "$(uname)" == "Linux" ]; then
    safe_source /usr/share/bash-completion/completions/git
    safe_eval /home/linuxbrew/.linuxbrew/bin/brew shellenv
fi

safe_source ~/.bash_aliases
safe_source ~/.fzf.bash
safe_source ~/.cargo/env
safe_source ~/.bootstrap_rc

safe_eval fasd --init auto


# save tmux shell history
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups
# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
