# ==== Homebrew
if [[ $(uname) == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# ==== NVM
export NVM_DIR="$HOME/.nvm"
[ -s "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh" ] && \. "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh"  # This loads nvm
[ -s "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm" ] && \. "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ==== BINs
# Home
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# ==== Custom functions
source ~/bin/utilities-functions.sh

