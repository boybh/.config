alias suacus="sudo nano /root/.oh-my-zsh/custom/custom.zsh"
alias xc='$ZSH_CUSTOM'
alias excus="$zsh_custom/example.zsh"
alias add="python3 /mnt/e/config/zsh/addon/add.py"
alias aio="/mnt/e/config/zsh/addon/aio.sh"
alias suabien="nano /mnt/e/config/zsh/bien.zsh"
alias runkali='python3 "/mnt/e/config/zsh/addon/kali.py"'

#Alias addon
alias adds='sudo sh "/mnt/e/config/zsh/addon/them.zsh"'
alias fcd='cd $(find . -type d | fzf)'
alias omzc="$HOME/.oh-my-zsh/custom/"
alias fixzsp="$addon/fix_zsh_permissions.zsh"

#zsh
alias xx=zsh
alias kali="/home/kali"
alias gitpush='echo "Are you sure? (yes/no)" && read confirm && [ "$confirm" = "yes" ] && git push'
alias nn="sudo nano"
alias nt++="/mnt/e/PortableApps/Notepad/Notepad++.exe"
alias ipa="curl ifconfig/all"
alias suaals="sudo nano /mnt/e/config/cauhinh/aliases.zsh"
alias suaapt="nano /etc/apt/sources.list"
alias suafzf_h="nano ~/fzf_history_search.zsh"
alias suaapa="nano /etc/apache2/apache2.conf"
alias suawsl="nano /etc/wsl.conf"
alias tatkali="sudo shutdown -r now"
alias rs="reboot"
alias taothumuc="sudo mkdir -p"
alias setroot="sudo chown -R root:root"
alias chmod755="sudo chmod -R 755"
alias a2ens="sudo a2ensite"
alias runapa="sudo service apache2 reload"
alias a2enm="sudo a2enmod rewrite"
alias uprs="chmod +x /mnt/e/config/kali/rsync-update.sh && /mnt/e/config/kali/rsync-update.sh"

