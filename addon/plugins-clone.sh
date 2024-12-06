#!/bin/zsh
#plc ohmyzsh/ohmyzsh
#plc wfxr/forgit
#plc zdharma-continuum/zinit-annex-rust
#plc zdharma-continuum/zinit-annex-patch-dl
#plc Aloxaf/fzf-tab
plc kutsan/zsh-system-clipboard
#git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
plc Freed-Wu/fzf-tab-source
#plc fdellwing/zsh-bat
plc zimfw/zimfw

# Install On-My-Zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
    sh -c "$(curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" --unattended
else
    echo "Oh-My-Zsh already installed."
fi

# Set ZSH_CUSTOM if it's not already (used by our PLUGINS_PATH below)
if [ -z $ZSH_CUSTOM ]; then
    ZSH_CUSTOM="$HOME/.config/custom"
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

echo "Installing Plugins..."
install-plugin https://github.com/djui/alias-tips alias-tips
#install-plugin https://github.com/wting/autojump autojump
install-plugin https://github.com/TamCore/autoupdate-oh-my-zsh-plugins autoupdate
install-plugin https://github.com/zsh-users/zsh-autosuggestions autosuggestions
install-plugin https://github.com/Aloxaf/fzf-tab fzf-tab
echo "Plugins Installed. Add them by copying th following into your ~/.config/.zshrc
    plugins=( $plugin_list )
"
