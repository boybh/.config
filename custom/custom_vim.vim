" ================================
" Cấu hình phím tắt trong Vim
" ================================

" === Phím tắt cơ bản ===
" Lưu file
nmap <C-s> :w<CR>          " Ctrl + S: Lưu file
nmap <C-S-s> :w<CR>       " Ctrl + Shift + S: Lưu file

" Thoát Vim
nmap q :q<CR>             " q: Thoát Vim
nmap <C-q> :wq<CR>        " Ctrl + Q: Thoát và lưu file

" Thoát mà không lưu
nmap <C-x> :q!<CR>        " Ctrl + X: Thoát mà không lưu

" Lưu và thoát
nmap <C-w> :wq<CR>        " Ctrl + W: Lưu và thoát

" Cắt, sao chép và dán
nmap <C-x> :x<CR>         " Ctrl + X: Cắt (xóa dòng và lưu vào clipboard)
nmap <C-c> "+y            " Ctrl + C: Sao chép vào clipboard
nmap <C-v> "+p            " Ctrl + V: Dán từ clipboard

" Tìm kiếm
nmap <C-f> /              " Ctrl + F: Tìm kiếm
nmap <C-r> :%s///g<CR>   " Ctrl + R: Thay thế toàn bộ

" Di chuyển nhanh
nmap <C-j> j              " Ctrl + J: Di chuyển xuống một dòng
nmap <C-k> k              " Ctrl + K: Di chuyển lên một dòng
nmap <C-h> h              " Ctrl + H: Di chuyển trái một ký tự
nmap <C-l> l              " Ctrl + L: Di chuyển phải một ký tự

" Di chuyển giữa các tab
nmap <C-t> :tabnew<CR>    " Ctrl + T: Mở tab mới
nmap <C-p> :tabprevious<CR> " Ctrl + P: Di chuyển đến tab trước
nmap <C-n> :tabnext<CR>  " Ctrl + N: Di chuyển đến tab tiếp theo

" Chuyển đổi chế độ
nmap <C-i> :set invpaste<CR> " Ctrl + I: Chuyển đổi chế độ dán

" Ghi chú
" Thay thế các phím tắt mặc định hoặc thêm các phím tắt mới theo nhu cầu của bạn.
" Đảm bảo rằng không có xung đột với các phím tắt khác.

" Lưu và áp dụng cấu hình