#Apache2
alias runapa="sudo service apache2 start"
# Linh Tinh #
alias zboy="$zsh_boybh"
alias shutdown="sudo /sbin/shutdown"
alias update="sudo apt update"
alias upgrade="sudo apt upgrade -y"
alias aconfig="nvim ~/.config/alacritty/alacritty.yml"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias android=" ~/Downloads/android-studio/bin/studio.sh"
alias googledrive="XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
alias xampp="sudo /opt/lampp/manager-linux-x64.run"
alias postman="~/Postman/app/Postman"
alias system="inxi -Fxz"
alias vim="nvim"
alias dev="yarn dev"
alias gs="git status"
alias gb="git branch"
alias gc="git commit --no-verify -m"
alias gca="git commit --no-verify --amend -m"
alias gp="git push origin"
alias gpf="git push -f origin"
alias gco="git checkout"
alias gcm="git checkout master && git pull origin master"
alias gma="git commit -a"
alias gl="git log --oneline --graph"
alias bashrc="nvim ~/.bashrc"
alias dev5="DEV_PORT=5000 yarn dev"
alias in="sudo apt install -y"
alias e="exit"
alias au="sudo apt autoremove"
alias picomstart="/home/sen/.config/picom/autoblurpicom.sh"
alias picomc="nvim ~/.config/picom/picom.conf"
# remapping CAPSLOCK to ESCAPE
alias esc="xmodmap -e 'clear Lock' -e 'keysym Caps_Lock = Escape'"
alias f="find . |grep "
alias c="clear"
alias :q="exit"
alias backup="cp /root/.zshrc /mnt/e/config/kali-backup/.zshrc"
alias ipt="sudo /sbin/iptables"
alias iptlist="sudo /sbin/iptables -L -n -v --line-numbers"
alias iptlistin="sudo /sbin/iptables -L INPUT -n -v --line-numbers"
alias iptlistout="sudo /sbin/iptables -L OUTPUT -n -v --line-numbers"
alias iptlistfw="sudo /sbin/iptables -L FORWARD -n -v --line-numbers"
alias ln="ln -i"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"
alias ping="ping -c 5"
alias fastping="ping -c 100 -s.2"
alias ports="netstat -tulanp"
alias rm="rm -I --preserve-root"
alias update="sudo apt-get update --yes"
alias updateall="sudo apt-get update && sudo apt-get upgrade"
alias root="sudo -i"
alias su="sudo -i"
alias reboot="sudo /sbin/reboot"
alias poweroff="sudo /sbin/poweroff"
alias halt="sudo /sbin/halt"
alias nginxreload="sudo /usr/local/nginx/sbin/nginx -s reload"
alias nginxtest="sudo /usr/local/nginx/sbin/nginx -t"
alias lightyload="sudo /etc/init.d/lighttpd reload"
alias lightytest="sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t"
alias httpdreload="sudo /usr/sbin/apachectl -k graceful"
alias httpdtest="sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS"
alias dnstop="dnstop -l 5  eth1"
alias vnstat="vnstat -i eth1"
alias iftop="iftop -i eth1"
alias tcpdump="tcpdump -i eth1"
alias ethtool="ethtool eth1"
alias cpuinfo="lscpu"
alias gpumeminfo="grep -i --color memory /var/log/Xorg.0.log"
alias wget="wget -c"
alias ff4="/opt/firefox4/firefox"
alias ff13="/opt/firefox13/firefox"
alias chrome="/opt/google/chrome/chrome"
alias cdd="/home/kali"
# display all rules #
alias firewall=iptlist
alias header="curl -I"
alias oc="$oc"
alias od="$od"
alias oe="/mnt/e"
alias editport="nano /etc/apache2/ports.conf"
alias stopng="sudo service nginx stop"
alias web="cd /var/www/html/"
#Tuy Chinh
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias la="ls -A"
#alias Tienich
alias tat-plugins="deactivate_plugin"
alias list-plugins="list_plugins"
alias suaweb="sudo nano /etc/nginx/sites-enabled/default"
alias ep="sudo nano ~/.oh-my-zsh/custom/tienich.zsh"
alias upfzf="cd ~/.fzf && git pull && ./install"
alias cdzcus="$ZSH/custom"
alias bashadd="bash /root/.config/zsh_config/add.sh"
alias zshadd="zsh /root/.config/zsh_config/add.zsh"
alias addzshrc="zshadd ~/.zshrc"
alias themcauhinh="/mnt/e/config/zsh/addon/themsource.zsh"
alias copybien='sed -n "/^export /p"'
alias sua_add_py='sudo nano "/mnt/e/config/zsh/addon/add.py"'
alias sua_add_sh='sudo nano "/mnt/e/config/zsh/addon/add.py"'
# $ #
alias xx='cd "/mnt/e/config/zsh/"'

# LinhTinh #
alias quanque=quanq
alias copydong='python3 "$addon/copydong.py"'
alias taoals.sh="/mnt/e/config/zsh/addon/add_alias.sh"
alias alicus="~/.oh-my-zsh/custom/alias_custom.zsh"
alias scus='source ~/.oh-my-zsh/custom/custom.zsh'

# cd #
alias s=source
alias 1='cd /root/'
alias 2='cd /home/boybh/'
alias 3='cd $config/zsh'
alias 4='cd $cauhinh'
alias 5='cd $HOME/.oh-my-zsh/custom'
alias 6='cd $ZSH_CUSTOM/plugins'
alias 7='cd /mnt/e/.boybh/addon'
alias 8='cd /mnt/c/User/boybh'
alias 9='cd $HOME'

# ~/.zsh_aliases
alias addals='add_alias'
alias sshboybh="ssh -p 22 -i ~/.ssh/id_rsa boybh@20.255.187.102"
alias root@="root@220.255.187.102"
alias ompl='omz plugin'
alias omcs='~/.oh-my-zsh/custom'
alias them='/mnt/e/config/zsh/addon/them.zsh'
alias ll="eza --icons --group-directories-first --color=auto -axliF -a"
alias upcus="/root/.config/addon/upload_custom.sh"
alias tai="youtube-dl"
alias taimp4="yt-dlp -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]"

