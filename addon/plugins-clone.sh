#!/bin/zsh
source $HOME/.config/addon/plugin-all.zsh
plugin-clone hlissner/zsh-autopair
#plc ohmyzsh/ohmyzsh
#plc wfxr/forgit
#plc zdharma-continuum/zinit-annex-rust
#plc zdharma-continuum/zinit-annex-patch-dl
plugin-clone djui/alias-tips && plugin-source alias-tips && plugin-load alias-tips
plugin-clone Aloxaf/fzf-tab && plugin-source fzf-tab && plugin-load fzf-tab
plugin-clone zsh-users/zsh-autosuggestions && plugin-source zsh-autosuggestions && plugin-load zsh-autosuggestions
plugin-clone kutsan/zsh-system-clipboard
#git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
plugin-clone Freed-Wu/fzf-tab-source
#plc fdellwing/zsh-bat
#plugin-clone zimfw/zimfw
plugin-clone MenkeTechnologies/zsh-expand
plugin-clone zsh-users/zsh-history-substring-search
plugin-clone kutsan/zsh-system-clipboard
plugin-clone zdharma-continuum/fast-syntax-highlighting
plugin-clone Tarrasch/zsh-autoenv
plugin-clone zdharma-continuum/zinit
plugin-clone zshzoo/cd-ls

git clone https://github.com/pygments/pygments.git ~/.config/pygments

# Install On-My-Zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
    sh -c "$(curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" --unattended
else
    echo "Oh-My-Zsh already installed."
fi

# Set ZSH_CUSTOM if it's not already (used by our PLUGINS_PATH below)
if [ -z $ZSH_CUSTOM ]; then
    export ZSH_CUSTOM="$HOME/.config/custom"
fi

# Install additional plugins to this path
PLUGINS_PATH="${ZSH_CUSTOM}/plugins"

# Define function for installing plugins for use below
function install-plugin() {
    plugin_repo=$1
    plugin_name=$2

    echo "Downloading Plugin: $plugin_name"
    echo "Using: $plugin_repo"
    echo "To: $PLUGINS_PATH/$plugin_name"
    echo "git clone $plugin_repo $PLUGINS_PATH/$plugin_name"
    git clone $plugin_repo $PLUGINS_PATH/$plugin_name
    plugin_list="${plugin_list}$plugin_name "
}

#echo "Installing Plugins..."
#install-plugin https://github.com/djui/alias-tips alias-tips
#install-plugin https://github.com/wting/autojump autojump
#install-plugin https://github.com/TamCore/autoupdate-oh-my-zsh-plugins autoupdate
#install-plugin https://github.com/zsh-users/zsh-autosuggestions autosuggestions
#install-plugin https://github.com/Aloxaf/fzf-tab fzf-tab
#echo "Plugins Installed. Add them by copying th following into your ~/.config/.zshrc
#    plugins=( $plugin_list )
#"
