# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias lh='ls -ld .??*'
alias l='ls -CF'

alias install="sudo apt-get install $1 -y"
alias brc="vim ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias brc.=". ~/.bashrc"
alias vhosts="sudo vim /etc/hosts"
alias q="exit"

alias -- -="cd -"
alias ack="ack-grep $1"
alias g="git $1"
alias m="make $1"
alias tree="tree --dirsfirst"
complete -F _make m


CD_MAX_DEPTH=5
for (( i = 0; i < CD_MAX_DEPTH ; i ++ ))
do
  j=1
  CD_ALIAS_NAME="alias .."
  CD_ALIAS_VALUE="cd .."
  while [ "$j" -lt "$i" ]
  do
    let "j = $j+1"
    CD_ALIAS_NAME=${CD_ALIAS_NAME}"."
    CD_ALIAS_VALUE=${CD_ALIAS_VALUE}"/.."
  done
  $CD_ALIAS_NAME="${CD_ALIAS_VALUE}"
done

# f - everyday find
# usage:
#   f filename_fragment [path]
# skips whatever you list in _exclude_matches
_exclude_matches=()
_excludes=''
for _match in $_exclude_matches; do
  _excludes="${_excludes}-name '$_match' -prune -o "
done

eval "
function my_everyday_find() {
  find \$2 \
    $_excludes \
      -name \"*\$1*\"    \
      -print;
}
"
unset _exclude_matches _excludes _match
alias f=my_everyday_find
# blog post: http://titusd.co.uk/2012/12/23/my-everyday-find-command/
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/sbin:/usr/sbin:/usr/local/share/npm/bin:/usr/local/share/npm/bin/:/usr/local/Cellar/qt5/5.3.1/bin/

alias fq='ssh -qTfnN -D 6300 linode'
alias sb='sensible-browser $1'
alias komic-cli-dev='BUNDLE_GEMFILE=/Users/yangqing/mine-work/komic-cli/Gemfile bundle exec /Users/yangqing/mine-work/komic-cli/bin/komic $1'

function v {
  vagrant ssh 2>/dev/null
  if [ $? != 0 ]
  then
    vagrant up --no-provision && vagrant ssh
  fi
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$HOME/.cabal/bin:$PATH
export PATH="$PATH":~/project/depot_tools
export GOPATH=~/gocode
export FMPP_HOME=/opt/fmpp
export JAVA_HOME=/Library/Java/Home
PATH=$PATH:$JAVA_HOME/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
alias qshell='~/gocode/bin/qshell'


export NODE_PATH=/usr/local/lib/node_modules

alias japp='cd ~/17173/trade-git/webapp'
alias jmock='cd /Users/yangqing/17173/trade-git/webapp/mock/front'
alias jjs='cd /Users/yangqing/17173/trade-git/webapp/src/app'
