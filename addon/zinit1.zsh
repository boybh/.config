# Plugin fzf-bin
zinit light Aloxaf/fzf-tab
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf-bin

# Plugin fd, bat, exa, docker-compose
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zinit light ogham/exa

zinit ice from"gh-r" as"program" mv"docker* -> docker-compose"
zinit light docker/compose

# jarun/nnn, a file browser
zinit pick"misc/quitcd/quitcd.zsh" sbin make light-mode for jarun/nnn

# Other plugins
zinit ice as"program" pick"yank" make
zinit light mptre/yank

# zsh-autosuggestions
zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions

# Powerlevel10k
zinit ice wait'!' lucid atload'true; _p9k_precmd' nocd
zinit light romkatv/powerlevel10k
