set nocompatible
filetype plugin indent on
syntax on
set number
set cursorline
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10

let mapleader = " "
nnoremap <leader>e :Ex<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>

inoremap jk <Esc>

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" LSP stuff

let g:coc_global_extensions = ['coc-clangd']
let g:lsp_clangd_flags = ['--compile-commands-dir=.', '-I../include']
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_echo_cursor = 0

" UI stuff

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'

set background=dark
colorscheme gruvbox

set termguicolors

set updatetime=300
