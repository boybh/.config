# Tải ZimFW
if [ ! -f "$ZIM_HOME/init.zsh" ]; then
  echo "ZimFW chưa được cài đặt, hãy cài đặt bằng lệnh:"
  echo "export ZIM_HOME=\$HOME/.config/.zim && curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh"
else
  source $ZIM_HOME/init.zsh
fi

