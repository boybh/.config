#!/usr/bin/env zsh 

# BIẾN MÔI TRƯỜNG
export config="$HOME/.config"
export oc="/mnt/c"
export od="/mnt/d"
export oe="/mnt/e"
export apps="$oe/apps"
export addon="$oe/config/zsh/addon"
export cauhinh="/mnt/e/config/cauhinh"


# Sử dụng `source` cho các tệp script thay vì `export`.
#source $custom/select_all.zsh


# Fast
# Đảm bảo đóng ngoặc đúng chỗ, tránh lỗi mảng cú pháp.
#export FAST_HIGHLIGHT_STYLES=(
  #"keyword:fg=red,bold"
  #"string:fg=green"
  #"comment:fg=cyan,italic"
  #"variable:fg=yellow"
 # "function:fg=blue,bold"
#) 

# Kích hoạt hoàn thành lệnh
autoload -U compinit; compinit
#autoload -Uz compinit
#compinit -d ~/.zcompdump
zle -N autosuggest-accept

# Wiget Custom
#source /root/.oh-my-zsh/custom/plugins/custom-widgets.zsh
#source $addon/fzf_custom.zsh
#export FPATH="$zsh_custom/plugins/eza/completions/zsh:$FPATH"

# Cấu hình tùy chỉnh
#source $z/aliases.zsh
#source $ZSH_CUSTOM/alias_custom.zsh
#source $addon/select_all.zsh
#source $custom/2_key-bindings.zsh
