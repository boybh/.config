#!/usr/bin/env zsh

# Màu văn bản
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Không màu

# Kiểm tra và thay đổi shell mặc định thành Zsh
DEFAULT_SHELL=$(getent passwd "$USER" | cut -d: -f7)
if [ "$DEFAULT_SHELL" != "$(which zsh)" ]; then
    echo "${YELLOW}Đang thay đổi shell mặc định thành Zsh...${NC}"
    chsh -s $(which zsh)
fi

# Hiển thị menu chính
echo "${BLUE}Chọn hành động:${NC}"
echo "1) Sao lưu"
echo "2) Khôi phục"
echo "3) Thoát"
read -r ACTION

if [ "$ACTION" = "3" ]; then
    echo "${RED}Đang thoát.${NC}"
    exit 0
fi

# Chọn sao lưu hoặc khôi phục
case $ACTION in
    1)
        # Hiển thị menu chọn nơi lưu file sao lưu
        echo "${BLUE}Chọn thư mục sao lưu:${NC}"
        echo "1) /mnt/e/config/kali"
        echo "2) $HOME/backup"
        echo "3) Đường dẫn tùy chỉnh"
        echo "4) Thoát"
        read -r CHOICE

        if [ "$CHOICE" = "4" ]; then
            echo "${RED}Đang thoát.${NC}"
            exit 0
        fi

        case $CHOICE in
            1)
                BACKUP_DIR="/mnt/e/config/kali"
                ;;
            2)
                BACKUP_DIR="$HOME/backup"
                ;;
            3)
                echo "${BLUE}Nhập đường dẫn sao lưu tùy chỉnh:${NC}"
                read -r BACKUP_DIR
                ;;
            *)
                echo "${RED}Lựa chọn không hợp lệ. Đang thoát.${NC}"
                exit 1
                ;;
        esac

        # Kiểm tra thư mục sao lưu
        if [ ! -d "$BACKUP_DIR" ]; then
            echo "${YELLOW}Thư mục sao lưu không tồn tại. Đang tạo thư mục...${NC}"
            mkdir -p "$BACKUP_DIR"
        fi

        # Hiển thị danh sách các mục sao lưu
        echo "${BLUE}Các mục sao lưu có sẵn:${NC}"
        echo "1) Gói đã cài đặt"
        echo "2) ~/.zshrc"
        echo "3) ~/.nanorc"
        echo "4) ~/.oh-my-zsh"
        echo "5) ~/.fzf"
        echo "6) Tập tin /root"
        echo "7) Nguồn APT"
        echo "8) Khóa tin cậy APT"
        echo "9) Crontab"
        echo "10) /etc/"
        echo "11) Cấu hình người dùng (home/boybh)"
        echo "12) Addons (ví dụ: vim, nano)"
        echo "13) Cấu hình WSL"
        echo "14) Thoát"

        echo "${BLUE}Nhập các mục để sao lưu (cách nhau bằng dấu phẩy, ví dụ: 1,2,3) hoặc '14' để thoát:${NC}"
        read -r ITEMS

        if [ "$ITEMS" = "14" ]; then
            echo "${RED}Đang thoát.${NC}"
            exit 0
        fi

        # Tạo dấu thời gian cho tên file sao lưu
        TIMESTAMP=boybh										#$(date +"%d-%m-%Y")

        # Tên file sao lưu với dấu thời gian
        BACKUP_FILE="$BACKUP_DIR/kali-packages-backup_$TIMESTAMP.txt"
        ZSHRC_BACKUP="$BACKUP_DIR/zshrc-backup_$TIMESTAMP.txt"
        NANO_BACKUP="$BACKUP_DIR/nano-backup_$TIMESTAMP.txt"
        OH_MY_ZSH_BACKUP="$BACKUP_DIR/oh-my-zsh-backup_$TIMESTAMP.tar.gz"
        FZF_BACKUP="$BACKUP_DIR/fzf-backup_$TIMESTAMP.tar.gz"
        ROOT_BACKUP="$BACKUP_DIR/root-backup_$TIMESTAMP.tar.gz"
        APT_SOURCES_BACKUP="$BACKUP_DIR/apt-sources-backup_$TIMESTAMP.tar.gz"
        APT_TRUSTED_BACKUP="$BACKUP_DIR/apt-trusted-backup_$TIMESTAMP.tar.gz"
        CRONTAB_BACKUP="$BACKUP_DIR/crontab-backup_$TIMESTAMP.tar.gz"
        ETC_BACKUP="$BACKUP_DIR/etc-backup_$TIMESTAMP.tar.gz"
        ADDON_BACKUP="$BACKUP_DIR/addon-backup_$TIMESTAMP.tar.gz"
        WSL_BACKUP="$BACKUP_DIR/wsl-backup_$TIMESTAMP.tar.gz"
        USER_CONFIG_BACKUP="$BACKUP_DIR/user-config-backup_$TIMESTAMP.tar.gz"

        # Sao lưu các mục được chọn
        IFS=',' read -r -A ITEMS_ARRAY <<< "$ITEMS"

        for ITEM in "${ITEMS_ARRAY[@]}"; do
            case $ITEM in
                1)
                    echo "${GREEN}Đang sao lưu gói đã cài đặt...${NC}"
                    dpkg --get-selections > "$BACKUP_FILE"
                    ;;
                2)
                    echo "${GREEN}Đang sao lưu ~/.zshrc...${NC}"
                    cp ~/.zshrc "$ZSHRC_BACKUP"
                    ;;
                3)
                    echo "${GREEN}Đang sao lưu ~/.nanorc...${NC}"
                    cp ~/.nanorc "$NANO_BACKUP"
                    ;;
                4)
                    echo "${GREEN}Đang sao lưu ~/.oh-my-zsh...${NC}"
                    tar -czf "$OH_MY_ZSH_BACKUP" -C ~ .oh-my-zsh
                    ;;
                5)
                    echo "${GREEN}Đang sao lưu ~/.fzf...${NC}"
                    tar -czf "$FZF_BACKUP" -C ~ .fzf .fzf.zsh .fzf.bash
                    ;;
                6)
                    echo "${GREEN}Đang sao lưu tập tin /root...${NC}"
                    sudo tar -czf "$ROOT_BACKUP" -C /root/ .bashrc .profile .zshrc .nanorc .fzf .fzf.zsh .fzf.bash
                    ;;
                7)
                    echo "${GREEN}Đang sao lưu nguồn APT...${NC}"
                    sudo tar -czf "$APT_SOURCES_BACKUP" -C /etc/apt sources.list sources.list.d
                    ;;
                8)
                    echo "${GREEN}Đang sao lưu khóa tin cậy APT...${NC}"
                    sudo tar -czf "$APT_TRUSTED_BACKUP" -C /etc/apt trusted.gpg.d trusted.gpg
                    ;;
                9)
                    echo "${GREEN}Đang sao lưu crontab...${NC}"
                    sudo crontab -l > "$BACKUP_DIR/crontab_$TIMESTAMP"
                    sudo tar -czf "$CRONTAB_BACKUP" /var/spool/cron/crontabs/
                    ;;
                10)
                    echo "${GREEN}Đang sao lưu /etc/...${NC}"
                    sudo tar -czf "$ETC_BACKUP" -C / etc
                    ;;
                11)
                    echo "${GREEN}Đang sao lưu cấu hình người dùng (home/boybh)...${NC}"
                    sudo tar -czf "$USER_CONFIG_BACKUP" -C /home/boybh .
                    ;;
                12)
                    echo "${GREEN}Đang sao lưu addons...${NC}"
                    tar -czf "$ADDON_BACKUP" -C ~/.vim .vimrc -C ~/.nano .nanorc
                    ;;
                13)
                    echo "${GREEN}Đang sao lưu cấu hình WSL...${NC}"
                    sudo tar -czf "$WSL_BACKUP" /etc/wsl.conf
                    ;;
                *)
                    echo "${RED}Mục $ITEM không hợp lệ. Đang bỏ qua.${NC}"
                    ;;
            esac
        done

        echo "${GREEN}Sao lưu hoàn tất.${NC}"
        echo "${BLUE}Các file sao lưu:${NC}"
        [ -f "$BACKUP_FILE" ] && echo "Sao lưu gói: $BACKUP_FILE"
        [ -f "$ZSHRC_BACKUP" ] && echo "Sao lưu Zshrc: $ZSHRC_BACKUP"
        [ -f "$NANO_BACKUP" ] && echo "Sao lưu cấu hình Nano: $NANO_BACKUP"
        [ -f "$OH_MY_ZSH_BACKUP" ] && echo "Sao lưu Oh My Zsh: $OH_MY_ZSH_BACKUP"
        [ -f "$FZF_BACKUP" ] && echo "Sao lưu FZF: $FZF_BACKUP"
        [ -f "$ROOT_BACKUP" ] && echo "Sao lưu /root: $ROOT_BACKUP"
        [ -f "$APT_SOURCES_BACKUP" ] && echo "Sao lưu nguồn APT: $APT_SOURCES_BACKUP"
        [ -f "$APT_TRUSTED_BACKUP" ] && echo "Sao lưu khóa APT: $APT_TRUSTED_BACKUP"
        [ -f "$CRONTAB_BACKUP" ] && echo "Sao lưu crontab: $CRONTAB_BACKUP"
        [ -f "$ETC_BACKUP" ] && echo "Sao lưu /etc: $ETC_BACKUP"
        [ -f "$USER_CONFIG_BACKUP" ] && echo "Sao lưu cấu hình người dùng: $USER_CONFIG_BACKUP"
        [ -f "$ADDON_BACKUP" ] && echo "Sao lưu addons: $ADDON_BACKUP"
        [ -f "$WSL_BACKUP" ] && echo "Sao lưu cấu hình WSL: $WSL_BACKUP"
        ;;
    2)
        # Hiển thị menu chọn đường dẫn khôi phục
        echo "${BLUE}Chọn thư mục khôi phục:${NC}"
        echo "1) /mnt/e/config/kali"
        echo "2) $HOME/backup"
        echo "3) Đường dẫn tùy chỉnh"
        echo "4) Thoát"
        read -r CHOICE

        if [ "$CHOICE" = "4" ]; then
            echo "${RED}Đang thoát.${NC}"
            exit 0
        fi

        case $CHOICE in
            1)
                RESTORE_DIR="/mnt/e/config/kali"
                ;;
            2)
                RESTORE_DIR="$HOME/backup"
                ;;
            3)
                echo "${BLUE}Nhập đường dẫn khôi phục tùy chỉnh:${NC}"
                read -r RESTORE_DIR
                ;;
            *)
                echo "${RED}Lựa chọn không hợp lệ. Đang thoát.${NC}"
                exit 1
                ;;
        esac

        # Kiểm tra thư mục khôi phục
        if [ ! -d "$RESTORE_DIR" ]; then
            echo "${YELLOW}Thư mục khôi phục không tồn tại. Đang tạo thư mục...${NC}"
            mkdir -p "$RESTORE_DIR"
        fi

        # Hiển thị danh sách các mục khôi phục
        echo "${BLUE}Các mục khôi phục có sẵn:${NC}"
        echo "1) Gói đã cài đặt"
        echo "2) ~/.zshrc"
        echo "3) ~/.nanorc"
        echo "4) ~/.oh-my-zsh"
        echo "5) ~/.fzf"
        echo "6) Tập tin /root"
        echo "7) Nguồn APT"
        echo "8) Khóa tin cậy APT"
        echo "9) Crontab"
        echo "10) /etc/"
        echo "11) Cấu hình người dùng (home/boybh)"
        echo "12) Addons (ví dụ: vim, nano)"
        echo "13) Cấu hình WSL"
        echo "14) Thoát"

        echo "${BLUE}Nhập các mục để khôi phục (cách nhau bằng dấu phẩy, ví dụ: 1,2,3) hoặc '14' để thoát:${NC}"
        read -r RESTORE_ITEMS

        if [ "$RESTORE_ITEMS" = "14" ]; then
            echo "${RED}Đang thoát.${NC}"
            exit 0
        fi

        IFS=',' read -r -A RESTORE_ITEMS_ARRAY <<< "$RESTORE_ITEMS"

        for ITEM in "${RESTORE_ITEMS_ARRAY[@]}"; do
            case $ITEM in
                1)
                    echo "${GREEN}Đang khôi phục gói đã cài đặt...${NC}"
                    sudo dpkg --set-selections < "$RESTORE_DIR/kali-packages-backup_$TIMESTAMP.txt"
                    sudo apt-get dselect-upgrade
                    ;;
                2)
                    echo "${GREEN}Đang khôi phục ~/.zshrc...${NC}"
                    cp "$RESTORE_DIR/zshrc-backup_$TIMESTAMP.txt" ~/.zshrc
                    ;;
                3)
                    echo "${GREEN}Đang khôi phục ~/.nanorc...${NC}"
                    cp "$RESTORE_DIR/nano-backup_$TIMESTAMP.txt" ~/.nanorc
                    ;;
                4)
                    echo "${GREEN}Đang khôi phục ~/.oh-my-zsh...${NC}"
                    tar -xzf "$RESTORE_DIR/oh-my-zsh-backup_$TIMESTAMP.tar.gz" -C ~
                    ;;
                5)
                    echo "${GREEN}Đang khôi phục ~/.fzf...${NC}"
                    tar -xzf "$RESTORE_DIR/fzf-backup_$TIMESTAMP.tar.gz" -C ~
                    ;;
                6)
                    echo "${GREEN}Đang khôi phục tập tin /root...${NC}"
                    sudo tar -xzf "$RESTORE_DIR/root-backup_$TIMESTAMP.tar.gz" -C /root/
                    ;;
                7)
                    echo "${GREEN}Đang khôi phục nguồn APT...${NC}"
                    sudo tar -xzf "$RESTORE_DIR/apt-sources-backup_$TIMESTAMP.tar.gz" -C /etc/apt
                    ;;
                8)
                    echo "${GREEN}Đang khôi phục khóa tin cậy APT...${NC}"
                    sudo tar -xzf "$RESTORE_DIR/apt-trusted-backup_$TIMESTAMP.tar.gz" -C /etc/apt
                    ;;
                9)
                    echo "${GREEN}Đang khôi phục crontab...${NC}"
                    sudo tar -xzf "$RESTORE_DIR/crontab-backup_$TIMESTAMP.tar.gz" -C /var/spool/cron/crontabs/
                    ;;
                10)
                    echo "${GREEN}Đang khôi phục /etc/...${NC}"
                    sudo tar -xzf "$RESTORE_DIR/etc-backup_$TIMESTAMP.tar.gz" -C /
                    ;;
                11)
                    echo "${GREEN}Đang khôi phục cấu hình người dùng (home/boybh)...${NC}"
                    sudo tar -xzf "$RESTORE_DIR/user-config-backup_$TIMESTAMP.tar.gz" -C /home/boybh
                    ;;
                12)
                    echo "${GREEN}Đang khôi phục addons...${NC}"
                    tar -xzf "$RESTORE_DIR/addon-backup_$TIMESTAMP.tar.gz" -C ~
                    ;;
                13)
                    echo "${GREEN}Đang khôi phục cấu hình WSL...${NC}"
                    sudo tar -xzf "$RESTORE_DIR/wsl-backup_$TIMESTAMP.tar.gz" -C /etc
                    ;;
                *)
                    echo "${RED}Mục $ITEM không hợp lệ. Đang bỏ qua.${NC}"
                    ;;
            esac
        done

        echo "${GREEN}Khôi phục hoàn tất.${NC}"
        ;;
    *)
        echo "${RED}Lựa chọn không hợp lệ. Đang thoát.${NC}"
        exit 1
        ;;
esac
