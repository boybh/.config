man_trans() {
    # Kiểm tra nếu có đối số
    if [ -z "$1" ]; then
        echo "Sử dụng: man_trans <tên lệnh>"
        return 1
    fi

    # Lấy nội dung từ man
    man_output=$(man "$1" 2>&1)

    # Kiểm tra nếu có lỗi (chẳng hạn như không tìm thấy lệnh)
    if [[ $? -ne 0 ]]; then
        echo "$man_output"  # Hiển thị lỗi
        return 1
    fi

    # Dịch nội dung sang tiếng Việt
    echo "$man_output" | trans -b :vi | bat
}
