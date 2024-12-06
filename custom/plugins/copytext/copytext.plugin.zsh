# Hàm để sao chép nội dung file vào clipboard Windows
copytext() {
  if [ -z "$1" ]; then
    echo "Vui lòng cung cấp đường dẫn đến file."
  elif [ ! -f "$1" ]; then
    echo "File không tồn tại: $1"
  else
    # Đọc nội dung file với mã hóa UTF-8 và lưu vào biến
    content=$(iconv -f UTF-8 -t UTF-8 "$1")

    # Truyền nội dung vào clip.exe để sao chép vào clipboard
    echo "$content" | "/mnt/c/Windows/System32/clip.exe"

    echo "Nội dung của $1 đã được sao chép vào clipboard."
  fi
}

