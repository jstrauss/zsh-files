eval "$(/opt/homebrew/bin/brew shellenv zsh)"

if [[ -x "$(command -v git)" ]]; then
    git config --global init.defaultBranch main
fi