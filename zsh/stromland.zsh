setopt prompt_subst

git_prompt_info() {
  local branch dirty

  branch=$(command git symbolic-ref --quiet --short HEAD 2>/dev/null) ||
    branch=$(command git rev-parse --short HEAD 2>/dev/null) ||
    return

  [[ -n $(command git status --porcelain 2>/dev/null) ]] && dirty=" *"

  print -n -- "%F{gray}[${branch}%F{red}${dirty}%F{gray}]%f "
}

PROMPT='%F{cyan}%1~%f $(git_prompt_info)%B%F{green}>%f%b '
