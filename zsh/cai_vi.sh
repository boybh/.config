#!/usr/bin/env zsh

# Kiểm tra xem locale vi_VN.UTF-8 đã có sẵn chưa
if ! locale -a | grep -q "vi_VN.UTF-8"; then
    echo "Locale vi_VN.UTF-8 chưa được cài đặt. Đang tiến hành cài đặt..."

    # Cập nhật danh sách gói và cài đặt gói ngôn ngữ Tiếng Việt
   sudo apt-get update
   sudo apt-get install -y language-pack-vi
   sudo apt install gnome-getting-started-docs-vi
   sudo apt install gnome-user-docs-vi


    # Tạo locale vi_VN.UTF-8
   sudo locale-gen vi_VN.UTF-8

    # Cập nhật locale hệ thống
   sudo update-locale LANG=vi_VN.UTF-8

    # Cấu hình lại locale
    sudo dpkg-reconfigure locales

    echo "Đã cài đặt và cấu hình Tiếng Việt (vi_VN.UTF-8) thành công."
else
    echo "Locale vi_VN.UTF-8 đã được cài đặt."
fi

# Cài font Tiếng Việt Cho Kali
sudo apt install fonts-ubuntu fonts-arphic-ukai fonts-arphic-uming
sudo apt install fonts-noto fonts-dejavu
locale
sudo locale-gen vi_VN.UTF-8
sudo update-locale LANG=vi_VN.UTF-8

export LANG=vi_VN.UTF-8
export LANGUAGE=vi_VN:vi
export LC_ALL=vi_VN.UTF-8
export LANG="vi_VN.UTF-8"           # Thiết lập ngôn ngữ là tiếng Việt
export LC_ALL="vi_VN.UTF-8"
export LC_CTYPE="vi_VN.UTF-8"       #
export LC_MESSAGES="vi_VN.UTF-8"    #
export LANGUAGE="vi_VN.UTF-8"       # Cấu hình Tiếng Việt
export LC_NUMERIC="vi_VN.UTF-8"     # Định dạng số
export LC_TIME="vi_VN.UTF-8"        # Định dạng thời gian
export LC_COLLATE="vi_VN.UTF-8"     # Cách sắp xếp chuỗi
export LC_MONETARY="vi_VN.UTF-8"    # Định dạng tiền tệ


# Kiểm tra thiết lập hiện tại
echo "Cấu hình locale hiện tại:"
locale

# Clone fzf vào ~/.fzf nếu chưa tồn tại
if [ ! -d "$HOME/.fzf" ]; then
    echo "Đang clone gói fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    echo "Đã cài đặt fzf."
else
    echo "Gói fzf đã được cài đặt."
fi

# Clone fzf-tab vào ~/.config/custom/plugins nếu chưa tồn tại
if [ ! -d "$HOME/.config/custom/plugins/fzf-tab" ]; then
    echo "Đang clone gói fzf-tab..."
    mkdir -p ~/.config/custom/plugins
    git clone https://github.com/Aloxaf/fzf-tab ~/.config/custom/plugins/fzf-tab
    echo "Đã cài đặt fzf-tab."
else
    echo "Gói fzf-tab đã được cài đặt."
fi

# Clone Powerlevel10k vào ~/.config/custom/plugins nếu chưa tồn tại
if [ ! -d "$HOME/.config/custom/themes/powerlevel10k" ]; then
    echo "Đang clone gói Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/custom/themes/powerlevel10k
    echo "Đã cài đặt Powerlevel10k."
else
    echo "Gói Powerlevel10k đã được cài đặt."
fi

# Clone các plugin bị thiếu vào ~/.config/custom/plugins
# Các plugin khác...
declare -a plugins=(
    "https://github.com/unixorn/alt-and-select alt-and-select"
    "https://github.com/TamCore/autoupdate-oh-my-zsh-plugins autoupdate"
    "https://github.com/olivierverdier/zsh-git-prompt cd-gitroot"
    "https://github.com/kutsan/zsh-system-clipboard clipboard"
    "https://github.com/TamCore/copyzshell copyzshell"
    "https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dropbox dropbox"
    "https://github.com/zdharma-continuum/fast-syntax-highlighting fast-syntax-highlighting"
    "https://github.com/wfxr/forgit forgit"
    "https://github.com/hlissner/zsh-autopair zsh-autopair"
    "https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions"
    "https://github.com/zsh-users/zsh-completions zsh-completions"
    "https://github.com/Tarrasch/zsh-bd fd-zsh"
    "https://github.com/djui/alias-tips alias-tips"
)

for plugin in "${plugins[@]}"; do
    url="${plugin%% *}"
    name="${plugin##* }"

    if [ ! -d "$HOME/.config/custom/plugins/$name" ]; then
        echo "Đang clone gói $name..."
        git clone "$url" "$HOME/.config/custom/plugins/$name"
        echo "Đã cài đặt $name."
    else
        echo "Gói $name đã được cài đặt."
    fi
done



# Tùy chọn: Khởi động lại máy (nếu cần)
echo "Khởi động lại hệ thống để áp dụng thay đổi."
sudo reboot
