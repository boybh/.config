" Kích hoạt số dòng
set number

" Sử dụng 4 khoảng trắng khi nhấn phím Tab
"set tabstop=4
"set shiftwidth=4
set expandtab

" Hiển thị tô sáng cú pháp
syntax on

" Tự động căn chỉnh dấu
set autoindent
set smartindent

" Kích hoạt tô sáng tìm kiếm
set hlsearch
set incsearch
        
" Kích hoạt chế độ hiển thị dòng dài xuống dòng
set wrap

" Lưu lịch sử tìm kiếm và thay thế
set history=1000

" Kích hoạt cài đặt tạm thời
set undofile
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp//
" Kích hoạt chuột
set mouse=a

" Khởi tạo Vundle
set nocompatible
filetype on

" Thiết lập đường dẫn cho Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Lưu file với Ctrl + S
nnoremap <C-s> :w!<CR>
inoremap <C-s> <C-o>:w!<CR>

" Thoát Vim với phím Q hoặc Ctrl + C
nnoremap q :q<CR>
inoremap q <Esc>:q<CR>
nnoremap <C-c> <C-o>:qa!<CR>

" Lưu file và thoát với Ctrl + Q
nnoremap <C-q> :wq!<CR>
inoremap <C-q> <C-o>:wq!<CR>

" Delete a single line with Ctrl + D
nnoremap <C-d> dd
inoremap <C-d> <C-o>dd<CR>

" Khởi tạo vim-plug
call plug#begin('~/.vim/plugged')

" Danh sách các plugin
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'hrsh7th/nvim-compe'      

" Kết thúc cấu hình vim-plug
call plug#end()

"Kích hoạt Plugins"
" Cấu hình nvim-compe
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.nvim_lsp = v:true




c    
