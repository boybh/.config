zstyle '*:compinit' arguments -D -i -u -C -w

# all Tab widgets
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes

# all history widgets
zstyle ':autocomplete:*history*:*' insert-unambiguous yes

# ^S
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
zstyle ':completion:*:*' matcher-list 'm:{[:lower:]-}={[:upper:]_}' '+r:|[.]=**'

#Việc sửa đổi danh sách này sẽ thay đổi khi một khoảng trắng được chèn vào. Nếu bạn thay đổi danh sách thành '*', một khoảng trắng luôn được chèn vào. Nếu bạn không đặt bất kỳ phần tử nào vào danh sách, thì một khoảng trắng sẽ không bao giờ được chèn vào.
zstyle ':autocomplete:*' add-space \
    executables aliases functions builtins reserved-words commands
# Thông thường, Tự động hoàn thành sẽ lấy các mục hoàn thành sau khi bạn ngừng nhập trong khoảng 0,05 giây.
zstyle ':autocomplete:*' delay 0.1  # seconds (float)

# Không hiển thị phần hoàn thành nếu từ hiện tại khớp với một mẫu
zstyle ':autocomplete:*' ignored-input '..##'

# Lưu ý: -e cho phép bạn chỉ định giá trị được tạo động.

# Ghi đè giá trị mặc định cho tất cả các danh sách
# $LINES là số dòng vừa với màn hình.
zstyle -e ':autocomplete:*:*' list-lines 'reply=( $(( LINES / 3 )) )'

# Ghi đè chỉ cho tìm kiếm đường dẫn gần đây
zstyle ':autocomplete:recent-paths:*' list-lines 10

# Ghi đè chỉ để tìm kiếm lịch sử
zstyle ':autocomplete:history-incremental-search-backward:*' list-lines 8

# Ghi đè chỉ dành cho menu lịch sử
zstyle ':autocomplete:history-search-backward:*' list-lines 2000
