case "$OSTYPE" in
	linux*)
		alias ls='ls --color=auto'
		alias o=xdg-open
		alias c='xclip -selection clipboard'
		;;
	darwin*)
		alias ls='ls -G'
		alias o=open
		alias c=pbcopy
		;;
	*)
		echo "Unsupported OS: $OSTYPE"
esac

save () {
    local cmd="$(fc -lnr -11 -2 | awk '{$1=$1};1' | fzf)"
    [[ -z "$cmd" ]] && return
    echo "alias $1='$cmd'" >> ~/.logbook
    source ~/.logbook
}

alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias u='cd ..'
alias l=exa
alias ll="l -l"
alias la="ll -a"
alias grep="grep --color=auto"
alias journalctl="journalctl -e"
alias vi='nvim -u NONE'
alias vim=nvim
alias vf='nvim $(fzf)'
alias cat=bat
alias find=fd
alias dbx=dropbox-cli

alias shortcuts="nvim $XDG_CONFIG_HOME/sxhkd/sxhkdrc"

# git
alias gs='git status'
__git_complete gs _git_status
alias gc='git commit'
__git_complete gc _git_commit
alias gca='git commit --amend'
__git_complete gca _git_commit
alias gcm='git commit -m'
__git_complete gcm _git_commit
alias gcan='git commit --amend --no-edit'
__git_complete gcan _git_commit
alias gcam='git commit -am'
__git_complete gcam _git_commit
alias ga='git add'
__git_complete ga _git_add
alias gau='git add -u'
__git_complete gau _git_add
alias gp='git push'
__git_complete gp _git_push
alias gpu='git push --set-upstream origin $(git branch --show-current)'
__git_complete gpu _git_push
alias gl='git log'
__git_complete gl _git_log
alias gb='git branch'
__git_complete gb _git_branch
alias gd='git diff'
__git_complete gd _git_diff
alias gdc='git diff --cached'
__git_complete gdc _git_diff
alias gsw='git switch'
__git_complete gsw _git_switch

# work
source ~/.bash_aliases_work
