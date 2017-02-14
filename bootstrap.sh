#! /bin/bash

# Init brew and friends

if [ "$(uname)" = "Darwin" ]; then
  if ! which brew > /dev/null ;then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
  fi

  if ! brew cask > /dev/null ; then
    brew install caskroom/cask/brew-cask
    brew tap caskroom/versions
  fi

  brew install coreutils vim zsh gnu-sed autojump git youtube-dl node unrar
  brew cask install skype sogouinput google-chrome
  brew cask install virtualbox tunnelblick qq rtx
  # Install java
  # brew cask install java
  # brew install jetty-runner maven
fi

# Install rvm

if ! which rvm > /dev/null; then
  curl -sSL https://get.rvm.io | bash -s stable
fi
