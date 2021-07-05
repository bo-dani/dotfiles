###########################################
####             NEOFETCH              ####
###########################################
neofetch

EDITOR=nvim

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use bat for the man pages.
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Path to your oh-my-zsh installation.
export ZSH="/home/dma/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git 
	cargo 
	command-not-found 
	fd 
	fzf 
	pip 
	rust 
	rustup
	sudo 
	zsh-interactive-cd 
	zsh-autosuggestions
	zsh-syntax-highlighting
	themes
)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/.cargo/bin:$PATH"

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
	fd . $HOME --color=always --type=file | \
		fzf -i --ansi --border --preview 'bat --color=always {}' | xargs -ro code
}

# Open folder with code
odc() {
	fd . $HOME --color=always --type=directory | \
		fzf -i --ansi --border --preview 'exa -al --icons --color=always --group-directories-first {}' | xargs -ro code
}

# Install package
pacins() {
	pacman -Slq | fzf --border --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S 
}

# Install package from AUR
yains() {
	yay -Slq | fzf --border --multi --preview 'yay -Si {1}' | xargs -ro yay -S
}

# Remove package
pacrem() {
	pacman -Qq | fzf --border --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
}

# Remove package from AUR
yarem() {
	yay -Qq | fzf --border --multi --preview 'yay -Qi {1}' | xargs -ro sudo yay -Rns
}

###########################################
####             ALIASES               ####
###########################################

alias ..='cd ..'

alias ls='exa --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias ll='exa -la --icons --color=always --group-directories-first'
alias lt='exa -aT --icons --color=always --group-directories-first'

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias mkdir='mkdir -pv'

alias upgrade='sudo pacman -Syu; yay -Syu'

alias gs='git status'
alias gb='git branch'
alias gch='git checkout'
alias gm='git merge --no-ff'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gsuir='git submodule update --init --recursive'
alias gsur='git submodule update --recursive'
alias gaa='git add .'
alias ga='git add'
alias gnah='git restore .'
alias gpush='git push'
alias gpull='git pull'
alias gfa='git fetch --all'
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

###########################################
####              FORGIT               ####
###########################################
source $HOME/repos/forgit/forgit.plugin.zsh

forgit_log=glo
forgit_diff=gd
forgit_add=gai
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

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
