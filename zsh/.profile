# ==== Homebrew
if [[ $(uname) == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# ==== NVM
export NVM_DIR="${HOMEBREW_PREFIX}/opt/nvm"
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  nvm "$@"
}
node() {
  unset -f node
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  node "$@"
}
npm() {
  unset -f npm
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  npm "$@"
}

# ==== BINs
# Home
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# ==== Custom functions
source ~/bin/utilities-functions.sh

# ==== ENVs
export EDITOR=nvim

