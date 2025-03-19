# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# GitHub Token
export GITHUB_TOKEN="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"
export PERSONAL_GITHUB_TOKEN="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"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Web browser
export BROWSER=""

# Repos folder
export REPOS="$HOME/repos"
export FARADAY_PATH="$HOME/repos/faraday"

# PYTHONPATH
export PYTHONPATH="$PYTHONPATH:$REPOS/faraday-tools:$REPOS/faraday-tools/external/dtbt"

# PATH
export PATH="$PATH:$HOME/.local/bin"

export FZF_BASE="/usr/bin"

NC="\033[0m"                # Text Reset
BRED="\033[1;31m"           # Bold Red
BGREEN="\033[1;32m"         # Bold Green
BYELLOW='\033[1;33m'        # Bold Yellow
CYAN='\033[0;36m'           # Cyan
BCYAN='\033[1;36m'          # Bold Cyan

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	command-not-found
	fzf
  safe-paste
  ubuntu
	pip
	rust
	sudo
	forgit
	zsh-interactive-cd
	zsh-autosuggestions
	zsh-syntax-highlighting
	# zsh-autocomplete
	themes
  docker
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Use bat for the man pages.
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

###########################################
####            FUNCTIONS              ####
###########################################

# Go to folder
goto() {
	local dir

	dir=$(fd . $HOME --color=always --type=directory --hidden --exclude 'dotfiles' | \
		fzf -i --ansi --border --preview 'exa -al --icons --color=always --group-directories-first {}')

	cd "$dir"
}

# Open file with code
ofc() {
	fd . $HOME --color=always --type=file --hidden --exclude=.cargo --exclude=opt --exclude=.cache | \
		fzf -i --ansi --border --preview 'bat --color=always {}' | xargs -ro code
}

ff14() {
  fd . --color=always --no-ignore --exclude de16 --exclude dongle --exclude earbuds --exclude="tests" --exclude=".build" --exclude=".cache" --exclude="external" --exclude="template" --exclude="libs" --type=file -e .c -e .h -X rg --color=always --line-number --no-heading --smart-case "${*:-}" \
  | fzf -d':' --ansi --exact -i \
    --preview "bat -p --color=always {1} --highlight-line {2}" \
    --preview-window ~8,+{2}-5 \
  | awk -F':' '{print $1}'
}

ff16c() {
  fd . --color=always --no-ignore --exclude='*ab156*' --exclude='*ab16*' --exclude='*ab157*' --exclude dh14 --exclude '*headset*' --exclude '*earbuds*' --exclude="tests" --exclude=".build" --exclude=".cache" --exclude="external" --exclude="template" --exclude="libs" --type=file -e .c -e .h -X rg --color=always --line-number --no-heading --smart-case "${*:-}" \
  | fzf -d':' --ansi --exact -i \
    --preview "bat -p --color=always {1} --highlight-line {2}" \
    --preview-window ~8,+{2}-5 \
  | awk -F':' '{print $1 ":" $2}' \
  | xargs -ro code --goto
}


ff16() {
  fd . --color=always --no-ignore --exclude='*ab156*' --exclude='*ab16*' --exclude='*ab157*' --exclude dh14 --exclude '*headset*' --exclude '*dongle*' --exclude="tests" --exclude=".build" --exclude=".cache" --exclude="external" --exclude="template" --exclude="libs" --type=file -e .c -e .h -X rg --color=always --line-number --no-heading --smart-case "${*:-}" \
  | fzf -d':' --ansi --exact -i \
    --preview "bat -p --color=always {1} --highlight-line {2}" \
    --preview-window ~8,+{2}-5 \
  | awk -F':' '{print $1 ":" $2}' \
  | xargs -ro code --goto
}

of() {
	fd . $HOME --color=always --type=file --hidden --exclude=.cargo --exclude=opt --exclude=.cache | \
		fzf -i --ansi --border --preview 'bat --color=always {}' | xargs -ro subl
}

