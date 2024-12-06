#!/bin/zsh

# Đường dẫn tới thư mục custom plugins của oh-my-zsh
ZSH_CUSTOM=$HOME/.config/custom

# Danh sách các plugins với GitHub URLs tương ứng
declare -A PLUGIN_URLS
PLUGIN_URLS=(
  [git]=""
  [1password]=""
  [alias-finder]=""
  [aliases]=""
  [archlinux]=""
  [autoupdate]="https://github.com/TamCore/autoupdate-oh-my-zsh-plugins"
  [branch]=""
  [bundler]=""
  [colored-man-pages]=""
  [colorize]=""
  [common-aliases]=""
  [compleat]=""
  [command-not-found]=""
  [copybuffer]=""
  [copypath]=""
  [copyzshell]=""
  [cp]=""
  [debian]=""
  [dirhistory]=""
  [dirpersist]=""
  [dotenv]=""
  [dropbox]=""
  [emacs]=""
  [encode64]=""
  [extract]=""
  [fastfile]=""
  [frontend-search]=""
  [gcloud]=""
  [gh]=""
  [globalias]=""
  [last-working-dir]=""
  [man]=""
  [nmap]=""
  [pip]=""
  [pipenv]=""
  [python]=""
  [rails]=""
  [rake]=""
  [rbenv]=""
  [repo]=""
  [rsync]=""
  [ruby]=""
  [sdk]=""
  [snap]=""
  [ssh]=""
  [sudo]=""
  [supervisor]=""
  [svn-fast-info]=""
  [systemadmin]=""
  [systemd]=""
  [term_tab]=""
  [textmate]=""
  [themes]=""
  [tmux]=""
  [tmuxinator]=""
  [transfer]=""
  [ubuntu]=""
  [ufw]=""
  [universalarchive]=""
  [wakeonlan]=""
  [z]="https://github.com/rupa/z"
  [zsh-interactive-cd]=""
  [zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions"
  [gitignore]=""
  [gitfast]=""
  [cd-ls]=""
  [cd-gitroot]=""
  [fast-syntax-highlighting]="https://github.com/zdharma-continuum/fast-syntax-highlighting"
  [github]=""
  [git-auto-fetch]=""
  [git-commit]=""
  [git-extras]=""
  [git-prompt]=""
  [F-Sy-H]=""
  [find-file]=""
  [copyfile]=""
  [kubectl]=""
  [kubectx]=""
  [profiles]=""
  [virtualenvwrapper]=""
  [tmux-cssh]=""
  [nanoc]=""
  [terminitor]=""
  [pylint]=""
  [pyenv]=""
  [zsh-navigation-tools]=""
  [zsh-autopair]=""
  [eza]=""
  [zsh-you-should-use]=""
  [fzf-tab]="https://github.com/Aloxaf/fzf-tab"
  [phanquyen]=""
  [environment]=""
)

# Hàm kiểm tra và cài đặt plugin
install_plugin() {
  local plugin=$1
  local plugin_url=$2

  # Kiểm tra plugin có sẵn trong oh-my-zsh hay không
  if [[ -d "$ZSH_CUSTOM/plugins/$plugin" ]]; then
    echo "Plugin $plugin đã tồn tại."
  else
    if [[ -n "$plugin_url" ]]; then
      echo "Cloning plugin $plugin from $plugin_url..."
      git clone $plugin_url "$ZSH_CUSTOM/plugins/$plugin"
    else
      echo "Plugin $plugin không có URL. Cần kiểm tra thủ công."
    fi
  fi
}

# Lặp qua danh sách các plugin và cài đặt
for plugin in "${(@k)PLUGIN_URLS}"; do
  install_plugin $plugin $PLUGIN_URLS[$plugin]
done

# Kích hoạt plugin trong ~/.zshrc
echo "Kích hoạt các plugin trong ~/.zshrc..."
for plugin in "${(@k)PLUGIN_URLS}"; do
  if ! grep -q "$plugin" ~/.zshrc; then
    echo "Kích hoạt plugin $plugin trong ~/.zshrc"
    sed -i "/^plugins=(/a \  $plugin" ~/.zshrc
  fi
done

echo "Hoàn tất!"
