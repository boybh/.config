#K:\home\boybh\.oh-my-zsh\custom
# Hàm để tự động chuyển đổi đường dẫn Windows sang Unix (dấu /)
convert_path() {
    echo "${1//\\//}"
}

# Tự động chuyển đổi khi chạy lệnh cd
cd() {
    builtin cd "$(convert_path "$1")"
}

cp() {
    builtin cd "$(convert_path "$1")"
}

mv() {
    builtin cd "$(convert_path "$1")"
}