ows() {
	fd . $REPOS --color=always --type=file | rg .code-workspace | \
		fzf -i --ansi --border --preview 'bat --color=always {}' | xargs -ro code
}

# Open folder with code
odc() {
	fd . $REPOS --color=always --type=directory | \
		fzf -i --ansi --border --preview 'exa -al --icons --color=always --group-directories-first {}' | xargs -ro code
}

# Remove package from AUR
yarem() {
	yay -Qq | fzf --border --multi --preview 'yay -Qi {1}' | xargs -ro sudo yay -Rns
}

# ex - archive extractor
# usage: ex <file>
ex() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.xz)    tar -xf $1   ;;
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

gcm() {
	git commit -m "$*"
}

gcam() {
	git commit -am "$*"
}

###########################################
####             FARADAY               ####
###########################################

b14() {
	cd $REPOS/faraday
	./faraday.py build --product dh14 --build mp1_right && ./faraday.py build --product dh14 --build mp1_left
}

b16() {
	cd $REPOS/faraday
	./faraday.py build --product de16 --build dv1
}

b16c() {
	cd $REPOS/faraday
	./faraday.py build --product de16-case --build dv1
}

b14f() {
	cd $REPOS/faraday
	./faraday.py build --product dh14 --build mp1_right --factory && ./faraday.py build --product dh14 --build mp1_left --factory
}

f14() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	python AirTools/flash.py -f $FARADAY_PATH/.build/dh14/mp1_left -p /dev/ttyUSB0 && \
		python AirTools/flash.py -f $FARADAY_PATH/.build/dh14/mp1_right -p /dev/ttyUSB1
}

f16() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	python AirTools/flash.py -f $FARADAY_PATH/.build/de16/dv1 -p /dev/ttyUSBR && \
		python AirTools/flash.py -f $FARADAY_PATH/.build/de16/dv1 -p /dev/ttyUSBL
}

f16c() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	python AirTools/flash.py -f $FARADAY_PATH/.build/de16-case/dv1 -p /dev/ttyUSBC0
}

_sl14l() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	python AirTools/syslog.py -d "$FARADAY_PATH/.build/dh14/mp1_left" --showdsp -p "/dev/ttyUSB0" $*
}

sl14r() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	nohup python3 ./AirTools/gui/main.py -d $FARADAY_PATH/.build/dh14/mp1_right -p /dev/ttyUSB1
}

sl14l() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	nohup python3 ./AirTools/gui/main.py -d $FARADAY_PATH/.build/dh14/mp1_left -p /dev/ttyUSB0
}

_sl14lf() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	python AirTools/syslog.py -d "$FARADAY_PATH/.build/dh14/mp1_left_factory" -p "/dev/ttyUSB0" $*
}

_sl14r() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	python AirTools/syslog.py -d "$FARADAY_PATH/.build/dh14/mp1_right" --showdsp -p "/dev/ttyUSB1" $*
}

_sl16r() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	python AirTools/syslog.py -d "$FARADAY_PATH/.build/de16/dv1" --showdsp -p "/dev/ttyUSBR" $*
}

sl16r() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	nohup python3 ./AirTools/gui/main.py -d "$FARADAY_PATH/.build/de16/dv1" -p "/dev/ttyUSBR" &
}

_sl16l() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	python AirTools/syslog.py -d "$FARADAY_PATH/.build/de16/dv1" --showdsp -p "/dev/ttyUSBL" $*
}

sl16l() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	nohup python3 ./AirTools/gui/main.py -d "$FARADAY_PATH/.build/de16/dv1" -p "/dev/ttyUSBL" &
}

_sl16c() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	python AirTools/syslog.py -d "$FARADAY_PATH/.build/de16-case/dv1" --showdsp -p "/dev/ttyUSBC0" $*
}

sl16c() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	nohup python3 ./AirTools/gui/main.py -d $FARADAY_PATH/.build/de16-case/dv1 -p /dev/ttyUSBC0 &
}

