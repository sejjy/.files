# Enable powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#-------------#
#	options   #
#-------------#

setopt AUTO_CD
setopt GLOB_DOTS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_BY_COPY
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt HASH_LIST_ALL
setopt CORRECT

#----------------#
#	parameters   #
#----------------#

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=5000
SAVEHIST=5000
ZLE_RPROMPT_INDENT=0

#----------------#
#	completion   #
#----------------#

autoload -Uz compinit
compinit
zstyle ':completion:*:descriptions' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

#-------------#
#	keymaps   #
#-------------#

bindkey -v # vi mode
bindkey '^ ' autosuggest-accept

#-------------#
#	aliases   #
#-------------#

# shell
alias reload='exec zsh'
alias c='clear'
alias :q='exit'

# file
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias cx='chmod +x'
alias mkdir='mkdir -p'

# list
alias ls='ls --color=auto --group-directories-first'
alias la='ls -A'
alias ll='ls -alh'

# find
alias find='fd'
alias fd='fd --hidden --exclude timeshift'
alias fdf='fd --type file'
alias fdd='fd --type dir'
# alias grep='rg'

# pacman
alias pup='sudo pacman -Syu'
alias pfd='pacman -Ss'
alias pdl='sudo pacman -S'
alias prm='sudo pacman -Rns'
alias pls='pacman -Q'

# AUR
alias yup='yay -Syu'
alias yfd='yay -Ss'
alias ydl='yay -S'
alias yrm='yay -Rns'
alias yls='yay -Qm'

# git
alias gcl='git clone'
alias gi='git init'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gr='git reset'
alias gcd='git clean -d --force'
alias grs='git restore --staged'
alias gb='git branch'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'
alias gst='git stash'
alias gstp='git stash pop'
alias gl='git log'
alias glo='git log --graph --oneline'
alias gd='git diff | bat'

# vim
alias v='vim'
alias n='nvim'
alias nn="cd $XDG_CONFIG_HOME/nvim && nvim"
alias nh="cd $XDG_CONFIG_HOME/hypr && nvim"
alias nw="cd $XDG_CONFIG_HOME/waybar && nvim"

# docker
alias dr='docker run'
alias dp='docker ps'
alias dpa='docker ps --all'
alias dim='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias ds='docker start'
alias dst='docker stop'

# tmux
alias t='tmux'
alias tn='tmux new-session'
alias ta='tmux attach-session'
alias tls='tmux list-sessions'
alias tk='tmux kill-session'
alias tks='tmux kill-server'
alias tc='tmux clearhist'

# scripts
alias clean="$HOME/.local/bin/cleanup.sh"
alias nitch="$HOME/dev/github/random/nitch/nitch"
alias server="$HOME/.local/bin/server.sh"

# misc
alias e='y'  # yazi
alias z='cd' # zoxide
alias discord='discord --ozone-platform-hint=auto'
alias np="playerctl metadata -af '{{ title }} - {{ artist }}'"

#-------------#
#	exports   #
#-------------#

export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export FZF_DEFAULT_OPTS='--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8,fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC,marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8,selected-bg:#45475A,border:#6C7086,label:#CDD6F4'

#-------------#
#	plugins   #
#-------------#

# Better vi mode
# https://github.com/jeffreytse/zsh-vi-mode
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_CURSOR_STYLE_ENABLED=false
ZVM_VI_SURROUND_BINDKEY='s-prefix'
ZVM_VI_HIGHLIGHT_FOREGROUND=#cdd6f4
ZVM_VI_HIGHLIGHT_BACKGROUND=#45475a
ZVM_LINE_INIT_MODE="$ZVM_MODE_INSERT"

# Live suggestions
# https://github.com/zsh-users/zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Prompt
# https://github.com/romkatv/powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit "$ZDOTDIR/.p10k.zsh".
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"

# Prompt overrides
typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=''
typeset -g POWERLEVEL9K_LOCK_ICON=''
typeset -g POWERLEVEL9K_HOME_ICON=''
typeset -g POWERLEVEL9K_HOME_SUB_ICON=''
typeset -g POWERLEVEL9K_FOLDER_ICON=''
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=''
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=$'󰘬 '
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='>'
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

#----------------#
#	extensions   #
#----------------#

# Smarter cd
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd cd zsh)"

#---------------#
#	functions   #
#---------------#

# pacman -F "command not found" handler
# https://wiki.archlinux.org/title/Zsh
function command_not_found_handler() {
	printf 'zsh: Command not found: %s\n' "$1"
	local entries=(${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"})
	local purple='\e[1;35m'
	local bright='\e[0;1m'
	local green='\e[1;32m'
	local reset='\e[0m'
	if (( ${#entries[@]} )); then
		printf "${bright}$1${reset} may be found in the following packages:\n"
		local pkg
		for entry in "${entries[@]}"; do
			local fields=(${(0)entry})
			if [[ "$pkg" != "${fields[2]}" ]]; then
				printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
			fi
			printf '\t/%s\n' "${fields[4]}"
			pkg="${fields[2]}"
		done
	fi
	return 127
}

# yazi shell wrapper
# https://yazi-rs.github.io/docs/quick-start
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[[ -n "$cwd" ]] && [[ "$cwd" != "$PWD" ]] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# bash `help` builtin
function help() {
	bash -c 'help "$1"' bash "$1"
}
