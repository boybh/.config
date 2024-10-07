#!/usr/bin/env zsh
alias suacus="sudo nano /root/.oh-my-zsh/custom/custom.zsh"
alias xc='$ZSH_CUSTOM'
alias excus="$zsh_custom/example.zsh"
alias l="ls _eza --all --icons='always' --smart-group --group-directories-first"
alias add="python3 /mnt/e/config/zsh/addon/add.py"
alias aio="/mnt/e/config/zsh/addon/aio.sh"
alias beef="/home/beef/"
alias ad="/mnt/e/config/zsh/aio.zsh"
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
alias addon="/mnt/e/config/zsh/addon"
alias zsh="$HOME/.zshrc"
alias gitpush='echo "Are you sure? (yes/no)" && read confirm && [ "$confirm" = "yes" ] && git push'
alias nn="sudo nano"
alias nt++="/mnt/e/PortableApps/Notepad/Notepad++.exe"
alias ipa="curl ifconfig/all"
alias ip="ip addr show"
alias sua~="nano ~/.zshrc"
alias suaals="sudo nano /mnt/e/config/cauhinh/aliases.zsh"
alias suaapt="nano /etc/apt/sources.list"
alias suafzf_h="nano ~/fzf_history_search.zsh"
alias suaapa="nano /etc/apache2/apache2.conf"
alias suawsl="nano /etc/wsl.conf"
alias tatkali="sudo shutdown -r now"
alias rs="reboot"
alias caidat="sudo apt-get install -y"
alias taothumuc="sudo mkdir -p"
alias setroot="sudo chown -R root:root"
alias chmod755="sudo chmod -R 755"
alias a2ens="sudo a2ensite"
alias runapa="sudo service apache2 reload"
alias a2enm="sudo a2enmod rewrite"
alias uprs="chmod +x /mnt/e/config/kali/rsync-update.sh && /mnt/e/config/kali/rsync-update.sh"
alias remove="sudo apt-get purge -y"

#Apache2
alias runapa="sudo service apache2 start"
# Linh Tinh #
alias boybh="cd $boybh"
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
alias gr="git remote -v"
alias ga="cd ~/.config && git add ."
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
alias h="history|grep"
alias :q="exit"
alias h="history 0"
alias backup="cp /root/.zshrc /mnt/e/config/kali-backup/.zshrc"
alias ipt="sudo /sbin/iptables"
alias iptlist="sudo /sbin/iptables -L -n -v --line-numbers"
alias iptlistin="sudo /sbin/iptables -L INPUT -n -v --line-numbers"
alias iptlistout="sudo /sbin/iptables -L OUTPUT -n -v --line-numbers"
alias iptlistfw="sudo /sbin/iptables -L FORWARD -n -v --line-numbers"
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"
alias ping="ping -c 5"
alias fastping="ping -c 100 -s.2"
alias ports="netstat -tulanp"
alias rm="rm -I --preserve-root"
alias apt-get="sudo apt-get"
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
#alias wget="wget -c"
alias ff4="/opt/firefox4/firefox"
alias ff13="/opt/firefox13/firefox"
alias chrome="/opt/google/chrome/chrome"
alias cdd="/home/kali"
# display all rules #
alias firewall=iptlist
alias header="curl -I"
alias apps="$apps"
alias oc="$oc"
alias od="$od"
alias oe="/mnt/e"
alias editport="nano /etc/apache2/ports.conf"
alias stopng="sudo service nginx stop"
alias xoa="rm -rf"
alias web="cd /var/www/html/"
#Tuy Chinh
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias la="ls -A"
alias ls="ls --color=auto"
#alias Tienich
alias bat-plugins="activate_plugin"
alias tat-plugins="deactivate_plugin"
alias list-plugins="list_plugins"
alias bat-all="activate_all_plugins"
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
alias leza="eza --icons --group-directories-first --color=auto -aiF"
alias l='leza -a'

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
alias 9='cd $USER'

# ~/.zsh_aliases
alias addals='add_alias'
alias sshboybh="ssh -p 22 -i ~/.ssh/id_rsa boybh@20.255.187.102"
alias root@="root@220.255.187.102"
alias ompl='omz plugin'
alias omcs='~/.oh-my-zsh/custom'
alias file='/mnt/file'
alias cs=$cs
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
alias file='/mnt/file'
alias them='$addon/them.zsh'
alias them='/mnt/e/config/zsh/addon/them.zsh'
alias ll="eza --icons --group-directories-first --color=auto -axliF -a"
alias ext=extract
alias xemtime=timedatectl
alias capnhattime='sudo timedatectl set-timezone Asia/Ho_Chi_Minh'
alias ls="sudo ls --all --color --group-directories-first"
alias li='ls'
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
alias chx="sudo chmod +x"
alias chuyenali="$boybh/addon/convert_alias.sh"
alias copy="sudo cp -r"
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
alias cp="sudo cp -rf"
alias cdc="cd ~/.config"
alias vicus='sudo vi ~/.config/custom/custom.zsh'
alias up="~/.config/addon/update_plugins.zsh"
alias gmm='git commit -m "Update All"'
alias jav="/mnt/d/Newfolder"
alias pywed="python3 -m http.server 8000"
alias cai="apt-get install -y"
alias dd="/mnt/c/Users/boybh/Desktop"
alias capnhat_zshrc="sudo cp -rf /root/.zshrc /root/.config/.zshrc"
alias curlw="/mnt/c/WINDOWS/system32/curl.exe"
alias gpc="git push origin config"
alias zsh_custom="$ZSH_CUSTOM"
alias vi~="svi $HOME/.zshrc"
alias .c="/root/.config"
alias lld="eza --icons --group-directories-first --color=auto -axliF -a --sort=modified"
alias ali="/mnt/e/config/cauhinh/aliases.zsh"
alias upali="cp /mnt/e/config/cauhinh/aliases.zsh ~/.config/aliases.zsh"
alias gc.='gc "Cập nhật"'
alias gc-a="git commit -a"
