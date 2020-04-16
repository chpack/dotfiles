
CL=$'%{\e[0m%}'

UN=$'%{\e[38;5;103m%}'
P=$'%{\e[38;5;37m%}'
S=$'%{\e[48;5;40m\e[38;5;232m%}'
F=$'%{\e[48;5;160m\e[38;5;20m%}'
T=$'%{\e[38;5;240m%}'
N=$'%{\e[38;5;39m%}'


PROMPT='%(?.'$S'.'$F')%?'$CL' $(git_prompt_info)'$P$'%~\n'$CL$N'%B->%b'$CL
RPROMPT=$UN'<%n @ %M'$$T' %*'
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗"
