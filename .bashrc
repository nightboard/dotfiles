# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias usage='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

#---------------------------------------------Powerline------------------------------------
#if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
#   source /usr/share/powerline/bindings/bash/powerline.sh
#fi
#------------------------------------------------------------------------------------------

# Linux Lite Custom Terminal
LLVER=$(awk '{print}' /etc/llver)

#---------------------------------------------print----------------------------------------
echo -e "Welcome to $LLVER ${USER}"
echo " "
date "+%A %d %B %Y, %T"
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
echo " "
#------------------------------------------------------------------------------------------

#---------------------------------------------aliases----------------------------------------
alias ls="ls --color"
alias c="clear"
alias zathura="setsid zathura"
alias z="zathura"
alias firefox="setsid firefox"
alias go="cd ~/GoLikeHell"
alias google-chrome="setsid google-chrome"
#------------------------------------------------------------------------------------------

#---------------------------------------------vi-mode----------------------------------------
set -o vi
#------------------------------------------------------------------------------------------

#---------------------------------------------prompt----------------------------------------
red='\[\033[1;30m\]'
green='\[\033[1;32m\]'
yellow='\[\033[1;33m\]'
NC='\[\033[0m\]'

export PS1="$green>>>$NC "
#------------------------------------------------------------------------------------------
