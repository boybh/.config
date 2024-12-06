# clean_empty_dirs.zsh
# Plugin to delete empty directories

clean_empty_dirs() {
  # Check if a directory path is provided, otherwise use the current directory
  local dir="${1:-.}"

  # Check if the provided directory exists
  if [[ ! -d "$dir" ]]; then
    echo "Directory '$dir' does not exist!"
    return 1
  fi

  # Find and delete empty directories
  echo "Searching and deleting empty directories in '$dir'..."
  find "$dir" -type d -empty -delete

  # Provide feedback
  echo "Empty directories deleted."
}

# You can now use the function clean_empty_dirs in your shell
alias d_thumuc="clean_empty_dirs"
