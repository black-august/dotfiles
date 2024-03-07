export ZSH="$HOME/.oh-my-zsh"

HOSTNAME=$(hostname)

ZSH_CUSTOM=$HOME/.oh-my-zsh/

plugins=(
	git
  zsh-fzf-history-search
	colored-man-pages
)

source $ZSH/oh-my-zsh.sh

DISABLE_MAGIC_FUNCTIONS=true

# Must use Powerline font, for \uE0A0 to render.

if [ $HOSTNAME = "measles" ]; then
  PROMPT='$USER@%{$fg_bold[green]%}%m%{$reset_color%}:%{$fg_bold[yellow]%}%~%{$reset_color%} $(git_prompt_info)$(virtualenv_prompt_info) %{$fg_bold[red]%}%*%{$reset_color%}
$ '
elif [ $HOSTNAME = "malaria" ]; then
  PROMPT='$USER@%{$fg_bold[blue]%}%m%{$reset_color%}:%{$fg_bold[yellow]%}%~%{$reset_color%} $(git_prompt_info)$(virtualenv_prompt_info) %{$fg_bold[red]%}%*%{$reset_color%}
$ '
elif [ $HOSTNAME = "chickenpox" ]; then
  PROMPT='$USER@%{$fg_bold[green]%}%m%{$reset_color%}:%{$fg_bold[yellow]%}%~%{$reset_color%} $(git_prompt_info)$(virtualenv_prompt_info) %{$fg_bold[red]%}%*%{$reset_color%}
$ '
else
  PROMPT='$USER@%m:%{$fg_bold[yellow]%}%~%{$reset_color%} $(git_prompt_info)$(virtualenv_prompt_info) %{$fg_bold[red]%}%*%{$reset_color%}
$ '
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

export EDITOR="vim"
export TERM=screen-256color
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

function pb () {
  xclip -sel clipboard
}
  
alias fd=fdfind
