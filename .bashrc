# ~/.bashrc: executed by bash(1) for non-login shells.

# Load sensitive environment variables
[ -f ~/.env ] && source ~/.env

case $- in
    *i*) ;;
    *) return;;
esac

# History settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=25000
HISTFILESIZE=25000
shopt -s checkwinsize

# Enable color support for common commands
if command -v dircolors >/dev/null 2>&1; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls -G'  # macOS alternative
fi


# Git prompt support
if [ -f "/opt/homebrew/etc/bash_completion.d/git-prompt.sh" ]; then
    source "/opt/homebrew/etc/bash_completion.d/git-prompt.sh"
fi

# Git prompt settings
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_DESCRIBE_STYLE="branch"

# Prompt (includes venv and git)
PROMPT_COMMAND='
    echo -ne "\033]0;main\007";

    # Virtualenv logic
    if [ -n "$VIRTUAL_ENV" ]; then
        venv_base="$(basename "$VIRTUAL_ENV")"
        venv_dir="$(dirname "$VIRTUAL_ENV")"
        current_dir="$PWD"

        if [ "$venv_dir" = "$current_dir" ]; then
            venv_part="(\[\e[1;32m\]${venv_base}\[\e[0m\])"
        else
            venv_parent="$(basename "$venv_dir")"
            venv_part="(\[\e[1;32m\]${venv_parent}/${venv_base}\[\e[0m\])"
        fi
    else
        venv_part=""
    fi

    # Git branch
    git_part=$(__git_ps1 "(\[\e[1;34m\]%s\[\e[0m\])")

    # Final PS1
    PS1="\[\e[1;36m\]→ \[\e[0m\]${venv_part}${git_part} \[\e[35m\]\W\[\e[0m\] "
'


# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias v='nvim'

# Custom alias shortcuts (adjust paths if needed)
alias config='cd ~/dotfiles'
alias vault='cd ~/Documents/master-00/'

# Set default editor
export EDITOR=nvim

# Editor
export EDITOR=nvim
#alias claude="/home/oqqzn/.claude/local/claude"
export BASH_SILENCE_DEPRECATION_WARNING=1
