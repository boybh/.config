# Cấu hình Zinit cho các thư mục tùy chỉnh
#export ZINIT[BIN_DIR]="$HOME/.config/.zinit/bin"
#export ZINIT[HOME_DIR]="$HOME/.config/.zinit"
#export ZINIT[MAN_DIR]="$HOME/.config/.zinit/man"
#export ZINIT[PLUGINS_DIR]="$HOME/.config/.zinit/plugins"
#export ZINIT[COMPLETIONS_DIR]="$HOME/.config/.zinit/completions"
#export ZINIT[SNIPPETS_DIR]="$HOME/.config/.zinit/snippets"
#export ZINIT[ZCOMPDUMP_PATH]="$HOME/.config/.zinit/.zcompdump"
#export ZINIT[COMPINIT_OPTS]="-C"
#export ZINIT[MUTE_WARNINGS]=1
#export ZINIT[NO_ALIASES]=0
#export ZINIT[OPTIMIZE_OUT_DISK_ACCESSES]=1
# Thiết lập thư mục cài đặt Zinit
export ZINIT_HOME="$HOME/.config/.zinit"

# Kiểm tra nếu thư mục chưa tồn tại và cài đặt Zinit
if [[ ! -d "$ZINIT_HOME" ]]; then
  echo "Zinit chưa được cài đặt, tiến hành cài đặt..."
  mkdir -p "$ZINIT_HOME" && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Đặt các biến môi trường cho Zinit
export ZINIT_HOME_DIR="$HOME/.config/.zinit"
export ZINIT_BIN_DIR="$ZINIT_HOME"
export ZINIT_PLUGINS_DIR="$ZINIT_HOME/plugins"
export ZINIT_COMPLETIONS_DIR="$ZINIT_HOME/completions"
export ZINIT_SNIPPETS_DIR="$ZINIT_HOME/snippets"

# Tải và khởi động Zinit
source "$ZINIT_HOME/zinit.zsh"

# Khởi động Zinit
zinit self-update
zinit ice svn
# Tạo các thư mục cần thiết nếu chưa tồn tại
#mkdir -p $ZINIT_PLUGIN_DIR $ZINIT_COMPLETIONS_DIR $ZINIT_BIN_DIR

# Đường dẫn tới file alias và history (tuỳ chỉnh của bạn)
export ALIAS_FILE="/mnt/e/config/cauhinh/aliases.zsh"
export HISTFILE="/mnt/e/config/cauhinh/history.zsh"

# Nạp alias nếu file tồn tại
if [[ -f $ALIAS_FILE ]]; then
  source $ALIAS_FILE
fi
zinit snippet /root/.config/addon/tao-alias.plugin.zsh

# Cấu hình lịch sử lệnh
export HISTSIZE=10000
export SAVEHIST=10000
setopt APPEND_HISTORY      # Thêm lịch sử vào file mà không ghi đè
setopt SHARE_HISTORY       # Chia sẻ lịch sử giữa các phiên làm việc Zsh

# Nạp các plugin với Zinit
zinit light zdharma-continuum/fast-syntax-highlighting  # Tô sáng cú pháp
zinit light zsh-users/zsh-autosuggestions               # Gợi ý lệnh
zinit light zsh-users/zsh-completions                   # Tự động hoàn thành lệnh
zinit light Aloxaf/fzf-tab				# fzf-tab
zinit light /root/.config/addon/bindkey.zsh

# Nạp prompt Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Nạp FZF (fuzzy finder) và kích hoạt các phím tắt
zinit ice depth=1; zinit light junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Các plugin bổ sung
zinit light hlissner/zsh-autopair        # Tự động đóng cặp dấu ngoặc
zinit light wfxr/forgit                  # Hỗ trợ Git
zinit light djui/alias-tips

# Lazy-loading plugin
zinit ice wait"0" atload"_zsh_autosuggest_start"
zinit light agkozak/zsh-z               # Nhảy thư mục với bộ nhớ cache

# Thiết lập prompt với Powerlevel10k
if [[ -r ~/.p10k.zsh ]]; then
  source ~/.p10k.zsh
fi

#---------------------OH-MY-ZSH--------------------
zinit light https://github.com/ohmyzsh/ohmyzsh.git
zinit snippet OMZP::git
zinit snippet OMZP::copypath
zinit snippet OMZP::cp
zinit snippet OMZP::alias-finder
zinit snippet OMZP::aliases
zinit snippet OMZP::common-aliases
zinit snippet OMZP::python
#zinit snippet OMZP::aliases
#zinit snippet OMZ::
##---- Shorthand OMZ/lib/
#zinit snippet OMZL::lib/key-bindings.zsh

#zinit snippet <URL>        # Raw Syntax with URL
#zinit snippet OMZ::<PATH>  # Shorthand OMZ/ (https://github.com/ohmyzsh/ohmyzsh/raw/master/)
#zinit snippet OMZL::<PATH> # Shorthand OMZ/lib/
#zinit snippet OMZT::<PATH> # Shorthand OMZ/themes/
#zinit snippet OMZP::<PATH> # Shorthand OMZ/plugins/
