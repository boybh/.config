# Định nghĩa widget backward-cd
function backward_cd_widget() {
    # Thực hiện hành động tùy chỉnh tại đây
    zle backward-word
}
zle -N backward_cd_widget

# Định nghĩa widget forward-cd
function forward_cd_widget() {
    # Thực hiện hành động tùy chỉnh tại đây
    zle forward-word
}
zle -N forward_cd_widget

# Gán các phím cho widget
bindkey '\e[5~' backward_cd_widget
bindkey '\e[6~' forward_cd_widget

bindkey '^F' forward-cd
bindkey '^B' backward-cd
