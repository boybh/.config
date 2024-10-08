#!/usr/bin/zsh
zstyle ':znap:*' repos-dir ~/.config/znap
zstyle ':znap:*' auto-compile no
# Kiểm tra và tải znap
[[ -r ~/.config/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.config/znap
source ~/.config/znap/znap.zsh

# Cấu hình prompt
# `znap prompt` giúp hiển thị prompt nhanh chóng trong khoảng 15-40ms!
znap prompt romkatv/powerlevel10k

# Khởi động các plugin
# `znap source` bắt đầu các plugin.
znap source marlonrichert/zsh-autocomplete
znap source ohmyzsh/ohmyzsh
znap source ytet5uy4/fzf-widgets
znap source Aloxaf/fzf-tab
znap source marlonrichert/zcolors
znap eval zcolors "zcolors ${(q)LS_COLORS}"

# Tối ưu hóa hiệu suất
# `znap eval` giúp việc đánh giá đầu ra của lệnh được nhanh hơn gấp 10 lần.
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# Kết hợp `znap eval` với `curl` hoặc `wget` để tải xuống, lưu trữ và thực thi
# các tệp riêng lẻ:
znap eval omz-git 'curl -fsSL \
	https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh'
znap eval omz-git 'curl -fsSL \
	https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/alias-finder/alias-finder.plugin.zsh'
znap eval omz-git 'curl -fsSL \
	https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/aliases/aliases.plugin.zsh'
znap eval omz-git 'curl -fsSL \
	 https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/eza/eza.plugin.zsh'
# Lazy-loading (tải khi cần)
# `znap function` cho phép bạn tải các tính năng mà bạn không luôn cần.
znap function _pyenv pyenv "znap eval pyenv 'pyenv init - --no-rehash'"
compctl -K _pyenv pyenv

znap function _pyenv pyenv              'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

znap function _pip_completion pip       'eval "$( pip completion --zsh )"'
compctl -K    _pip_completion pip

znap function _python_argcomplete pipx  'eval "$( register-python-argcomplete pipx  )"'
complete -o nospace -o default -o bashdefault \
           -F _python_argcomplete pipx

znap function _pipenv pipenv            'eval "$( pipenv --completion )"'
compdef       _pipenv pipenv

# Cài đặt các lệnh và hoàn thành
# `znap install` thêm các lệnh mới và hoàn thành.
znap install zsh-users/zsh-completions
