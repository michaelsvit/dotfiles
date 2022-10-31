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

if [[ $(uname) = 'Darwin' ]]; then
    safe_source /usr/local/etc/bash_completion.d/git-completion.bash
elif [ "$(uname)" == "Linux" ]; then
    append_to_path "$HOME/homebrew/bin"
    safe_source /usr/share/bash-completion/completions/git
    safe_eval "$(brew --prefix)"/bin/brew shellenv
fi

safe_source ~/.bash_aliases
safe_source ~/.fzf.bash
safe_source ~/.cargo/env
safe_source ~/.bootstrap_rc

safe_eval zoxide init bash
