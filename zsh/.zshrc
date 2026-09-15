# User configuration
source $HOME/.profile
source $HOME/.profile.overrides

# Aliases
source $HOME/.profile.aliases

bindkey -e

for f in ~/.zshrc.d/*.zsh(.N); do; source "$f"; done
