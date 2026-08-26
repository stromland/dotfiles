# ==== Homebrew
if [[ $(uname) == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# ==== NVM
# export NVM_DIR="${HOMEBREW_PREFIX}/opt/nvm"
nvm_load() {
  if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]
  then
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  elif [ -s "/usr/local/opt/nvm/nvm.sh" ]
  then
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  else
    # nvm is not available
    :
  fi
}

# ==== BINs
# Home
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
# Go
export PATH="$PATH:$HOME/go/bin"
# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# ==== Custom functions
source ~/bin/utilities-functions.sh

# ==== ENVs
export EDITOR=nvim

