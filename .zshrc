autoload -U colors && colors
autoload -U compinit && compinit

setopt PROMPT_SUBST

HOSTNAME=$(hostname)

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt APPEND_HISTORY

git_prompt_info() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
        echo "%{$fg_bold[blue]%}git:(%{$fg[red]%}${branch}%{$fg[blue]%}) %{$fg[yellow]%}x%{$reset_color%} "
    else
        echo "%{$fg_bold[blue]%}git:(%{$fg[red]%}${branch}%{$fg[blue]%})%{$reset_color%} "
    fi
}

virtualenv_prompt_info() {
    [[ -n "$VIRTUAL_ENV" ]] && echo "(%{$fg[cyan]%}$(basename "$VIRTUAL_ENV")%{$reset_color%}) "
}

if [ "$HOSTNAME" = "measles" ]; then
    PROMPT='$USER@%{$fg_bold[green]%}%m%{$reset_color%}:%{$fg_bold[yellow]%}%~%{$reset_color%} $(git_prompt_info)$(virtualenv_prompt_info)%{$fg_bold[red]%}%*%{$reset_color%}
$ '
elif [ "$HOSTNAME" = "malaria" ]; then
    PROMPT='$USER@%{$fg_bold[blue]%}%m%{$reset_color%}:%{$fg_bold[yellow]%}%~%{$reset_color%} $(git_prompt_info)$(virtualenv_prompt_info)%{$fg_bold[red]%}%*%{$reset_color%}
$ '
elif [ "$HOSTNAME" = "chickenpox" ]; then
    PROMPT='$USER@%{$fg_bold[green]%}%m%{$reset_color%}:%{$fg_bold[yellow]%}%~%{$reset_color%} $(git_prompt_info)$(virtualenv_prompt_info)%{$fg_bold[red]%}%*%{$reset_color%}
$ '
else
    PROMPT='$USER@%m:%{$fg_bold[yellow]%}%~%{$reset_color%} $(git_prompt_info)$(virtualenv_prompt_info)%{$fg_bold[red]%}%*%{$reset_color%}
$ '
fi

# Colored man pages
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
export LESS_TERMCAP_ue=$'\e[0m'

export EDITOR="vim"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Plugins
[[ -f ~/.zsh/plugins/zsh-fzf-history-search/zsh-fzf-history-search.zsh ]] && \
    source ~/.zsh/plugins/zsh-fzf-history-search/zsh-fzf-history-search.zsh
[[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function pb() {
    xclip -sel clipboard
}

alias fd=fdfind
