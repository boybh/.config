#!/usr/bin/env zsh

# Danh sách các nameserver cần kiểm tra
nameservers=("8.8.8.8" "8.8.4.4" "45.90.28.0" "45.90.30.0")

# Kiểm tra từng nameserver
for ns in "${nameservers[@]}"; do
    if grep -q "^nameserver $ns" /etc/resolv.conf; then
        # Nếu đã tồn tại, có thể không hiển thị gì hoặc hiển thị thông báo tùy chọn
        echo "$ns already exists in /etc/resolv.conf" > /dev/null
    else
        # Nếu chưa tồn tại, thêm vào mà không hiển thị thông báo
        echo "nameserver $ns" | sudo tee -a /etc/resolv.conf > /dev/null
    fi
done

