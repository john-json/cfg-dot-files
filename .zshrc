
#-------------------------------------------------------
# Exports
#-------------------------------------------------------
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/opt/nvim/"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

#-------------------------------------------------------
# Homebrew
#-------------------------------------------------------

export HOMEBREW_NO_ENV_HINTS=1


#-------------------------------------------------------
# Settings zsh
#-------------------------------------------------------

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
zstyle ':omz:update' mode auto      
ZSH_CUSTOM="$HOME/.config/oh-my-zsh/custom"


#-------------------------------------------------------
# plugins
#-------------------------------------------------------
plugins=(git)

source $ZSH/oh-my-zsh.sh

#-------------------------------------------------------
# Editor
#-------------------------------------------------------

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='code'
else
  export EDITOR='nvim'
fi

#-------------------------------------------------------
# Aliases
#-------------------------------------------------------

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias sbrld="brew services reload sketchybar"
alias fm="yazi"
alias vi="nvim"
alias vim="nvim"
alias nvim="nvim"
alias spt="spicetify config current_theme"
alias sps="spicetify config color_scheme"
alias spa="spicetify apply"
alias spba="spicetify backup apply"
alias clock="tty-clock"
alias sys="glances"
alias info="macchina"
alias gcm="cfg commit -m"
alias gadd="cfg add"
alias gits="cfg status"
alias push="cfg push"
alias wtr="curl wttr.in/Nürnberg"
alias cl="clear"
alias lc="colorls -lA --sd"
alias matrix="cmatrix"
alias lt="colorls --tree=1"
alias lt2="colorls --tree=2"
alias stats="colorls --gs"
alias ls="colorls -1 -A"
alias dir="colorls -d"
alias cfg='/usr/bin/git --git-dir=/Users/john/.cfg/ --work-tree=/Users/john'
alias addn="td add"
alias modn="td modify"
alias deln="td clean"
alias togn="td toggle"
alias spotify="spotify_player"
alias reyab="yabai --restart-service && skhd --restart"
alias menu="python3 ~/.config/customenu-cli/startmenu.py"


# Source custom alias files
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh


#-------------------------------------------------------
# Loaders        
#-------------------------------------------------------

eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh)"

#-------------------------------------------------------
# Ansi posh loader
#-------------------------------------------------------

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi

#-------------------------------------------------------
# Jandedobbeleer theme loader
#-------------------------------------------------------

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/tiwahu.omp.json)"

#------------------------------------------------------------------
# customenu
#------------------------------------------------------------------

if [ -z "$GHOSTTY_MENU_SHOWN" ]; then
    export GHOSTTY_MENU_SHOWN=1
    ~/.config/customenu-cli/startmenu.py
fi

#------------------------------------------------------------------
# ruby
#------------------------------------------------------------------


if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# Source - https://stackoverflow.com/a/70618134
# Posted by zhonglaoban
# Retrieved 2026-03-07, License - CC BY-SA 4.0


export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
