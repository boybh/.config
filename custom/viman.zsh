# File viman.zsh

function viman() {
    if [[ -z "$1" ]]; then
        echo "Bạn cần chỉ định tên lệnh, ví dụ: viman man"
        return 1
    fi

    # Lấy trợ giúp của lệnh man và dịch sang tiếng Việt
    man "$1" | trans -b :vi | cat
}


####
# Tạo hàm viman để hiển thị tài liệu man và dịch sang tiếng Việt
####viman() {
    # Hiển thị tài liệu man và dịch nội dung sang tiếng Việt
 ####   man "$1" | trans :vi
####n}

#function viman {
#  man --locale=vi_VN.UTF-8 "$1" | bat
#}
