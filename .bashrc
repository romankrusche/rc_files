# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# map caps lock to escape, for faster vim action
# this is already replaced by vim-mapping jk 
setxkbmap -option caps:escape

alias sor="source ~/.bashrc"
alias ct="cat ~/.bashrc"
alias diss="cd /daten/diss"
alias 3ds="cd /daten/3ds"
alias butex="bash /daten/backup_latex.sh"
alias budiss="bash /daten/backup_diss.sh"
alias getMeasData="libreoffice /daten/diss/06_Messung/konstMflow/Akustik/ViV_Wien_2019/Daten/02_Randbedingungen_AkustikMessungen_Wien2019.xlsx"
alias gethvColorBar="cat /daten/diss/03_Diss_Latex/plots/template_hvColorBar.tex"
alias getardamirIP="echo kr@131.188.159.101"

alias ardamir="ssh -XC kr@131.188.159.101"
alias noXardamir="ssh kr@131.188.159.101"
alias emmy="ssh -XC iwpa75@emmy.rrze.fau.de"
alias cshpc="ssh -X iwpa75@cshpc.rrze.fau.de"
alias sshpihole="ssh pi@192.168.1.20"

alias webplotdigitizer="/opt/WebPlotDigitizer-4.2-linux-x64/WebPlotDigitizer-4.2"
alias pdftk="/snap/pdftk/9/usr/bin/pdftk"
alias pycharm="bash ~/.local/share/umake/ide/pycharm/bin/pycharm.sh"
alias python3="/opt/anaconda3/bin/python3"
alias jupyternb="/opt/anaconda3/bin/jupyter-notebook"
alias eclipse="/opt/eclipse/eclipse/eclipse"
alias showDiss="okular /daten/diss/03_Diss_Latex/Diss_Krusche.pdf"
alias showLinxSetup="okular /home/roman/Documents/Linux_setup/Linux_initial_setup.pdf"
alias pl="pdflatex -shell-escape -interaction=nonstopmode"
export EDITOR=vim

mygit(){
   git config --global user.name "romankrusche"
   git config --global user.email "roman.krusche@gmx.de"
}

cfsgit(){
   git config --global user.name "rkrusche"
   git config --global user.email "roman.krusche@bmw.de"
}

clean_latex(){
   rm ./*.synctex.gz
   rm ./*.aux
   rm ./*.log
}

my_ffmpeg(){
   ffmpeg -y -r 20 -i ${1} -r 20 -b:v 6000k -vcodec libx264 -pix_fmt yuv420p ${2}
}

inkscapeExp(){
   filebase=${1%%.svg}
   inkscape -D --export-filename=${filebase}.pdf $1 --export-latex
}
export PYTHONPATH=$PYTHONPATH:/home/roman/Documents/git_prj_inkscape2tikz

cf(){
   find $1 -type f | wc -l
}

showBP(){
   echo "#########################"
   echo "Ma=const: 1, 3, 5, 9"
   echo "Mj=const: 1, 2, 4, 6, 10"
   echo "high    : 7, 8"
   echo "#########################"
}

setupPgfSubfile(){
   ln -s /daten/03_Diss_Latex/latex_einstellungen/ latex_einstellungen
   ln -s /daten/03_Diss_Latex/data/ data
   ln -s /daten/03_Diss_Latex/external_fig/ external_fig
   cp /daten/03_Diss_Latex/plots/10_sim_meas_comp/multiply_figure.sh . 
   cp /daten/03_Diss_Latex/plots/01_velocity/02_compar_Sim_Meas/multiply_advanced.sh .
}
