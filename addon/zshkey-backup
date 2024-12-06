#!/usr/bin/env zsh 

# Gán phím Alt + mũi tên trái để quay lại thư mục trước
bindkey '^[^[[D' backward-cd

# Gán phím Alt + mũi tên phải để đi tới thư mục tiếp theo
bindkey '^[^[[C' forward-cd

# Hàm backward-cd để di chuyển về thư mục trước
backward-cd() {
    cd -
}

# Hàm forward-cd để đi tới thư mục tiếp theo
forward-cd() {
    cd "$OLDPWD"
}


# Gán phím Alt + mũi tên
bindkey '^[^[[D' backward-cd  # Alt + Left
bindkey '^[^[[C' forward-cd   # Alt + Right
