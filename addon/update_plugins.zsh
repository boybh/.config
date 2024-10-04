#!/bin/zsh 

# Cập nhật plugins trong ~/.oh-my-zsh/plugins
echo "Cập nhật plugins trong ~/.oh-my-zsh/plugins"
cd ~/.oh-my-zsh/plugins || { echo "Không thể truy cập đến thư mục ~/.oh-my-zsh/plugins"; exit 1; }
for dir in */; do
    echo "Đang cập nhật plugin: $dir"
    cd "$dir" || continue
    if [ -d ".git" ]; then
        git pull
    else
        echo "Plugin $dir không phải là repository Git."
    fi
    cd .. || exit
done

# Cập nhật plugins trong ~/.config/custom/plugins
echo "Cập nhật plugins trong ~/.config/custom/plugins"
cd ~/.config/custom/plugins || { echo "Không thể truy cập đến thư mục ~/.config/custom/plugins"; exit 1; }
for dir in */; do
    echo "Đang cập nhật plugin: $dir"
    cd "$dir" || continue
    if [ -d ".git" ]; then
        git pull
    else
        echo "Plugin $dir không phải là repository Git."
    fi
    cd .. || exit
done

