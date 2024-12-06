#!/bin/zsh

# Plugin tìm file hoặc gói cài đặt lớn

# Hàm tìm file lớn hơn kích thước (mặc định là 100MB)
function tim_file_lon() {
    local size="${1:-100M}"  # Kích thước mặc định là 100MB
    echo "Đang tìm file lớn hơn $size ..."
    sudo find / -type f -size +$size -exec du -h {} + 2>/dev/null | sort -rh | head -n 20
}

# Hàm tìm gói cài đặt lớn nhất (chỉ hỗ trợ hệ thống dựa trên Debian/Ubuntu)
function tim_goi_lon() {
    echo "Đang tìm các gói cài đặt lớn nhất..."
    dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n | tail -n 20 | awk '{ printf "%s MB\t%s\n", $1/1024, $2 }'
}

# Hàm tìm các file rác để xoá (ví dụ: các file log lớn hơn 100MB)
function tim_file_rac() {
    local size="${1:-100M}"  # Kích thước mặc định là 100MB
    echo "Đang tìm các file rác (ví dụ: file log) lớn hơn $size ..."
    sudo find /var/log -type f -size +$size -exec du -h {} + 2>/dev/null | sort -rh | head -n 20
}

# Hàm tìm các gói rác để xoá (chỉ hỗ trợ hệ thống dựa trên Debian/Ubuntu)
function tim_goi_rac() {
    echo "Đang tìm các gói rác để xoá..."
    dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n | head -n 20 | awk '{ printf "%s MB\t%s\n", $1/1024, $2 }'
}

# Alias
alias ffr="tim_file_rac"
alias fgr="tim_goi_rac"
alias ff="tim_file_lon"
alias fg="tim_goi_lon"
