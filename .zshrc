#Binds
bindkey "^H" backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

#Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Fzf
source <(fzf --zsh)

#Starship
eval "$(starship init zsh)"

