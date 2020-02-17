#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -f /Users/msvit/.ansible/env.sh ]; then
    . /Users/msvit/.ansible/env.sh
    # To disable ansible, comment out, but do not delete the following:
    # activate_ansible
fi

# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

# update PATH to include personal bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
