source ~/.bash_colors
source ~/.bash_profile
source ~/bin/completions/zoxide.bash
source ~/bin/completions/exercism_completion.bash
source ~/.fzf/completion.bash
source ~/.fzf/key-bindings.bash
source ~/.dotfiles/.git_aliases

# source "/c/Program Files/Git/mingw64/share/git/completion/git-prompt.sh"
# source "/c/Program Files/Git/mingw64/share/git/completion/git-completion.bash"
#source ~/.npm_cre

tmux0 () {
    TMUX="command tmux ${@}"
    SHELL=/usr/bin/bash script -qO /dev/null -c "eval $TMUX";
}

__git_ps2 () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1=$NewLine$BGreen'\u'$White':'$Yellow$PathShort$Cyan''" [$Time12h]"$Color_Off'\n~> '
eval "$(zoxide init bash)"
export DOCKER_BUILDKIT=0
