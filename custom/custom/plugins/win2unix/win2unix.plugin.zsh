# Hàm chuyển đổi đường dẫn Windows sang đường dẫn Unix
function win2unix_path() {
  local path="$1"

  # Thay đổi ký tự phân cách thư mục từ \ thành /
  path="${path//\\//}"

  # Thay đổi ký tự ổ đĩa từ E: thành /mnt/e
  # Có thể thêm các ổ đĩa khác nếu cần
  path="${path//C:/\/mnt\/c}"
  path="${path//D:/\/mnt\/d}"
  path="${path//E:/\/mnt\/e}"
  path="${path//F:/\/mnt\/f}"

  echo "$path"
}

# Ví dụ sử dụng hàm
# echo $(win2unix_path "C:\Users\Username\Documents")