_sl14rf() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
	clear
	python AirTools/syslog.py -d "$FARADAY_PATH/.build/dh14/mp1_right_factory" -p "/dev/ttyUSB1" -b 3000000 $*
}

function set_sn() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
  python AirTools/nvkey.py set 0xB001 $1 -p /dev/ttyUSB0 -b 3000000
  python AirTools/nvkey.py set 0xB001 $1 -p /dev/ttyUSB1 -b 3000000
}

function set_name() {
	cd $REPOS/faraday-tools
	source venv/bin/activate
  python AirTools/nvkey.py set 0x3901 $1 -p /dev/ttyUSB0 -b 3000000
  python AirTools/nvkey.py set 0xF202 $1 -p /dev/ttyUSB0 -b 3000000
  python AirTools/nvkey.py set 0x3901 $1 -p /dev/ttyUSB1 -b 3000000
  python AirTools/nvkey.py set 0xF202 $1 -p /dev/ttyUSB1 -b 3000000
}

function ble_tool() {
	cd $REPOS/baldwin-protobuf/baldwin-ble-tool
	python baldwinGenericCommander.py --scan
}

function ota() {
	cd $REPOS/baldwin-protobuf/baldwin-ble-tool
	source venv/bin/activate
  python baldwinOTA.py --scan -f $*
}

function proto() {
	cd $REPOS/baldwin-protobuf/baldwin-ble-tool
	source venv/bin/activate
	python baldwinGenericCommander.py --scan
}

function setup_dh14() {
	SN="37191540"
	echo -e "┌────────────────────────────────┐"
	echo -e "│ ${BCYAN}STEP 1/2 - Set Serial number${NC}   │"
	echo -e "└────────────────────────────────┘"
	set_sn $SN
	echo -e "┌───────────────────────┐"
	echo -e "│ ${BCYAN}STEP 1/2 - Set Name${NC}   │"
	echo -e "└───────────────────────┘"
	set_name "Beoplay H100 🐷"
}

###########################################
####             ALIASES               ####
###########################################

alias ..='cd ..'

alias repos='cd $REPOS'
alias fa='cd $FARADAY_PATH'
alias fat='cd $REPOS/faraday-tools && source venv/bin/activate'
alias fas='cd $REPOS/faraday-autotest-service && source venv/bin/activate'

alias ls='exa --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias ll='exa -la --icons --color=always --group-directories-first'
alias lt='exa -aT --icons --color=always --group-directories-first'

alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias mkdir='mkdir -pv'

alias gs='git status'
alias gds='git diff --staged'
alias gb='git branch'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gm='git merge --no-ff'
alias gsuir='git submodule update --init --recursive'
alias gsur='git submodule update --recursive'
alias gaa='git add .'
alias gnah='git restore .'
alias grs='git restore --staged .'
alias gpush='git push'
alias gpull='git pull'
alias gfa='git fetch --all --prune'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gmc="git merge --continue"
alias gma="git merge --abort"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"

alias get_idf='. $HOME/repos/esp-idf/export.sh'

grbb() {
	git reset $(git merge-base master $(git branch --show-current))
}

alias pof="shutdown now"

alias pipins="python -m pip install"
alias pipupg="python -m pip install --upgrade pip"

alias o="xdg-open"

alias av="source venv/bin/activate"
alias dv="deactivate"

###########################################
####              FORGIT               ####
###########################################

forgit_log=glo
forgit_diff=gd
forgit_add=ga
forgit_reset_head=grh
forgit_ignore=gi
forgit_checkout_file=gcf
forgit_checkout_branch=gcb
forgit_checkout_commit=gco
forgit_clean=gclean
forgit_stash_show=gss
forgit_cherry_pick=gcp
forgit_rebase=grb
forgit_fixup=gfu

source $HOME/rice/zsh-interactive-cd.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi
