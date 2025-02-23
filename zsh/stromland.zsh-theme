PROMPT='%{$fg[cyan]%}%c $(git_prompt_info)'
PROMPT+='
%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[black]%}[%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[black]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
