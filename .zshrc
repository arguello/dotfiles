# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="ys"
#ZSH_THEME="pygmalion"
#ZSH_THEME="4thfloyd"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ovftool="/Applications/VMware\ OVF\ Tool/ovftool"
### start nicks-homestyle-ssh-configs ###
alias ssh='~/bin/ssh'
alias scp='~/bin/scp'
### end nicks-homestyle-ssh-configs ###

# Set to this to use case-sensitive completion
 CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git per-directory-history rbenv tumx tmuxinator web-search zsh-syntax-highlighting brew brew-cask osx django pip pylint python tmuxinator virtualenv virtualenvwrapper terminalapp github docker docker-compose)

source $ZSH/oh-my-zsh.sh
#source '/usr/local/share/chruby/chruby.sh'
#source '/usr/local/share/chruby/auto.sh'

# Customize to your needs...

# macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/Applications/Racket/bin:$PATH
#export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=/Users/floyd/bin:$PATH

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
eval "$(rbenv init -)"
alias rake="noglob rake"

export RUBYMOTION_ANDROID_SDK=~/Development/android-rubymotion/sdk
export RUBYMOTION_ANDROID_NDK=~/Development/android-rubymotion/ndk

# export WORKON_HOME=~/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
export TESSERACT_PATH=/usr/local/bin/tesseract
export GOPATH=~/Development/projects/go
export PATH=$PATH:$GOPATH/bin
export AWS_ACCESS_KEY=msgreports01
export AWS_SECRET_KEY=Itz0XcJrc+l/3tLGAKaePc2mrfk53uMnWCCljKnL
#PLAN9=/Users/floyd/Sites/plan9port export PLAN9
#PATH=$PATH:$PLAN9/bin export PATH

alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'
alias runmcp='vmrun -T fusion start /Users/floyd/Documents/Virtual\ Machines.localized/mcpdev.vmwarevm/mcpdev.vmx nogui'
alias goofline='godoc -http=:6060'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv virtualenvwrapper
