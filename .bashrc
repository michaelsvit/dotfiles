#
# ~/.bashrc
#

safe_source() {
    if [ -f "$1" ]; then
        source "$1"
    fi
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

safe_source ~/.fzf.bash
safe_source /usr/share/git/completion/git-completion.bash
safe_source ~/.bash_aliases # must be sourced after git-completion

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
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