# ~/.zsh_aliases
alias addals='add_alias'
alias sshboybh="ssh -p 22 -i $HOME/.ssh/id_rsa boybh@20.255.187.102"
alias ipvps="220.255.187.102"
alias ompl='omz plugin'
alias omcs='$HOME/.oh-my-zsh/custom'
alias them='$addon/them.zsh'
alias them='/mnt/e/config/zsh/addon/them.zsh'
alias ll="eza --icons --group-directories-first --color=auto -axliF -a"
alias ext=extract
alias xemtime=timedatectl
alias capnhattime='sudo timedatectl set-timezone Asia/Ho_Chi_Minh'
alias eals="nn $ZSH_CUSTOM/aliases.zsh"
alias aio="/mnt/e/config/zsh/addon/aio.sh"
alias aio2="/mnt/e/.boybh/addon/aio.sh"
alias loadoh="omz plugin load"
alias chm="chmod_all 755"
alias cho="chown_all -R $USER:$USER"
alias gitxuong="git pull boybh"
alias gitlen="git push boybh"
alias .b="$HOME/.boybh"
alias upgit="/mnt/e/.boybh/addon/update_git.sh"
alias b="/mnt/e/.boybh"
alias checko="/mnt/e/.boybh/addon/check_ownership.zsh"
alias chuyenali="$boybh/addon/convert_alias.sh"
alias chmodssh="/mnt/e/.boybh/addon/chmodssh.zsh"
alias quyen="ls -ld"
alias nvi="~/.config/nvim/init.vim"
alias up~="sudo /mnt/e/.boybh/addon/update_git_~.sh"
alias via="sudo vi /mnt/e/config/cauhinh/aliases.zsh"
alias svi='sudo vi'
alias nna='sudo nano -l $config/aliases.zsh'
alias p="~/.config/custom/plugins.zsh"
alias upcus="/root/.config/addon/upload_custom.sh"
alias updategit='~/.config/update_git.zsh'
alias cprf="sudo cp -rf"
alias cdc="cd ~/.config"
alias vicus='sudo vi ~/.config/custom/custom.zsh'
alias up="~/.config/addon/update_plugins.zsh"
alias jav="/mnt/d/Newfolder"
alias pywed="python3 -m http.server 8000"
alias dd="/mnt/c/Users/boybh/Desktop"
alias capnhat_zshrc="sudo cp -rf /root/.zshrc /root/.config/.zshrc"
alias curlw="/mnt/c/WINDOWS/system32/curl.exe"
alias gpc="git push origin config"
alias zsh_custom="$ZSH_CUSTOM"
alias vi~="svi $HOME/.zshrc"
alias .c="$HOME/.config"
alias lld="eza --icons --group-directories-first --color=auto -axliF -a --sort=modified"
alias ali="/mnt/e/config/cauhinh/aliases.zsh"
alias upali="cp /mnt/e/config/cauhinh/aliases.zsh ~/.config/aliases.zsh"
alias gc.='gc "Cập nhật"'
alias gc-a="git commit -a"
alias clip="/mnt/c/Windows/System32/clip.exe"
alias nssm="/mnt/e/dnsproxy/nssm.exe"
alias winget="/mnt/e/cmder/bin/scoop/shims/winget.exe"
alias choco="/mnt/e/cmder/bin/chocolatey/bin/choco.exe"
alias cs="~/.config/custom"
alias nnznap="sudo nano ~/.config/znap_custom.zsh"
alias cdz="~/.config/znap"
alias vizim="vi ~/.zimrc"
alias nzi="nano ~/.zimfw"
alias gitroot="git push root root --force"
alias alsm="root/.config/custom/plugins/alias-maker"
alias zicus="nano ~/.config/zinit_custom.zsh"
alias zb="/home/boybh/.zshrc"
alias zr="/root/.zshrc"
alias zrc="/root/.config/.zshrc"
alias nnzb="nano /home/boybh/.config/.zshrc"
alias nnzim='nano ~/.config/.zimrc'
alias zii='zi install'
alias suazcf='nano ~/.config/.zshrc'
alias xoaals='unalias'
alias copy='cp -v -f -r'
alias ziin='zimfw uninstall && zimfw install && exec zsh'
alias nnini='nano $ZIM_HOME/init.zsh'
alias zib='zimfw build'
alias fixroot='sudo /mnt/e/config/zsh/addon/fix.zsh'
alias nnzpl='nano $CAUHINH/zplug_custom.zsh'
alias vizi='vi $CAUHINH/zinit_custom.zsh'
alias xoazcom='sudo rm -rf ~/.zcompdump; compinit && sudo rm -rf ~/.cache'
alias nnzi='sudo nano $CAUHINH/zinit_custom.zsh'
alias copyf='copy_to_clipboard'
alias suapl='sudo nano $ZSH_CUSTOM/plugins/plugins.zsh'
alias copytext='xclip -sel clip <'
alias gar='git add .'
alias gcmr='git commit -m "UPDATE NHÁNH ROOT"'
alias zcus='$ZSH_CUSTOM'
alias .ch="$CAUHINH"
alias nfd='mkdir -p -v'
alias doinhanh='git branch -m'
alias vizs='vi /mnt/e/config/cauhinh/zstyle.zsh'
alias viwsl='vi /etc/wsl.conf'
alias ouponly='onedrive --synchronize --upload-only'
alias odown='onedrive --synchronize --download-only'
alias osyns='onedrive --synchronize'
alias oonl='onedrive --monitor'
alias note='/mnt/e/PortableApps/Notepad/Notepad++.exe'
alias vie='sudo vi ~/.config/custom/edit_plugin.zsh'
alias plugincus='cd $ZSH_CUSTOM/plugins'
alias kat='sudo python3 ~/katoolin3/katoolin3.py'
alias gitpull_config='git pull git@github.com:boybh/.config.git config --force'
alias omzpa='omz plugin enable'
alias gitpoc='git push origin config --force'
alias ifplugin='omz plugin info'
alias saoluu_user='chx /mnt/e/config/kali/saoluu-khoiphuc.sh && /mnt/e/config/kali/saoluu-khoiphuc.sh backup'
alias khoiphuc_user='chx /mnt/e/config/kali/saoluu-khoiphuc.sh && /mnt/e/config/kali/saoluu-khoiphuc.sh restore'
alias od_apps='cd /mnt/d/Apps/'
alias caingrok='curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo deb'
alias shellcolor='curl -q -s -LJO "https://github.com/kyletimmermans/shell-color-prompt-tool/releases/download/latest/shell-color-prompt-tool.sh" && chmod +x shell-color-prompt-tool.sh'
alias vizsh='sudo vi /root/.zshrc'
alias gitaddroot='git remote add root git@github.com:boybh/root.git'
alias caizsh='sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh-bin/master/install)"'
alias omp='oh-my-posh.exe'
alias omzload='omz plugin load select-all'
alias venv='python3 -m venv'
alias nn='nano'
alias sua~='nano ~/.zshrc'
alias zim='zimfw'
alias cus='~/.config/custom'
alias caionedrivecli='/mnt/d/Apps/install_onedrive_cli.zsh'
alias onedrivecli='source /home/kali/.onedrivecli-env/bin/activate && onedrive-cli'
alias onedrive='onedrive'
alias xoazcom2='sudo rm -f ~/.zcompdump; compinit'
alias fixsys='fix_system_permissions'
alias taogit='gh repo create ----private'
alias gituser='~/.config/addon/gituser.zsh'
alias copy="cp -ivf"
alias nfds='sudo mkdir -p -v -f'
alias snn='sudo nano'
alias gitzcolor='git clone https://github.com/marlonrichert/zcolors.git /home/kali/.config/custom/plugins/zcolors'
alias sualoi='python3 ~/.config/addon/kiemtra-sualoi.py'
alias link_hoanthanh='~/.config/addon/link_hoanthanh.sh'
alias ghlogin='/mnt/d/BACKUP/GITCONFIG/git_config.sh'
alias gha='gh auth login --with-token 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'
alias apt-git-lfs='curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo zsh'
alias gitb='git branch --color --list'
alias ga='git add'
alias gitcm='git commit -m'
alias chokali='sudo chown -R kali:kali'
alias pyw='python3 -m http.server'
alias ncatRS='ncat -v -l -4 127.0.0.1 -p 4444'
alias upkali='source /mnt/e/config/cauhinh/update.zsh'
alias ss='sudo service'
alias git_forgit='git clone https://github.com/wfxr/forgit.git /home/kali/.config/custom/plugins/forgit'
#alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
alias gitra='git add . && git commit -m "Lưu" && git pull --rebase'
alias del='sudo rm -rf'
alias upft='cd /home/kali/.config/custom/plugins/fzf-tab && git pull'
alias sett='sudo setoolkit'
alias lk='sudo ln -s'
alias less='less --color=always'
alias ngau='ngrok config add-authtoken '
alias dup='sudo apt-get dist-upgrade'
alias pls='plugin-source'
alias supg='sudo apt-get upgrade -f'
alias cailai='sudo apt-get install --reinstall'
alias upa='update-alternatives'
alias omzpi='omz plugin info'
alias themu_boybh='sudo useradd -s /bin/zsh -c boybh -d /root boybh'
alias rmf='remove_from_fpath'
alias rmp='remove_from_path'
alias adp='add_to_path'
alias adf='add_to_fpath'
alias adp='add_to_path'
alias x='sudo apt-get purge'
alias -g -- l='le -aG'
alias ghc='gh repo clone'
alias ld='ls -l'
alias sch755='sudo chmod 0755'
alias chx='sudo chmod +x -R'
#alias --help='--help 2>&1 | bat --language=help --style=Fusion'
alias srm='sudo apt-get purge -y'
alias ald='alias_delete'
alias ala='alias_add'
alias all='alias_list'
alias gmm='git commit -m'
alias xsel:0='Xvfb :0 &'
alias cp='cp -i'
alias ope='omz plugin enable'
alias opi='omz plugin info'
alias opd='omz plugin disable'
#alias --help='--help 2>&1 | batcat --language=help --style=Fusion | trans -b vi'
alias scut='sudo mv -if'
alias caighex='/home/kali/.config/addon/gh_ex.sh'
#alias -g -- --help="--help ... 2>&1 | trans -b :vi --no-auto | stdbuf -oL bat --language=help --style=full --color=always"
#alias -g -- --help="--help ... 2>&1 | trans -b :vi --no-auto | tee /tmp/output.txt | bat --language=help --style=full --color=always"
alias -g -- --help='--help 2>&1 | bat --language=help --style=full --color=always'
#alias -g -- -h='--help 2>&1 | trans -b --no-auto :vi | bat --language=help --style=full --color=auto'

