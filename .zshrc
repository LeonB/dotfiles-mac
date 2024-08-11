# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# zsh-autoswitch-virtualenv settings
export AUTOSWITCH_DEFAULT_PYTHON="python3"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-pyenv vi-mode git golang fzf fzf-marks direnv auto-notify autoswitch_virtualenv)

# plugins config

# notify
zstyle ':notify:*' command-complete-timeout 3

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $HOME/.bash_aliases

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export PATH="$HOME/Workspaces/go/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin/:$PATH" # Neovim Mason install path
export GOPATH="$HOME/Workspaces/go"

if [ -d "/opt/homebrew/opt/ruby@3.1/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby@3.1/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

if [ -d "/opt/homebrew/opt/ansible@8/bin" ]; then
export PATH="/opt/homebrew/opt/ansible@8/bin:$PATH"
fi

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="bin:$PATH"

export EDITOR="nvim"
export GIT_AUTHOR_NAME=`/usr/bin/git config user.name`
export GIT_AUTHOR_EMAIL=`/usr/bin/git config user.email`
export GIT_COMMITTER_NAME=$GIT_AUTHOR_NAME
export GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL

export FZF_DEFAULT_OPTS='--height 40% --reverse'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

function cdl() {
    selection=$(mdfind -name $1 | fzf)
    dir=$(dirname $selection)
    cd "$dir"
}

function projects() {
    dirs=$(sed 's/ : //g' $FZF_MARKS_FILE | tr  '\n' ' ')
    # echo $dirs
    selection=$(find $(echo $dirs) -type d -maxdepth 1 | fzf)
    echo $selection
    cd $selection
}

function pipelines() {
    gopath=$(go env GOPATH)
    selection=$(
        unfunction _direnv_hook 2>/dev/null
        for d in $gopath/src/bitbucket.org/tim_online/*/.git; do
            d=$(dirname $d)
            base=$(basename $d)
            (cd $d; git ls-files | sed "s,/.*,/," | egrep ".json$" |  sed "s,^,$base/," 2>/dev/null)
        done | fzf -x
    )
    cd "$gopath/src/bitbucket.org/tim_online/$(dirname $selection)"
}

capture() {
    sudo dtrace -p "$1" -qn '
        syscall::write*:entry
        /pid == $target && arg0 == 1/ {
            printf("%s", copyinstr(arg1, arg2));
        }
    '
}

function enable_proxy() {
    while read -r service; do
        networksetup -setsocksfirewallproxystate "$service" on
        networksetup -setsocksfirewallproxy "$service" localhost 8080
        echo "SOCKS proxy enabled for ${service}"
    done <<< "$(active-network-services)"
}

function disable_proxy() {
    while read -r service; do
        networksetup -setsocksfirewallproxystate $service off
        echo "SOCKS proxy disabled for ${service}"
    done <<< "$(active-network-services)"
}

function proxy() {
    enable_proxy
    trap disable_proxy INT
    trap 'echo "Signal SIGINT caught"' SIGINT
    ssh -q -T -n -N -D 8080 $1
    disable_proxy
}

function active-network-services() {
    while read -r line; do
        sname=$(echo "$line" | awk -F  "(, )|(: )|[)]" '{print $2}')
        sdev=$(echo "$line" | awk -F  "(, )|(: )|[)]" '{print $4}')
        #echo "Current service: $sname, $sdev, $currentservice"
        if [ -n "$sdev" ]; then
            ifout="$(ifconfig "$sdev" 2>/dev/null)"
            echo "$ifout" | grep 'status: active' > /dev/null 2>&1
            rc="$?"
            if [ "$rc" -eq 0 ]; then
                currentservice="$sname"
                currentdevice="$sdev"
                currentmac=$(echo "$ifout" | awk '/ether/{print $2}')

                # may have multiple active devices, so echo it here
                # echo "$currentservice, $currentdevice, $currentmac"
                echo "$currentservice"
            fi
        fi
    done <<< "$(networksetup -listnetworkserviceorder | grep 'Hardware Port')"
}

# function fail_if_stderr() (
#   rc=$({
#     ("$@" 2>&1 >&3 3>&- 4>&-; echo "$?" >&4) |
#     grep '^' >&2 3>&- 4>&-
#   } 4>&1)
#   err=$?
#   [ "$rc" -eq 0 ] || exit "$rc"
#   [ "$err" -ne 0 ] || exit 125
# ) 3>&1

# function run_until_no_error() (
#     until fail_if_stderr "$@"; do; done
# )

function faketty () {
     script -qefc "$(printf "%q " "$@")" /dev/null
 }

function until_run_complete() (
    until $@ 2>&1 | tee > /dev/stderr | grep -q "\[OMNIBOOST\]-run complete"; do;
        echo "\ndidn't find '[OMNIBOOST]-run complete': trying again\n"
        sleep 5
    done
)

# enable ngrok completion
  if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
  fi

export BEARER_TOKEN_INTEGRATIONS_API=$(security find-generic-password -w -s 'Bearer token integrations API')
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
