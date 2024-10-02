# Hàm để lọc các file không mong muốn
filter_unwanted_files() {
  local -a files
  files=("${(@)1:#*.dll}")
  files=("${(@)files:#*.tmp}")
  files=("${(@)files:#*.bak}")
  # Thêm các loại file khác nếu cần
  _alternative \
    'files:Files:_files -g "(*.*)(.)"' \
    'directories:Directories:_directories' \
    && return 0
}

# Cấu hình hoàn thành lệnh sử dụng hàm lọc
zstyle ':completion:*:default' filter-unwanted-files
