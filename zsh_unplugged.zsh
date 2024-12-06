#!/bin/zsh
ZPLUGINDIR=$ZSH_CUSTOM/plugins

if [[ ! -d $ZPLUGINDIR/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions \
            $ZPLUGINDIR/zsh-autosuggestions
fi
source $ZPLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

if [[ ! -d $ZPLUGINDIR/zsh-history-substring-search ]]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search \
            $ZPLUGINDIR/zsh-history-substring-search
fi
source $ZPLUGINDIR/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

if [[ ! -d $ZPLUGINDIR/z ]]; then
  git clone https://github.com/rupa/z \
            $ZPLUGINDIR/z
fi
source $ZPLUGINDIR/z/z.sh

if [[ ! -d $ZPLUGINDIR/fzf-tab ]]; then
  git clone https://github.com/Afzf-tab/fzf-tab \
            $ZPLUGINDIR/fzf-tab
fi
#source $ZPLUGINDIR/fzf-tab/fzf-tab.zsh

# Kiểm tra và tải znap
if [[ ! -d $ZPLUGINDIR/znap ]]; then
    git clone https://github.com/marlonrichert/zsh-snap \
	$ZPLUGINDIR/znap
fi

source $ZPLUGINDIR/znap/znap.zsh

# Cấu hình znap
zstyle ':znap:*' repos-dir $ZSH_CUSTOM/plugins
zstyle ':znap:*' auto-compile yes
zstyle '*:compinit' arguments -D -i -u -C -w

if [ ! -d ${ZPLUGINDIR}/zsh-dot-plugin ]; then
	mkdir -p "${ZPLUGINDIR}" 2> /dev/null
	git clone --quiet "git@github.com:DuckzCantFly/zsh-dot-plugin" "${ZPLUGINDIR}/zsh-dot-plugin"
fi
source $ZPLUGINDIR/zsh-dot-plugin/plugin-loader/plugin-loader.plugin.zsh

##? Clone a plugin, identify its init file, source it, and add it to your fpath.
function plugin-load {
  local repo plugdir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-$HOME/.config/custom}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

function plugin-update {
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/custom}/plugins}
  for d in $ZPLUGINDIR/*/.git(/); do
    echo "Updating ${d:h:t}..."
    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
  done
}

# declare a simple plugin-clone function, leaving the user to source plugins themselves
function plugin-clone {
  local repo plugdir initfile initfiles=()
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/custom}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) && ln -sf $initfiles[1] $initfile
    fi
  done
}

# now, plugin-source is a separate thing
function plugin-source {
  local plugdir
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/custom}/plugins}
  for plugdir in $@; do
    [[ $plugdir = /* ]] || plugdir=$ZPLUGINDIR/$plugdir
    fpath+=$plugdir
    local initfile=$plugdir/${plugdir:t}.plugin.zsh
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

function plugin-compile {
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/custom/plugins}
  autoload -U zrecompile
  local f
  for f in $ZPLUGINDIR/**/*.zsh{,-theme}(N); do
    zrecompile -pq "$f"
  done
}

# where do you want to store your plugins?
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/custom}/plugins}

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

# zsh-bench doesn't have a plugin file
# it just needs added to your $PATH
export PATH="$ZPLUGINDIR/zsh-bench:$PATH"

source $ZPLUGINDIR/zsh-defer/zsh-defer.plugin.zsh

PS1="%F{12}%~%f "
RPS1="%F{240}loading%f"

zsh-defer source $ZPLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source $ZPLUGINDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
zsh-defer source $ZPLUGINDIR/.nvm/nvm.sh
zsh-defer source $ZPLUGINDIR/fzf-tab/fzf-tab.zsh
zsh-defer -c 'RPS1="%F{2}\$(git rev-parse --abbrev-ref HEAD 2>/dev/null)%f"'
zsh-defer source $ZPLUGINDIR/zcolors/zcolors.zsh
