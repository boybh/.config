# Kích hoạt module ZLE
autoload -Uz zle
zmodload zsh/terminfo

# Kích hoạt chế độ chuột (Mouse mode)
function zle-line-init {
  echoti smkx
  printf '%b' '\e[?1000h'   # Bật chế độ chuột
}

function zle-line-finish {
  echoti rmkx
  printf '%b' '\e[?1000l'   # Tắt chế độ chuột
}

zle -N zle-line-init
zle -N zle-line-finish

# Chế độ vi và bindkey cho chuột
bindkey -e
