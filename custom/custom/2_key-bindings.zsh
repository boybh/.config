#!/usr/bin/env zsh

export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
#key configure key keybindings
bindkey '^e' autosuggest-enable				# Bật tính năng gợi ý
bindkey	'^o' autosuggest-toggle				# Chuyển đổi giữa các gợi ý (Bật/tắt)
bindkey -e                                        	# emacs key bindings
bindkey '  ' magic-space                           	# do history expansion on space
bindkey '^x' backward-kill-line                   	# ctrl + x (xóa dòng lệnh hiện tại)
bindkey '^[[3;5~' kill-word                       	# ctrl + Supr
bindkey '^[[3~' delete-char                       	# delete
bindkey '^[[1;5C' forward-word                    	# ctrl + ->
bindkey '^[[1;5D' backward-word                   	# ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    	# page up
bindkey '^[[6~' end-of-buffer-or-history          	# page down
bindkey '^[[H' beginning-of-line                  	# home
bindkey '^[[F' end-of-line				# end
bindkey '^[[Z' undo					# shift + tab undo last action
#bindkey '^ ' autosuggest-accept			# '^ ' (Ctrl + space) được gán để chấp nhận gợi ý lệnh.
#bindkey '^v' autosuggest-revert
#bindkey '^ ' autosuggest-fetch				# Lấy gợi ý

#bindkey '^ ' autosuggest-accept
#bindkey '^[OC' zsh-autosuggestions-accept
#bindkey '^I' fzf-completion
#bindkey '^[C' autosuggest-select			# Ánh xạ Right Arrow để chọn gợi ý
#bindkey '^ ' 	fzf-completion-widget			# Ánh xạ Ctrl + Space để chấp nhận gợi ý
#bindkey '^[[27;5;9~' fzf-completion			#
#bindkey '→' forward-char
#bindkey '^[OC' forward-char
#bindkey '^[[C' zsh-autosuggestions-accept
#bindkey '^ ' fzf-completion-widget			# ctrl + space
#bindkey '^g' fzf-completion				# ctrl + g
#bindkey '^r' 	fzf-history-widget			# Ctrl + r
#bindkey '^I'	fzf_completion				# Tab
#bindkey '^'	fzf-history-widget			# ctrk + s
#bindkey '^ ' autosuggest-fetch
#autosuggest-accept: Chấp nhận đề xuất hiện tại.
#autosuggest-execute: Chấp nhận và thực hiện đề xuất hiện tại.
#autosuggest-clear: Xóa gợi ý hiện tại.
#autosuggest-fetch: Lấy gợi ý (hoạt động ngay cả khi tính năng gợi ý bị tắt).
#autosuggest-disable: Vô hiệu hóa gợi ý.
#autosuggest-enable: Bật lại tính năng gợi ý.
#autosuggest-toggle: Chuyển đổi giữa các gợi ý được bật/tắt.
