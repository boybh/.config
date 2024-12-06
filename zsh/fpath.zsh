# Thêm nhiều thư mục vào fpath
for dir in /usr/local/share/zsh/site-functions $HOME/.config/custom/plugins/fzf-tab-source/functions $HOME/.config/custom/plugins/fzf-tab-source/source; do
  if (( ! ${fpath[(I)$dir]} )); then
    fpath=($dir $fpath)
  fi
done
