# NATIVE PROMPT: export PS1="%n@%m %1~ %# "
export PS1="%F{green}%* %F{cyan}%~ %(?.%F{white}.%F{red})\$%f "

autoload -U colors && colors

# ALIASES
alias ~='cd ~'
alias -- -='cd -'

alias python='python3'
alias pip='pip3'

alias reload='source ~/.zshrc'

alias ll='ls -lF'
alias la='ls -laF'
alias l='ls -CF'
alias lsh='ls -lF -d .*'
alias lsd='ls -lF | grep --color=auto "^d"'
alias ls='ls -G'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='clear'
alias h='history'

alias sudo='sudo '

alias cleanup='rm -rf ~/.Trash/*; find . -name "*.DS_Store" -type f -ls -delete'

# GIT ALIASES
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -am'
alias gco='git checkout'
alias gcb='git switch -c'
alias gl='git log --oneline --graph --decorate'
alias gp='git push'
alias gpl='git pull'
alias gst='git status'
alias gss='git status -s'
alias gssu='git status -s -uall'
alias gssm='git status -s -uno'

function activate() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "Virtual environment already activated. Deactivate this one first."
    elif [[ "$#" -gt 0 ]]; then
        echo "Activating virtual environment..."
        eval "source ~/$1/bin/activate"
    else
        echo "Must specify name of virtual environment to activate. Usage: activate <venv_name>"
    fi
}

# GIT CONFIG
git config --global user.name "[insert_your_github_name]"
git config --global user.email "[insert_your_github_email]"

# SET PROMPT FUNCTION
source ~/.zsh_prompt