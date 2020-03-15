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

alias dotfiles='/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME'
alias u='cd ..'
alias l="ls -h"
alias ll="l -l"
alias la="ll -a"
alias grep="grep --color=auto"
alias journalctl="journalctl -e"
alias vi=nvim
alias vim=nvim
alias vf='nvim $(fzf)'
alias tmux="tmux -u"
alias cat=bat
alias find=fd
alias dbx=dropbox-cli

alias shortcuts="nvim $XDG_CONFIG_HOME/sxhkd/sxhkdrc"

# git
alias gs='git status'
alias gcm='git commit -m'
alias gcan='git commit --amend --no-edit'
alias gcam='git commit -am'
alias ga='git add'
alias gau='git add -u'
alias gp='git push'
alias gpu='git push --set-upstream'
alias gb='git branch'
alias gd='git diff'
alias gh='nohup o $(git config --get remote.origin.url) &> /dev/null &'
alias pr='hub pull-request'
