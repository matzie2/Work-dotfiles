# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export GIT_PS1_PREFIX="Git repo on branch: "
export GIT_PS1_SHOWDIRTYSTATE=" [warning: uncommitted changes] "
export GIT_PS1_SHOWSTASHSTATE=" [stashed files] "
export GIT_PS1_SHOWUNTRACKEDFILES=" [warning: untracked files] "

source ~/bin/colournames.sh
source ~/bin/.git-completion.bash

alias gs='git status'
alias gl='git log'
alias gb='git branch'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias yum='http_proxy="" yum'

alias ls='ls -alh --color=auto'
alias l='ls -alh --color=auto'
alias pe="cd php-europe"
alias cl='cd /u/dev/php-europe/corelib'
alias ap='cd /u/dev/php-europe/applications'
alias tpls='cd /u/dev/htdocs/templates'
alias changedfiles="cvs -q diff --brief | grep Index | cut -f2 -d' '"
function cf() { cvs -q -n up | sed -e "s@^\(.\)@\1 `pwd`/@g" | awk '{print $1,$2 $3}';}

alias cfs='~/changedfiles.sh' 
#alias vi='~/myvim.sh'

#a common typo I make
#alias vu='~/myvim.sh'


alias vd='vimdiff'
alias cvd='~/cvsvimdiff'

alias upclean='~/cvs-up-vhost.sh CleanLVM'


export HISTSIZE=10000
export HISTFILESIZE=10000

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'




#export PS1="\n\u@\h:\[\e[32;1m\]\w\[\e[0m\]; contains `cvs -qn diff --brief 2>/dev/null | grep Index | wc -l` modified file(s)\n\! \u \W \$>"
#this works, my multiline prompt, no git:
#export PS1="\n\u@\h:\[\e[32;1m\]\w\[\e[0m\]\n\! \u \W \$>"
#this doesn't re-evaluate:
#export PS1="\n\u@\h:\[\e[32;1m\]\w\[\e[0m\]\n\! \u \W \w$(__git_ps1 ''(%s)'') \$"


#current best:
#export PS1='\n\u@\h:\[\e[32;1m\]\w\[\e[0m\] $(__git_ps1 "(Git Branch Info: %s)")\n\! \u \W \$'

#this works and lets me use vars
#export PS1="\n\u@\h:\[\e[32;1m\]\w\[\e[0m\] \$(__git_ps1 \"(Git Branch Info: %s)\")\n\! \u \W \$"

export PS1="\n\[$PURPLE_BOLD\]\u\[$WHITE\]@\[$RED_BOLD\]\h:\[$YELLOW\]\w\[\e[0m\] \[$GREEN\]\$(__git_ps1 \"(\[$WHITE\]$GIT_PS1_PREFIX \[$YELLOW\]: %s)\")\n\[$RESETCOLOURS\]\! \W \$>"



#these work:
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
# export PS1='\n[\u@\h:[\e[32;1m]\w\[\e[0m\]\n\! \W$(__git_ps1 " (%s)")]\$ '



sshs() {
        screen -t "$2" ssh -X -A $1
}


push2() {
        echo scp "$1" iweb:/prod/live/delta2/`pwd | cut -d'/' -f4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20`/$1
        scp "$1" iweb:/prod/live/delta2/`pwd | cut -d'/' -f4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20`/$1
}

push3() {
        echo scp "$1" iweb:/prod/live/delta3/`pwd | cut -d'/' -f4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20`/$1
        scp "$1" iweb:/prod/live/delta3/`pwd | cut -d'/' -f4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20`/$1
}

push23() {
        echo scp "$1" iweb:/prod/live/delta2/`pwd | cut -d'/' -f4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20`/$1
        echo scp "$1" iweb:/prod/live/delta3/`pwd | cut -d'/' -f4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20`/$1
        scp "$1" iweb:/prod/live/delta2/`pwd | cut -d'/' -f4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20`/$1
        scp "$1" iweb:/prod/live/delta3/`pwd | cut -d'/' -f4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20`/$1
}


pushtz() {
        echo cp $1 /extrasites/testzone/`pwd | cut -d'/' -f4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20`/$1
        cp $1 /extrasites/testzone/`pwd | cut -d'/' -f4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20`/$1
}

alias go21="sshs webdev21 \"W21 (Services)\""
alias go24="sshs webdev24 \"W24 (Chris Imeson)\""
alias go25="sshs webdev25 \"W25 (Chris Scott)\""
alias go26="sshs webdev26 \"W26 (Adam)\""
alias go27="sshs webdev27 \"W27 (Tianma)\""
alias go28="sshs webdev28 \"W28 (Kevin)\""
alias go29="sshs webdev29 \"W29 (Matt)\""
alias goiweb="sshs iweb IWEB"
alias go4="sshs ishwebdev04 \"W04\""
alias go5="sshs ishwebdev04 \"W05\""
alias go6="sshs ishwebdev04 \"W06\""
alias go7="sshs ishwebdev04 \"W07\""
alias gogit="sshs ishsrcctrl01 \"Git01\""



PATH=$PATH:~/bin:.


#Start or Reconnect to a Screen, unless we're already in one!
if [ $TERM = "linux" ]
then
    screen -xRR -S "Main"
fi 


#PROMPT_COMMAND='
# HOSTNAME=`cat ~/.hostname`
# MYPWD="${PWD/#$HOME/~}"
# BRANCH=`git branch 2>/dev/null | grep '*'`
# [ ${#MYPWD} -gt 20 ] && MYPWD=..${MYPWD:${#MYPWD}-18}
# echo -n -e "\033k$HOSTNAME:$MYPWD G:$BRANCH\033\\"
#'

#some keybindings

#alt_left/right arrow moves a word at a time
bind '"\x1b\x1b\x5b\x44"':backward-word
bind '"\x1b\x1b\x5b\x43"':forward-word

# ctrl+left/right arrows:
bind '"\e\x5b\x31\x3b\x35\x44"':backward-word
bind '"\e\x5b\x31\x3b\x35\x43"':forward-word

#alt+backspace:
bind '"\xff"':backward-kill-word

# alt+'.':
bind '"\xae"':yank-last-arg

# alt+',':
bind '"\x1b\x2c"':yank-nth-arg
