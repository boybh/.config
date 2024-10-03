#!/usr/bin/env zsh

# Hàm để thực hiện chmod cho thư mục và các tệp bên trong
chmod_all() {
  local perms="${1:-755}"  # Quyền mặc định là 755 nếu không cung cấp quyền
  local path="$2"  # Đường dẫn được cung cấp

  # Nếu không có đường dẫn được cung cấp
  if [[ -z $path ]]; then
    echo "Usage: chmod_all [permissions] <path>"
    return 1
  fi

  # Nếu không cung cấp quyền, gán quyền mặc định là 755
  if [[ ! "$perms" =~ ^[0-9]{3,4}$ ]]; then
    path="$perms"  # Di chuyển quyền vào biến đường dẫn
    perms="755"   # Đặt lại quyền mặc định
  fi

  # Giải quyết biến đường dẫn (mở rộng các biến môi trường)
  path=$(eval echo "$path")

  # Kiểm tra nếu đường dẫn tồn tại
  if [[ -e "$path" ]]; then
    # Chạy lệnh chmod dưới sudo
    sudo chmod -R "$perms" "$path"
    echo "Đã thay đổi quyền truy cập cho tất cả các tệp trong $path với quyền $perms"
  else
    echo "Đường dẫn không tồn tại: $path"
  fi
}

# Hàm để thực hiện chown cho thư mục và các tệp bên trong
chown_all() {
  local user="${1:-$USER}"  # Người dùng mặc định là người dùng hiện tại nếu không cung cấp
  local path="$2"  # Đường dẫn được cung cấp

  # Nếu không có đường dẫn được cung cấp
  if [[ -z $path ]]; then
    echo "Usage: chown_all [user] <path>"
    return 1
  fi

  # Giải quyết biến đường dẫn (mở rộng các biến môi trường)
  path=$(eval echo "$path")

  # Kiểm tra nếu đường dẫn tồn tại
  if [[ -e "$path" ]]; then
    # Chạy lệnh chown dưới sudo với tùy chọn --preserve-root
    sudo chown --preserve-root -R "$user:$user" "$path"
    echo "Đã thay đổi quyền sở hữu cho tất cả các tệp trong $path với người dùng $user"
  else
    echo "Đường dẫn không tồn tại: $path"
  fi
}

# Hàm để thêm quyền thực thi cho tất cả các tệp trong thư mục và các thư mục bên trong
chx_all() {
  local path="$1"  # Đường dẫn được cung cấp

  # Nếu không có đường dẫn được cung cấp
  if [[ -z $path ]]; then
    echo "Usage: chx_all <path>"
    return 1
  fi

  # Giải quyết biến đường dẫn (mở rộng các biến môi trường)
  path=$(eval echo "$path")

  # Kiểm tra nếu đường dẫn tồn tại
  if [[ -e "$path" ]]; then
    # Chạy lệnh chmod +x dưới sudo cho tất cả các tệp trong thư mục và các thư mục bên trong
    sudo find "$path" -type f -exec chmod +x {} +
    echo "Đã thêm quyền thực thi cho tất cả các tệp trong $path"
  else
    echo "Đường dẫn không tồn tại: $path"
  fi
}
