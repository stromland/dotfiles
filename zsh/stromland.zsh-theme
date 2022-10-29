NPM=$(npm --version)
PACKAGE_JSON=./package.json
GO_MOD=./go.mod
GOVERSION=$(go env GOVERSION)

zsh_tool_version() {
  DATA=$(tool_version)
  if [ ! -z $DATA ]; then
    echo " %{$fg_bold[black]%}[%{$fg[green]%}$DATA%{$fg_bold[black]%}]"
  fi
}

tool_version() {
  if [ -f "$PACKAGE_JSON" ]; then
    NODEJS=$(node --version)
    echo "node:$NODEJS npm:$NPM"
  fi
  if [ -f "$GO_MOD" ]; then
    echo $GOVERSION
  fi
  echo ""
}

PROMPT='%{$fg[cyan]%}%c$(zsh_tool_version) $(git_prompt_info)'
PROMPT+='
%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[black]%}[%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[black]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
