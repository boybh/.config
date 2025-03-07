# =============================================== #
# Cấu hình Zsh của bạn - gọn gàng và dễ quản lý   #
# =============================================== #

# 1. Thiết lập môi trường cơ bản
# ------------------------------
#export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Loại bỏ các đường dẫn Windows từ PATH
#export PATH=$(echo $PATH | tr ':' '\n' | grep -v '/mnt/c' | tr '\n' ':')
export ZDOTDIR="$HOME/.config"
export ADDON="$HOME/.config/addon"
export ZS="$HOME/.config/zsh"
export TERM="xterm-256color"          # Đặt terminal hỗ trợ 256 màu
export LANG="vi_VN.UTF-8"       # Thiết lập ngôn ngữ là tiếng Việt
export LC_ALL="vi_VN.UTF-8"
export LC_CTYPE="vi_VN.UTF-8"
export LC_MESSAGES="vi_VN.UTF-8"
export LANGUAGE="vi_VN.UTF-8"
export LC_NUMERIC="vi_VN.UTF-8"     # Định dạng số
export LC_TIME="vi_VN.UTF-8"        # Định dạng thời gian
export LC_COLLATE="vi_VN.UTF-8"     # Cách sắp xếp chuỗi
export LC_MONETARY="vi_VN.UTF-8"     # Định dạng tiền tệ
export MANWIDTH=80
export MANPAGER="less -s"
export CAUHINH="/mnt/e/config/cauhinh"
export ZSH="$HOME/.oh-my-zsh"
export ZIM_HOME="$HOME/.config/custom/plugins/zimfw"
export ZIM_MODULES_DIR="$HOME/.config/custom/plugins"
export ZIM_CONFIG_FILE=~/.config/zsh/zimrc
export GAWK_ENCODING='UTF-8'
export GAWK_OPTIONS='--option=value'
export GAWK_OPTIONS='--gnu'
export LESSOPEN="| bat --style=full --color=always --paging=always %s"
export LESS='-R -M -S --mouse --quit-if-one-screen'
export BAT_CONFIG_PATH="$HOME/.config/bat"
#export FZF_BASE=~/.fzf
export ZPLUGINDIR="$HOME/.config/custom/plugins"
export ZPFX="$HOME/.config/custom/plugins/zinit"
export ZSH_CUSTOM="$HOME/.config/custom"
export GH_BINPATH=$ZPLUGINDIR
export GPG_TTY=$(tty)
export GITHUB_TOKEN=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
#export GH_TOKEN="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"
#export YOUR_AUTHTOKEN="2keUqgyNsZAWWgp2d4o3UOtMWwv_6qRWxRzxti8FhdUj1MkUD"
#export GH_TOKEN="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"
export install_path="$HOME/.nano/nanorc"
WORDCHARS=${WORDCHARS//[\/]}
#----------------------------------
# Bỏ dấu comment dòng dưới đây để sử dụng hoàn thành lệnh phân biệt chữ hoa, chữ thường.
# CASE_SENSITIVE="true"
# Bỏ dấu comment dòng dưới đây để sử dụng hoàn thành lệnh không phân biệt dấu gạch nối.
# Chế độ phân biệt chữ hoa, chữ thường phải tắt. _ và - sẽ thay thế lẫn nhau.
#HYPHEN_INSENSITIVE="true"
# Bỏ dấu comment một trong các dòng dưới đây để thay đổi chế độ cập nhật tự động.
# zstyle ':omz:update' mode disabled  # tắt cập nhật tự động
#zstyle ':omz:update' mode auto      # cập nhật tự động mà không hỏi
# zstyle ':omz:update' mode reminder  # chỉ nhắc nhở tôi khi đến lúc cập nhật
# Bỏ dấu comment dòng dưới đây để thay đổi tần suất cập nhật tự động (theo ngày).
# zstyle ':omz:update' frequency 13
# Bỏ dấu comment dòng dưới đây nếu việc dán URL và văn bản bị lỗi.
#DISABLE_MAGIC_FUNCTIONS="true"
# Bỏ dấu comment dòng dưới đây để tắt màu trong lệnh ls.
# DISABLE_LS_COLORS="true"
# Bỏ dấu comment dòng dưới đây để tắt tự động đặt tiêu đề terminal.
DISABLE_AUTO_TITLE="true"
# Bỏ dấu comment dòng dưới đây để kích hoạt sửa lỗi lệnh tự động.
#ENABLE_CORRECTION="true"
# Bỏ dấu comment dòng dưới đây để hiển thị dấu chấm đỏ trong khi chờ hoàn thành lệnh.
# Bạn cũng có thể đặt thành một chuỗi khác để hiển thị thay vì dấu chấm đỏ mặc định.
# Ví dụ: COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Cảnh báo: thiết lập này có thể gây vấn đề với dòng nhắc nhiều dòng trong zsh < 5.7.1 (xem #5765)
#COMPLETION_WAITING_DOTS="true"
# Bỏ dấu comment dòng dưới đây nếu bạn muốn tắt đánh dấu các tệp không theo dõi
# dưới VCS là "dirty". Điều này làm kiểm tra trạng thái repository nhanh hơn
# cho các repository lớn.
#DISABLE_UNTRACKED_FILES_DIRTY="dirty"
DISABLE_UNTRACKED_FILES_DIRTY="true"

#-----------------------------------------------------#
#							                                 #
#		            [ PLUGIN oh-my-zsh ]                #
#							                                 #
#-----------------------------------------------------#

PLUGIN_FILE="$HOME/.config/zsh/plugin_omz.sh"

#--------------------------------#
if [ -f "$PLUGIN_FILE" ]; then
    source "$PLUGIN_FILE"
fi

#--------------------------------#
source "$ZSH/oh-my-zsh.sh"

# Đặt theme
#ZSH_THEME="powerlevel10k/powerlevel10k"

# Cấu hình người dùng
export MANPATH=/usr/share/man:$MANPATH

#--------------------------------------------------------------------

# Trình soạn thảo ưa thích cho các phiên làm việc cục bộ và từ xa
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vi'
fi

# Cờ biên dịch
#export ARCHFLAGS="-arch $(uname -m)"

# Đặt biến cho đường dẫn đến tệp cấu hình Powerlevel10k
P10K_CONFIG_PATH="$HOME/.config/zsh/.p10k.zsh"
#POWERLEVEL9K_INSTALLATION_DIR="$ZSH_CUSTOM/themes/powerlevel10k"
typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens'

# Nạp cấu hình Powerlevel10k
#source $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme
#if [[ -f "$P10K_CONFIG_PATH" ]]; then
#    source "$P10K_CONFIG_PATH"
#fi

# 2. Cài đặt các alias từ tệp aliases.zsh
# ---------------------------------------
alias saoluu="chmod +x /mnt/e/config/kali/kali.sh && /mnt/e/config/kali/kali.sh backup"
alias khoiphuc="chmod +x /mnt/e/config/kali/kali.sh && /mnt/e/config/kali/kali.sh restore"
alias ls="eza -gh --group-directories-first --git --icons=auto --hyperlink -a"
ALIAS_FILE="$HOME/.config/zsh/aliases.zsh"

if [ -f "$ALIAS_FILE" ]; then
     source "$ALIAS_FILE"
fi

#--------------------[ HISTORY ]-------------------------------------#

HISTFILE="$HOME/.config/zsh/zsh_history"
HISTSIZE=99999       		# Số lượng lệnh được lưu trong bộ nhớ
SAVEHIST=99999      		# Số lượng lệnh được lưu vào file
setopt appendhistory 		# Lưu lịch sử vào file, không ghi đè
setopt histignoredups 		# Bỏ qua các lệnh trùng nhau
setopt sharehistory  		# Chia sẻ lịch sử giữa các phiên Zsh
setopt incappendhistory   	# Lịch sử lưu ngay khi nhập lệnh
setopt extended_history   	# Lịch sử với timestamp
setopt auto_cd            	# Tự động chuyển thư mục khi nhập tên thư mục
setopt histverify         	# Xác nhận lệnh trước khi thực thi
setopt no_beep           	# Tắt âm thanh beep
setopt prompt_subst       	# Cho phép thay thế trong prompt
setopt +o nomatch
setopt monitor
setopt NO_HUP
# 6. Nạp cấu hình tùy chỉnh
# --------------------------
for config_file in "$ZSH_CUSTOM"/*.zsh; do
    [[ -f "$config_file" ]] && source "$config_file"
done

# 7. Cấu hình màu sắc
# ----------------------
autoload -U colors && colors
#PS1="%{$fg[cyan]%}%n@%m %{$fg[green]%}%1~ %{$reset_color%}$"  # Thiết lập màu sắc cho prompt
PS1=$'%{\e['$zcolor[di]$'m%}%~%{\e[m%}/ %# '

# 8. Cấu hình tùy chỉnh
#-----------------------------
source "$ZS/taoalias.zsh"
source "$ZS/taoplugin.zsh"
source "$ZS/namesever.zsh"
#source "$ZS/zsh_unplugged.zsh"
#source "$ZS/fpath.zsh"
source "$ZS/key.zsh"
source "$ADDON/cauhinh_fzf.zsh"
source "$ZSH_CUSTOM/plugins/zinit/zinit.zsh"
source "$HOME/.config/zsh/zinit_theme.zsh"
#source "$HOME/.config/addon/install_bat.sh"
source "$HOME/.config/bat/bat.zsh"
source "$HOME/.config/addon/plugin-all.zsh"
#source "$ZS/git_config.sh"
#source "$ZSH_CUSTOM/plugins/zinit/zinit.zsh"
#source $CAUHINH/zsh-hoanthanh.zsh
#source $CAUHINH/zinit_custom.zsh
export FZF_TAB_ALWAYS_COMPLETE=1

#--------------------------------------------
# Đặt đường dẫn cho file .zcompdump ở một thư mục khác
ZSH_COMPDUMP="$ZS/.zcompdump"

# Tự động tạo lại tệp .zcompdump nếu cần thiết
if [[ ! -f $ZSH_COMPDUMP ]]; then
    compinit
    compdump -d "$ZSH_COMPDUMP"
fi

if [[ -z "$ZSH_COMPDUMP_LOADED" ]]; then
    # Kiểm tra và nạp compdump nếu chưa có
    autoload -Uz compinit
    compinit

    # Đặt biến ZSH_COMPDUMP_LOADED để ghi nhớ rằng compdump đã được nạp
   export ZSH_COMPDUMP_LOADED=1
fi

# Thêm đường dẫn hoàn thành vào fpath
if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi
#fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
#fpath+=(/usr/local/share/zsh/site-functions $fpath)

#export PATH="$PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/home/kali"
export GITSTATUS_LOG_LEVEL=DEBUG
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Để kích hoạt hoàn thành tự động argcomplete
#eval "$(register-python-argcomplete ...)"
#export XDG_RUNTIME_DIR=/run/user/$(id -u)
#zinit light zdharma-continuum/fast-syntax-highlighting
#zinit light zdharma-continuum/history-search-multi-word
#zinit light junegunn/fzf
#zinit light hlissner/zsh-autopair
#zinit light ohmyzsh/ohmyzsh
#zinit snippet OMZP::copyfile
#zinit snippet OMZP::
#source ~/.config/custom/plugins/zimfw/zimfw.zsh
#source ~/.config/addon/zimfw_custom.zsh
# autojump config
#[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

#autoload -U compinit && compinit -u

# FZF config
export FZF_BASE=~/.fzf
#export PATH="/usr/local/sbin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#. $ADDON/zimfw_key.zsh
enable-fzf-tab

# Kiểm tra và cài đặt vim-plug nếu chưa được cài đặt
if [ ! -f ~/.config/nvim/plug.vim ]; then
  echo "Cài đặt vim-plug..."
  curl -fLo ~/.config/nvim/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  echo "Cài đặt vim-plug..."
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
