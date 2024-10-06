#!/bin/zsh

# Hàm để thêm plugin
them_plugins() {
    local plugin_name="$1"
    if ! grep -q "plugins=.*$plugin_name" ~/.zshrc; then
        sed -i "/^plugins=/ s/)/ $plugin_name)/" ~/.zshrc
        echo "Đã thêm plugin: $plugin_name"
    else
        echo "Plugin $plugin_name đã tồn tại."
    fi
}

# Hàm để xóa plugin
xoa_plugins() {
    local plugin_name="$1"
    if grep -q "plugins=.*$plugin_name" ~/.zshrc; then
        sed -i "/^plugins=/ s/ $plugin_name//" ~/.zshrc
        echo "Đã xóa plugin: $plugin_name"
    else
        echo "Plugin $plugin_name không tồn tại."
    fi
}

# Hàm để thêm alias vào file aliases.zsh
them_alias() {
    local alias_name="$1"
    local alias_command="$2"
    local alias_file="/mnt/e/config/cauhinh/aliases.zsh"

    if ! grep -q "alias $alias_name=" "$alias_file"; then
        echo "alias $alias_name='$alias_command'" >> "$alias_file"
        echo "Đã thêm alias: $alias_name='$alias_command'"
    else
        echo "Alias $alias_name đã tồn tại trong $alias_file"
    fi
}

# Hàm để xóa alias khỏi file aliases.zsh
xoa_alias() {
    local alias_name="$1"
    local alias_file="/mnt/e/config/cauhinh/aliases.zsh"

    if grep -q "alias $alias_name=" "$alias_file"; then
        sed -i "/alias $alias_name=/d" "$alias_file"
        echo "Đã xóa alias: $alias_name"
    else
        echo "Alias $alias_name không tồn tại trong $alias_file"
    fi
}

# Hàm để thêm lệnh source vào .zshrc
them_source() {
    local file_to_source="$1"
    if ! grep -q "source $file_to_source" ~/.zshrc; then
        echo "source $file_to_source" >> ~/.zshrc
        echo "Đã thêm source: $file_to_source vào .zshrc"
    else
        echo "File $file_to_source đã được source trong .zshrc"
    fi
}

# Hàm để xóa lệnh source khỏi .zshrc
xoa_source() {
    local file_to_source="$1"
    if grep -q "source $file_to_source" ~/.zshrc; then
        sed -i "/source $file_to_source/d" ~/.zshrc
        echo "Đã xóa source: $file_to_source khỏi .zshrc"
    else
        echo "File $file_to_source không tồn tại trong .zshrc"
    fi
}

# Hàm để thêm tùy chỉnh khác (mở rộng nếu cần)
them_custom() {
    local custom_line="$1"
    local custom_file="$2"

    if ! grep -q "$custom_line" "$custom_file"; then
        echo "$custom_line" >> "$custom_file"
        echo "Đã thêm tùy chỉnh: $custom_line vào $custom_file"
    else
        echo "Tùy chỉnh $custom_line đã tồn tại trong $custom_file"
    fi
}

# Hàm để xóa tùy chỉnh khác (mở rộng nếu cần)
xoa_custom() {
    local custom_line="$1"
    local custom_file="$2"

    if grep -q "$custom_line" "$custom_file"; then
        sed -i "/$custom_line/d" "$custom_file"
        echo "Đã xóa tùy chỉnh: $custom_line khỏi $custom_file"
    else
        echo "Tùy chỉnh $custom_line không tồn tại trong $custom_file"
    fi
}

# Hàm xử lý tự động hóa dựa trên từ khóa
process_command() {
    local command="$1"
    shift

    case "$command" in
        "them_plugins")
            them_plugins "$@"
            ;;
        "xoa_plugins")
            xoa_plugins "$@"
            ;;
        "them_alias")
            them_alias "$@"
            ;;
        "xoa_alias")
            xoa_alias "$@"
            ;;
        "them_source")
            them_source "$@"
            ;;
        "xoa_source")
            xoa_source "$@"
            ;;
        "them_custom")
            them_custom "$@"
            ;;
        "xoa_custom")
            xoa_custom "$@"
            ;;
        *)
            echo "Lệnh không hợp lệ."
            ;;
    esac
}

# Bắt đầu tự động hóa lệnh với them_ hoặc xoa_
precmd_functions+=(check_command)

check_command() {
    local user_command=$(fc -ln -1)

    # Tìm kiếm các lệnh bắt đầu bằng them_ hoặc xoa_
    if [[ $user_command == them_* || $user_command == xoa_* ]]; then
        # Phân tách phần lệnh và đối số
        local command=$(echo $user_command | awk '{print $1}')
        local args=$(echo $user_command | cut -d' ' -f2-)

        # Gọi hàm xử lý tự động hóa
        process_command "$command" $args
    fi
}
