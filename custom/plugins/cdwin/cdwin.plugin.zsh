# ~/.oh-my-zsh/custom/plugins/cdwin/cdwin.plugin.zsh

cdwin() {
  local path="$1"
  path="${path//\\//}"
  path="${path:0:2}/mnt/${path:2}"
  echo "$path"
}
