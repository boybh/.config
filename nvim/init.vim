" Khởi tạo vim-plug
call plug#begin('~/.config/.vim/plugged')

" Danh sách các plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'hrsh7th/nvim-compe'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'folke/which-key.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'
Plug 'hrsh7th/nvim-cmp' " Plugin chính
Plug 'hrsh7th/cmp-nvim-lsp' " Nguồn cho LSP
Plug 'hrsh7th/cmp-buffer' " Nguồn cho buffer
Plug 'hrsh7th/cmp-path' " Nguồn cho đường dẫn
Plug 'saadparwaiz1/cmp_luasnip' " Nguồn cho LuaSnip (nếu bạn dùng)
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'onsails/lspkind.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'


" Cài đặt fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Kết thúc phần cài đặt plugin
call plug#end()

" Cấu hình fzf
let g:fzf_preview_window = ['up:30%']

" Cấu hình tabnine
lua <<EOF
require('tabnine').setup({
  disable_auto_comment = true,
  accept_keymap = "<Tab>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = { gui = "#808080", cterm = 244 },
  exclude_filetypes = { "TelescopePrompt", "NvimTree" },
  log_file_path = nil, -- đường dẫn tuyệt đối đến tệp nhật ký của Tabnine
  ignore_certificate_errors = false,
})
EOF

" Các thiết lập khác
set number
set background=dark
set showcmd
set showmatch
set ignorecase
set smartcase
set autowrite
set mouse=a
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set statusline=%F\ %y\ %m\ %r\ %h\ %w\ %p%%\ %l,%c\ %<%{&filetype}\ %M\ %P\
set laststatus=2
syntax on
set autoindent
set hlsearch
set incsearch
set wrap
set history=9999
set undofile
set backup
set backupdir=~/.config/.vim/backup//
set directory=~/.config/.vim/tmp//

" Khởi tạo Vundle
set nocompatible
filetype off

" Kích hoạt các plugin
filetype plugin indent on

" Thiết lập phím tắt
nnoremap <C-a> ggVG
inoremap <C-x> :x!<CR>
inoremap <C-r> <C-o>:undo<CR>
inoremap <A-r> <C-o>:redo<CR>
noremap <C-r> :undo<CR>
nnoremap <A-r> :redo<CR>
nnoremap q :q<CR>
inoremap q <Esc>:q!<CR>
nnoremap <C-c> :q!<CR>
nnoremap <Esc> :wq!<CR>
inoremap <C-q> <C-o>:wq!<CR>
inoremap <Esc> <C-o>:wq!<CR>
nnoremap d <C-o>dd<CR>
inoremap <C-d> <C-o>dd<CR>

