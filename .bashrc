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
prompt_cmd() {
    # window title
    printf '\033]0;%s\007' "main"

    # --- virtual-env ---
    venv_part=""
    if [[ -n $VIRTUAL_ENV ]]; then
        venv_base=${VIRTUAL_ENV##*/}
        venv_dir=${VIRTUAL_ENV%/*}
        if [[ $venv_dir == $PWD ]]; then
            venv_part="(\[\e[1;32m\]$venv_base\[\e[0m\])"
        else
            venv_part="(\[\e[1;32m\]${venv_dir##*/}/$venv_base\[\e[0m\])"
        fi
    fi

    # --- git ---
    git_part=$(__git_ps1 '(\[\e[1;34m\]%s\[\e[0m\])')

    # assemble prompt
    PS1="${venv_part}${git_part} \[\e[35m\]\W\[\e[0m\]  \[\e[1;36m\]→ \[\e[0m\] "
}
PROMPT_COMMAND=prompt_cmd

# → (.venv)(main) spanner
# PS1="\[\e[1;36m\]→ \[\e[0m\]${venv_part}${git_part} \[\e[35m\]\W\[\e[0m\] "

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Custom alias shortcuts (adjust paths if needed)
alias config='cd ~/config'
alias vault='cd ~/Documents/master-00/'
alias v='nvim'
alias epa='cd ~/workspace/epworth-automation/'
alias usdlf='cd ~/workspace/usdlf/'
alias workspace='cd ~/workspace/'

# Set default editor
export EDITOR=nvim

# Editor
export EDITOR=nvim
#alias claude="/home/oqqzn/.claude/local/claude"
export BASH_SILENCE_DEPRECATION_WARNING=1
