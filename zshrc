#!/bin/zsh

############
# ENV VARS #
############

PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# We might use stuff from my local development
export PATH="~/dev:$PATH"
# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# Adding extra ~/bin to path
export PATH="~/bin:$PATH"

# Let's use the binaries from our node_modules
export PATH="$PATH:node_modules/.bin"

# SublimeText <3
export EDITOR="subl -w"
export VISUAL="subl -w"

# Path to my oh-my-zsh configuration.
export ZSH=$HOME/etc/oh-my-zsh
ZSH_THEME="cobalt2"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

# Completion: git git-flow osx brew svn npm
# Further functionality: cp extract (rsync as dependency)
# Fancy: colorize
plugins=(gitfast git-flow osx colorize extract brew npm node bower copyfile copydir web-search z)



###########
# Aliases #
###########

alias g="git"
alias s="subl"
alias compress="tar cvzf"
# Extraxt: xvzf
# Ue zsh-plugin `x`

alias ll="ls -la"

alias pidof="pgrep"

# Start Daemons with correct path pointer
alias m="mongod --dbpath /usr/local/data"
alias p="postgres -D /usr/local/var/postgres"
alias mysql="mysql.server start"

# I can't associate `take` with 'create folder and switch to it'
alias dir="take"
alias folder="take"

# Common typos
alias cd..="cd .."
alias gist="git st"

# Edit this file
alias zconf="subl ~/etc/zshrc"
# Edit global git config
alias gitconf="subl ~/etc/gitconfig"

# Make sum quick server <3
alias server="python -m SimpleHTTPServer"

# iPhone Simulator App
alias iphone="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"

# Don't remove anymore - move it to osx's trash
alias rm="trash"

# ###########
# # SCRIPTS #
# ###########

source $ZSH/oh-my-zsh.sh

# For nvm see zshenv
# Run in $NVM_DIR to update nvm
# rm -rf ~/.nvm && git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-2.1.3

# Fish like 'frecent' auto-suggestions
source $HOME/etc/zsh-autosuggestions/autosuggestions.zsh
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init
bindkey '^T' autosuggest-toggle

# Escape stuff like = and & when in url mode e.g. curl
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# added by travis gem
[ -f /Users/stephan/.travis/travis.sh ] && source /Users/stephan/.travis/travis.sh

# Fish like syntax highlighting - NOTE: (2015-05-08) Current version does not work with autosuggestions
# source $HOME/etc/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

nvm use default
