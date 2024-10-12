#plugins select_all
# Kiểm tra nếu shell đang ở chế độ tương tác
if [[ -o interactive ]]; then
  # Function để chọn tất cả các từ trên dòng lệnh
  function select_all() {
    # Di chuyển con trỏ đến đầu dòng
    zle beginning-of-line
    # Chọn toàn bộ dòng
    zle kill-whole-line
    # Quay lại chế độ chèn
    zle vi-editing-mode
  }

  # Gán phím tắt Ctrl + a để chọn tất cả
  zle -N select_all
  bindkey '^a' select_all
fi
