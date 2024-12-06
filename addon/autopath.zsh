# Hàm kiểm tra và thêm đường dẫn vào PATH
add_to_path() {
    local dir="$1"
    
    # Kiểm tra nếu đầu vào là $ ~ hoặc / thì xác định đường dẫn thực tế
    if [[ "$dir" == "~" ]]; then
        dir="$HOME"
    elif [[ "$dir" == "$PATH" ]]; then
        dir="$PATH"
    elif [[ "$dir" == "/" ]]; then
        dir="/"
    fi
    
    # Chuẩn hóa đường dẫn để tránh trùng lặp với các dấu / phía sau
    dir=$(realpath "$dir")
    
    # Kiểm tra nếu đường dẫn đã có trong PATH chưa
    if [[ ":$PATH:" != *":$dir:"* ]]; then
        # Thêm đường dẫn vào PATH nếu chưa có
        export PATH="$PATH:$dir"
        echo "Đã thêm $dir vào PATH"
    else
        echo "$dir đã có trong PATH rồi"
    fi
}

# Hàm kiểm tra và thêm đường dẫn vào fpath
add_to_fpath() {
    local dir="$1"
    
    # Kiểm tra nếu đầu vào là $ ~ hoặc / thì xác định đường dẫn thực tế
    if [[ "$dir" == "~" ]]; then
        dir="$HOME"
    elif [[ "$dir" == "$fpath" ]]; then
        dir="$fpath"
    elif [[ "$dir" == "/" ]]; then
        dir="/"
    fi
    
    # Chuẩn hóa đường dẫn để tránh trùng lặp với các dấu / phía sau
    dir=$(realpath "$dir")
    
    # Kiểm tra nếu đường dẫn đã có trong fpath chưa
    if [[ ":$fpath:" != *":$dir:"* ]]; then
        # Thêm đường dẫn vào fpath nếu chưa có
        fpath=($fpath $dir)
        echo "Đã thêm $dir vào fpath"
    else
        echo "$dir đã có trong fpath rồi"
    fi
}

# Hàm kiểm tra và xóa đường dẫn khỏi PATH
remove_from_path() {
    local dir="$1"
    
    # Kiểm tra nếu đầu vào là $ ~ hoặc / thì xác định đường dẫn thực tế
    if [[ "$dir" == "~" ]]; then
        dir="$HOME"
    elif [[ "$dir" == "$PATH" ]]; then
        dir="$PATH"
    elif [[ "$dir" == "/" ]]; then
        dir="/"
    fi
    
    # Chuẩn hóa đường dẫn để tránh trùng lặp với các dấu / phía sau
    dir=$(realpath "$dir")
    
    # Kiểm tra nếu đường dẫn có trong PATH và xóa nó
    if [[ ":$PATH:" == *":$dir:"* ]]; then
        export PATH=$(echo $PATH | sed "s|:$dir||")
        echo "Đã xóa $dir khỏi PATH"
    else
        echo "$dir không có trong PATH"
    fi
}

# Hàm kiểm tra và xóa đường dẫn khỏi fpath
remove_from_fpath() {
    local dir="$1"
    
    # Kiểm tra nếu đầu vào là $ ~ hoặc / thì xác định đường dẫn thực tế
    if [[ "$dir" == "~" ]]; then
        dir="$HOME"
    elif [[ "$dir" == "$fpath" ]]; then
        dir="$fpath"
    elif [[ "$dir" == "/" ]]; then
        dir="/"
    fi
    
    # Chuẩn hóa đường dẫn để tránh trùng lặp với các dấu / phía sau
    dir=$(realpath "$dir")
    
    # Kiểm tra nếu đường dẫn có trong fpath và xóa nó
    if [[ ":$fpath:" == *":$dir:"* ]]; then
        fpath=($(echo $fpath | sed "s|$dir||"))
        echo "Đã xóa $dir khỏi fpath"
    else
        echo "$dir không có trong fpath"
    fi
}

# Tạo alias hoặc command sử dụng các hàm trên
alias removepath='remove_from_path'
alias removefpath='remove_from_fpath'
