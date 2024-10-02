if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel9k" # set by `omz`

plugins=(
    alias-finder
    aliases
    ansible
    apache2-macports
    bundler
    branch
    cake
    cakephp3
    colored-man-pages
    common-aliases
    command-not-found
    composer
    copybuffer
    copyfile
    copypath
    cp
    debian
    dirhistory
    dirpersist
    dotenv
    eza
    extract
    fasd
    fastfile
    fzf
    fzf-tab
    fnm
    frontend-search
    gcloud
    git
    gitfast
    gitignore
    github
    git-prompt
    globalias
    gradle
    httpie
    jsontools
    last-working-dir
    man
    nmap
    npm
    nvm
    pip
    pipenv
    python
    rake
    rbenv
    rsync
    ruby
    sdk
    ssh
    sudo
    systemadmin
    systemd
    supervisor
    toolbox
    tmux
    universalarchive
    ufw
    ubuntu
    themes
    transfer
    textmate
    vi-mode
    web-search
    yum
    z
    zsh-autosuggestions
    zsh-interactive-cd
    zsh-completions
    argocd
    zsh-navigation-tools
    azure
    1password
    term_tab
    tmux-cssh
    tmuxinator
    git-auto-fetch
    git-commit
    git-extras
    magic-enter
    archlinux
    colorize
    compleat
    history-substring-search
    history
    emacs
    F-Sy-H
    fancy-ctrl-z
    cdwin
    alias-maker)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi
# ================================================
# Cấu hình Zsh của bạn - gọn gàng và dễ quản lý
# ================================================

# 1. Thiết lập môi trường cơ bản
# ------------------------------
export LANG="vi_VN.UTF-8"       # Thiết lập ngôn ngữ là tiếng Việt
export LC_ALL="vi_VN.UTF-8"
export LC_CTYPE="vi_VN.UTF-8"
export LC_MESSAGES="vi_VN.UTF-8"
export LANGUAGE="vi_VN.UTF-8"

# 2. Thiết lập thư mục custom cho các cấu hình
# --------------------------------------------
export config="~/.config"
#export ZSH_CUSTOM="$HOME/.config/custom"


# 3. Cấu hình alias (bí danh) cho các lệnh thường dùng
# ----------------------------------------------------
alias c='clear'
alias h='history'
if [ -f /mnt/e/.boybh/.aliases ]; then
    source /mnt/e/.boybh/.aliases
fi

# 5. Đường dẫn cho các công cụ (path)
# -----------------------------------
export PATH="$HOME/bin:$PATH"


# 7. Cấu hình cuối cùng
# ----------------------
alias naplai='source ~/.zshrc'

# ================================================
# Hết file .zshrc - Bạn có thể thêm phần khác nếu cần
# ================================================

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
enable-fzf-tab
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
