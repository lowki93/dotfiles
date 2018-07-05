# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mytheme"
DEFAULT_USER="lowki"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
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
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx terminalapp django git ssh-agent composer symfony2 bower)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#for mysql
export PATH="/usr/local/mysql/bin:$PATH"

#for open Sites
alias Sites="cd ~/Sites"

#for sublime text
alias subl='open -a "Sublime Text"'

#for Chrome
alias chrome='open -a "Google Chrome"'

alias aircall=' cd /Users/lowki/workspace/aircall'
alias keepster='cd /Users/lowki/workspace/keepster'
alias textr='cd /Users/lowki/workspace/textr'
alias Vagrant='cd /Users/lowki/Vagrant/Nginx'
alias vi='/usr/local/bin/vim'
alias emacs='/usr/local/bin/emacs'
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

export PATH=$PATH:/Users/lowki/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/lowki/Library/Android/sdk/tools

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/sbin:$PATH"

alias rails='bundle exec rails'
alias be='bundle exec'
alias createairc='/Users/lowki/workspace/aircall/start_tmux.sh'
alias killairc='tmux kill-session -t aircall'
alias joinairc='tmux attach-session -t aircall'
alias listtmux='tmux list-session'

execute_plivo_pure_outband(){
    osascript -e "tell application \"Terminal\"" \
    -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
    -e "do script \"cd ~/workspace/aircall/plivo-pure-outbound; ruby config.ru;\" in front window" \
    -e "end tell"
}

launch_ngrok(){
    osascript -e "tell application \"Terminal\"" \
    -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
    -e "do script \"cd ~/workspace/aircall; ./ngrok -authtoken cTtr2jBaDami/zBwCKzK --subdomain=kevin-aircall 4567 ;\" in front window" \
    -e "end tell"
}

plivo_connection() {
    execute_plivo_pure_outband
    launch_ngrok
}

removeAllDataXcode() {
    #Save the starting dir
    startingDir=$PWD

    #Go to the derivedData
    cd ~/Library/Developer/Xcode/DerivedData

    #Sometimes, 1 file remains, so loop until no files remain
    numRemainingFiles=1
    while [ $numRemainingFiles -gt 0 ]; do
        #Delete the files, recursively
        rm -rf *

        #Update file count
        numRemainingFiles=`ls | wc -l`
    done
    rm -rf ~/Library/Caches/com.apple.dt.Xcode
    echo Done

    #Go back to starting dir
    cd $startingDir
}

reindex_spotlight() {
    sudo mdutil -E /
}

export textr_db_redis=zoulou
export txtr_db_prod_host=95.85.53.218
export txtr_db_prod_user=merguezito
export txtr_db_prod_password=merguez
export txtr_db_prod_pass=merguez

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.fastlane/bin:$PATH"

# AIRCALL
export AIRCALL_BRIDGE_LOCAL_URL="http://kevin-aircall-bridge.ngrok.io"
export AIRCALL_LIVECALL_LOCAL_URL="http://kevin-aircall-livecall.ngrok.io"
export AIRCALL_WEB_LOCAL_URL="http://kevin-aircall-web.ngrok.io"

source ~/.functions/aws.sh
