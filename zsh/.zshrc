# https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll="eza --long --git --header"
alias n="nvim"
alias lg="lazygit"
alias ss="osascript -e 'tell application \"spotify\" to pause'"
alias sr="osascript -e 'tell application \"spotify\" to play'"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source /Users/jonas/.docker/init-zsh.sh || true # Added by Docker Desktop

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$HOME/go/bin
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"

# Created by `pipx` on 2023-11-10 14:47:13
export PATH="$PATH:/Users/jonas/.local/bin"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH=$PATH:~/roc_nightly-macos_apple_silicon-2024-01-13-79ed84fff3e

# opam configuration
[[ ! -r /Users/jonas/.opam/opam-init/init.zsh ]] || source /Users/jonas/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
