# Boot-straped ZSH Config

# Where should we download your Zsh plugins?
ZPLUGINDIR=$ZSH_CUSTOM/plugins

# Boot Strap
if [ ! -d ${ZPLUGINDIR}/zsh-dot-plugin ]; then
	mkdir -p "${ZPLUGINDIR}" 2> /dev/null
	git clone --quiet "git@github.com:DuckzCantFly/zsh-dot-plugin" "${ZPLUGINDIR}/zsh-dot-plugin"
fi

source $ZPLUGINDIR/zsh-dot-plugin/plugin-loader/plugin-loader.plugin.zsh

# Autocompile Plugins
ZPLUGSPEED="true"



# Load Config
plugins=(
	zsh-dot-plugin/load-all
) ; plugin-source ${plugins}

# Plugin Load for Github.com
repos=(
	## Where should plugins be downloaded fron?
	https://github.com/
	## Plugins
	romkatv/zsh-defer
	zsh-users/zsh-history-substring-search
	hlissner/zsh-autopair
	kutsan/zsh-system-clipboard
) ; plugin-clone ${repos}

# Source Plugins
plugins=(
	## User Config
	zsh-dot-plugin/general
	zsh-dot-plugin/general/history
	zsh-dot-plugin/general/tab-complete
	zsh-dot-plugin/fch
	## Plugin Config
	zsh-dot-plugin/plugins/plugin-config
	## Plugins
	zsh-defer # Only put plugins after this one if not needed imedatly at start.
) ; plugin-source ${plugins}

