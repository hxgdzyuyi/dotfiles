# Path to your oh-my-zsh installation.
export ZSH=/Users/qingyang/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rvm autojump gulp)

# User configuration

export PATH="/Users/qingyang/.cabal/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/sbin:/usr/sbin:/usr/local/share/npm/bin:/usr/local/share/npm/bin/:/usr/local/Cellar/qt5/5.3.1/bin/:/Users/qingyang/.rvm/bin:/Users/qingyang/project/depot_tools:/Library/Java/Home/bin":$PATH
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$PATH:"/usr/local/share/npm/bin/"

source $ZSH/oh-my-zsh.sh

PROMPT='${ret_status} %{$fg[cyan]%}%3~%{$reset_color%} $(git_prompt_info)'
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
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
alias .. -="cd .."
alias ... -="cd ../.."
alias .... -="cd ../../.."
alias ..... -="cd ../../../.."
alias ...... -="cd ../../../../.."

alias ack="ack-grep $1"
alias g="git $1"
alias m="make $1"
alias tree="tree --dirsfirst"

function gitconfig_17173 {
  git config user.name "杨青"
  git config user.email "yangqing_17173@cyou-inc.com"
  echo "Current user.config is:"
  git config -l | grep "user"
}

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
