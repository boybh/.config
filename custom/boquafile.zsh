# Hàm lọc để loại bỏ các file không mong muốn
filter_unwanted_files() {
  local -a files
  files=("${(@)1:#*.dll}")
  files=("${(@)files:#*.tmp}")
  files=("${(@)files:#*.bak}")
  # Thêm các loại file khác nếu cần
  _files -g '!(*.dll|*.tmp|*.bak|*.log)'
}

# Cấu hình hoàn thành lệnh sử dụng hàm lọc
zstyle ':completion:*:default' filter filter_unwanted_files
