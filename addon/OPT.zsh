# OPTs to enable
setopt SHARE_HISTORY		# Tùy chọn để chia sẻ lịch sử lệnh giữa các phiên làm việc của Zsh.
setopt INC_APPEND_HISTORY
setopt HASH_LIST_ALL		# Tùy chọn để hiển thị tất cả các lệnh trong danh sách hash.
setopt autocd              	# Tùy chọn để tự động chuyển đổi thư mục chỉ bằng cách gõ tên thư mục.
setopt correct             	# Tùy chọn để tự động sửa lỗi chính tả trong lệnh.
setopt interactivecomments  	# Tùy chọn để cho phép chú thích trong các lệnh nhập trong chế độ tương tác.
setopt magicequalsubst     	# Tùy chọn để kích hoạt mở rộng tên tệp cho các đối số theo định dạng `anything=expression`.
setopt nonomatch           	# Tùy chọn để ẩn thông báo lỗi nếu không có kết quả khớp với mẫu khi sử dụng các ký tự đại diện.
setopt notify             	# Tùy chọn để báo cáo ngay lập tức trạng thái của các tác vụ chạy nền
setopt numericglobsort     	# Tùy chọn để sắp xếp tên tệp theo cách số học khi có ý nghĩa.
setopt promptsubst         	# Tùy chọn để kích hoạt thay thế lệnh trong prompt.
setopt AUTO_REMOVE_SLASH	# Tự động loại bỏ dấu gạch chéo cuối cùng của đường dẫn nếu không cần thiết.
#setopt CASE_SENSITIVE		# Bật phân biệt chữ hoa chữ thường trong hoàn thành lệnh.
setopt HIST_VERIFY		# Hiển thị các lệnh từ lịch sử lệnh để bạn có thể xác nhận trước khi thực thi.s
setopt HIST_IGNORE_SPACE	# Không lưu các lệnh bắt đầu bằng dấu cách vào lịch sử lệnh
setopt RCS			# Tự động lưu các thay đổi của tệp vào tệp kiểm soát phiên bản (RCS).
setopt PUSHD_SILENT		# Tắt thông báo khi sử dụng lệnh pushd và popd
setopt PUSHD_IGNORE_DUPS	# Loại bỏ thư mục trùng lặp khỏi danh sách lưu trữ thư mục (pushd).
setopt EXTENDED_GLOB 		# Cho phép sử dụng các mẫu mở rộng (extended globbing) trong các lệnh.
setopt HIST_IGNORE_DUPS		# Loại bỏ các lệnh trùng lặp trong lịch sử lệnh.
setopt HIST_IGNORE_ALL_DUPS   	# Loại bỏ tất cả lệnh trùng lặp
setopt HIST_FIND_NO_DUPS      	# Bỏ qua lệnh trùng lặp khi tìm kiếm
setopt HIST_SAVE_NO_DUPS      	# Không lưu lệnh trùng lặp vào file lịch sử
setopt NUMERIC_GLOB_SORT 	# Sắp xếp tên tệp theo cách số học khi có ý nghĩa.
setopt MAGIC_EQUAL_SUBST	# Kích hoạt mở rộng tên tệp cho các đối số theo định dạng variable=value.
setopt INTERACTIVE_COMMENTS 	# Cho phép sử dụng chú thích trong các lệnh nhập trực tiếp trong chế độ tương tác.
setopt BANG_HIST 		# Cho phép sử dụng ký tự ! (bang) trong lệnh lịch sử để thực thi lệnh từ lịch sử.
setopt hist_verify		# Zsh giúp bạn kiểm tra và xác nhận lệnh trước khi thực thi khi bạn sử dụng mở rộng lịch sử lệnh. 
#setopt multiline		# Giúp dòng lệnh hiển thị trên nhiều dòng nếu nó quá dài để fit vào một dòng.
setopt prompt_subst		# Cho phép biến trong prompt được xử lý khi nhiều dòng được nhập
