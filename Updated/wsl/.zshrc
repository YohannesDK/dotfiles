# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="headline/headline"
# ZSH_THEME="spaceship"


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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# aliases
alias tm="tmux"
alias lzd="lazydocker"

# exports
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#export PATH="$PATH:$HOME/.dotnet/tools"
#export DOTNET_ROOT=/usr/share/dotnet
#export PATH=$PATH:/usr/share/dotnet
export PATH=$PATH:/home/yohannes/.local/bin
export AZURE_DEVOPS_PAT="..."
export PATH="$HOME/.scripts:$PATH"
export STARSHIP_CONFIG=~/.config/starship.toml
export BROWSER="$HOME/bin/wsl-host-browser"

autoload -U colors && colors
export KEYTIMEOUT=1

# 1. Aktiver Vi-mode som standard
bindkey -v
VI_MODE_ENABLED=true

# 2. Funksjon for å vise både NORMAL og INSERT status
function zle-keymap-select {
  if [ "$VI_MODE_ENABLED" = true ]; then
    local ins_prompt="%{$fg_bold[green]%}[INSERT]%{$reset_color%}"
    local cmd_prompt="%{$fg_bold[yellow]%}[NORMAL]%{$reset_color%}"
    
    # Bytter RPS1 basert på om KEYMAP er vicmd (normal) eller noe annet (insert)
    RPS1="${${KEYMAP/vicmd/$cmd_prompt}/(main|viins)/$ins_prompt}"
  else
    RPS1=""
  fi
  zle reset-prompt
}

# 3. Toggle-funksjon (fikset for både alias og hurtigtast)
toggle-vi-mode() {
  if [ "$VI_MODE_ENABLED" = true ]; then
    bindkey -e
    VI_MODE_ENABLED=false
    RPS1=""
    [[ -n "$WIDGET" ]] && zle reset-prompt || echo -e "\e[31mEmacs mode\e[0m"
  else
    bindkey -v
    VI_MODE_ENABLED=true
    zle-keymap-select
    [[ -n "$WIDGET" ]] && zle reset-prompt || echo -e "\e[32mVi mode\e[0m"
  fi
}

# 4. Registrer widgets
zle -N zle-keymap-select
zle -N toggle-vi-mode

# 5. Snarveier (Shortcuts)
bindkey '^v' toggle-vi-mode    # Ctrl + v toggler mellom Vi og Emacs
alias vimode='toggle-vi-mode'  # Kommandoen 'vimode' gjør det samme

# Sikrer at insert-status vises med en gang terminalen starter
zle-keymap-select

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/opt/nvim/"


eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)
. "/home/yohannes/.deno/env"

# Auto-start SSH agent
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)" > /dev/null
  ssh-add ~/.ssh/id_rsa_ado 2>/dev/null
fi


# ─── TMUX: auto-rename window to current folder ───────────────────────────────
_tmux_set_window_name() {
    [ -z "$TMUX" ] && return
    local manual
    manual=$(tmux show-window-option -v @manual_rename 2>/dev/null)
    [ "$manual" = "1" ] && return
    tmux rename-window "$(basename "$PWD")"
}

_tmux_chpwd() {
    [ -z "$TMUX" ] && return
    tmux set-window-option @manual_rename 0
    tmux rename-window "$(basename "$PWD")"
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd _tmux_chpwd
add-zsh-hook precmd _tmux_set_window_name

# Launch the E2E Checker Windows TUI from its own directory (so it finds e2e_cache.sqlite)
e2e_checker() {
  ( cd "/mnt/c/Users/yohannes.kassaye/dev/E2E-Checker" && ./e2e_checker.exe "$@" )
}

# Docker Sandboxes (sbx)
export PATH="$HOME/.docker/sbx/bin:$PATH"