#alias -g -- -h='-h ... 2>&1 | bat --language=help --style=full --color=always'
alias caiman='/home/kali/.config/addon/caidat_man.sh'
alias dichcat='trans -b :vi | cat'
alias dichtxt='trans -b :vi > /tmp/vi.txt'
alias caibat='~/.config/addon/install_bat.sh'
alias cd='cd '
alias gitaa='git add .config/zsh/aliases.zsh'
alias caidatall='/home/kali/.config/addon/caidat.sh'
alias li='du -sh'
alias gr='git remote -v'
alias taodeb='sudo npm2deb create'
alias fd='fdfind'
alias plc='plugin-clone'
alias cloneplugin='/root/.config/addon/plugins-clone.sh'
alias q='fg'
alias caioh='sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
alias .z='nano ~/.config/.zshrc'
alias f5='source ~/.config/.zshrc'
alias caiplugin='install-plugin'
alias d='sudo rm -rf'
alias le='eza --icons=always --group-directories-first --color=always --extended -ai --group-directories-last'
alias cai='sudo apt-get install -y'
alias cpp='copypath'
alias cl_androiRAT='gh repo clone karma9874/AndroRAT /root/apps/AndroRAT'
alias cai_noip='~/.config/addon/cai_noip.zsh'
alias cai_vi='~/.config/addon/cai_vi.sh'
alias manvi='man --locale=vi_VN.UTF-8'
alias addkey_keyserver.ubuntu.com='sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 871920D1991BC93C'
alias gawk='sudo gawk'
alias gsc='git secrets --scan'
alias cat='bat'
alias dichhelp='trans -b :vi --no-auto'
alias l='le -ax -F'
alias dia='df -h | bat --language=help --style=full --color=always --theme=TwoDark'
alias .pl='/root/.config/custom/plugins'
alias xoaapt='sudo add-apt-repository --remove'
alias aptneo='apt-get install apt-transport-https lsb-release ca-certificates && \ wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \ echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \ apt-get update'
alias cpzsh='cp -rf ~/.config/zsh /mnt/e/config/cauhinh'
alias cpalias='rm -rf /mnt/e/config/cauhinh/aliases.zsh && cp -rf /root/.config/zsh/aliases.zsh /mnt/e/config/cauhinh'
alias caimake='sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen gettext'
alias taineoevim='cd ~/.config && curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && sudo chmod u+x nvim.appimage'
alias neo='~/.config/nvim.appimage'
alias caineovim='git clone https://github.com/neovim/neovim.git && cd ~/neovim && sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen gettext && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install && sudo rm -rf ~/neovim'
alias viz='vim ~/.config/.zshrc'
alias cainano='git clone https://git.savannah.gnu.org/git/nano.git && cd nano && ./configure && make && sudo make install && sudo rm -rf ~/nano'
alias cpt='copytext'
