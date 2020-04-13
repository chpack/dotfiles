# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: https://bbs.archlinux.org/viewtopic.php?pid=521888#p521888
#PROMPT=$'%{\e[0;34m%}%B%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;34m%} %b%{\e[0;34m%}%B%~%{\e[0;34m%}%B $(git_prompt_info)%(!.#.$) 
#%{\e[0;34m%}%B%?%B[%{\e[1;35m%}$%{\e[0;34m%}%B%{\e[0m%}%b '
PROMPT=$'%{\e[0;34m%}%B- %{\e[0m%}%{\e[1;32m%}%n%{\e[1;34m%} %b%{\e[0;34m%}%B%~%{\e[0;34m%}%B
%? %{\e[1;35m%}$%{\e[0;34m%}%B%{\e[0m%}%b '
RPROMPT='[%*]'
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗"
