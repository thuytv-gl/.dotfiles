source ~/.bash_colors
source ~/.bash_profile
source ~/.fzf/completion.zsh
source ~/.fzf/key-bindings.zsh
source ~/.dotfiles/.git_aliases
source /c/surecomp/surecomp.sh

COLOR_DEF=$'%f'
COLOR_USR=$'%F{39}'
COLOR_DIR=$'%F{41}'
COLOR_GIT=$'%F{39}'
NEWLINE=$'\n'

setopt PROMPT_SUBST
export PROMPT="${COLOR_USR}%n:${COLOR_DIR}%~${COLOR_DEF}${NEWLINE}~> "
export DOCKER_BUILDKIT=0

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

