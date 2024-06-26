# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"

# history
export HISTFILE=~/.zsh_history # Where it gets saved
export HISTSIZE=10000
export SAVEHIST=10000
export HISTCONTROL=ignoredups
setopt append_history # Don't overwrite, append!
setopt INC_APPEND_HISTORY # Write after each command
setopt hist_expire_dups_first # Expire duplicate entries first when trimming history.
setopt hist_fcntl_lock # use OS file locking
setopt hist_ignore_all_dups # Delete old recorded entry if new entry is a duplicate.
setopt hist_lex_words # better word splitting, but more CPU heavy
setopt hist_reduce_blanks # Remove superfluous blanks before recording entry.
setopt hist_save_no_dups # Don't write duplicate entries in the history file.
setopt share_history # share history between multiple shells
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.

# Binds
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# Path to your oh-my-zsh installation.
export ZSH="/Users/kirillosintsev/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# User configuration

test -e ~/.dircolors && eval `gdircolors -b ~/.dircolors`

### FZF
export FZF_DEFAULT_OPTS="
  --bind 'ctrl-f:page-down,ctrl-b:page-up,ctrl-o:execute(code {})+abort'
  --color fg:102,bg:233,hl:65,fg+:15,bg+:234,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tmux
DISABLE_AUTO_TITLE=true

# Zplug
source ~/.zplug/init.zsh
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/helm", from:oh-my-zsh

zplug "~/.zsh_custom", from:local

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "zsh-users/zsh-history-substring-search"
if zplug check zsh-users/zsh-history-substring-search; then
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
fi

# zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
zplug "zsh-users/zsh-autosuggestions"
if zplug check zsh-users/zsh-autosuggestions; then
   ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down) 
   # Add history-substring-search-* widgets to list of widgets that clear the autosuggestion
   ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}") 
   # Remove *-line-or-history widgets from list of widgets that clear the autosuggestion to avoid conflict with history-substring-search-* widgets
fi

# Alias Tips
zplug "djui/alias-tips"

# Fast navigation (better cd)
zplug "skywind3000/z.lua", use:z.lua.plugin.zsh

# Theme
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Install plugins if there are plugins that have not been installed
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi
zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

