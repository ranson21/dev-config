##########################
# Terminal Configuration #
##########################

# Set name of the theme to load
ZSH_THEME="agnoster"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# DISABLED Plugins
# zsh-autosuggestions

# Set plugins to load
plugins=(
  git
  bundler
  dotenv
  osx
  colorize
  pip
  python
  brew
  zsh-syntax-highlighting
  colored-man
)

######################
# Path Configuration #
######################

# Set the GOPATH
export GOPATH="$HOME/go"
export GOROOT="$(brew --prefix golang)/libexec"

# Cargo Path
export PATH="$HOME/.cargo/bin:$PATH"

# Go Paths
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# General Path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# export PATH="/usr/local/go/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/abbyranson/.oh-my-zsh"

######################
# User Configuration #
######################
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# SSH Path
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# NVM Path
export NVM_DIR=~/.nvm

# Go Module
export GO111MODULE=auto

# MySQL
export PATH="${PATH}:/usr/local/mysql/bin/"

# Prompt Context?
prompt_context() { }

# Set the Default User
DEFAULT_USER="abigail"

# Bring up the Environment
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix nvm)/nvm.sh
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/env.sh

# Add Python Environment
# eval "$(pyenv init -)"

# Java Environment
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

# Ensure JAVA_HOME is correct
#jenv enable-plugin export

# Make Maven aware of the Java version in use (switch when project does)
#jenv enable-plugin maven

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform

#########################
# Environment variables #
#########################

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
