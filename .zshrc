# NATIVE PROMPT: export PS1="%n@%m %1~ %# "
export PS1="%F{green}%* %F{cyan}%~ %(?.%F{white}.%F{red})\$%f "

autoload -U colors && colors

# ALIASES
alias ~='cd ~'
alias -- -='cd -'
alias dev='cd ~/web'

alias python='python3'
alias pip='pip3'

alias reload='source ~/.zshrc'

alias ls='gls --group-directories-first --color=auto'
alias ll='ls -lF'
alias la='ls -lAF'
alias l='ls -CF'
alias lsh='ls -lF -d .*'
alias lsd='ls -lF .*/ */'

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
# Before using, make sure to set your git username and email to match your GitHub account, otherwise you won't be able to push to GitHub.
-git config --global user.name "[insert_your_github_name]"
-git config --global user.email "[insert_your_github_email]"

# SET PROMPT FUNCTION
source ~/.zsh_prompt

# LOCAL AI SPECIFIC STUFF

# Standard 128k High-Precision Configuration
# Use for everyday code & analysis
qwen_128k() {
  llama-server \
    -hf unsloth/Qwen3.6-27B-GGUF:UD-Q4_K_XL \
    -c 131072 \
    --cache-type-k q8_0 \
    --cache-type-v q8_0 \
    --cache-ram 24576 \
    --flash-attn on \
    --temp 0.6 \
    --top-p 0.95 \
    --top-k 20 \
    --chat-template-kwargs '{"preserve_thinking": true}' \
    --host 127.0.0.1 \
    --threads 8 \
    --port 8080
}

# Extended 160k Maximum Capacity Configuration
# Use for large-context tasks where precision is less critical (massine file ingestion; long document analysis)
qwen_160k() {
  llama-server \
    -hf unsloth/Qwen3.6-27B-GGUF:UD-Q4_K_XL \
    -c 163840 \
    --cache-type-k q4_0 \
    --cache-type-v q4_0 \
    --cache-ram 24576 \
    --flash-attn on \
    --temp 0.6 \
    --top-p 0.95 \
    --top-k 20 \
    --chat-template-kwargs '{"preserve_thinking": true}' \
    --host 127.0.0.1 \
    --threads 8 \
    --port 8080
}

# SERVE QWEN-IMAGE LOCALLY WITH COMFYUI
alias serve_qimage='python3 ~/web/ComfyUI/main.py'

# GO TO DIRECTORY FOR OPENCODE LOGS
alias localai='cd ~/.local/share/opencode'
