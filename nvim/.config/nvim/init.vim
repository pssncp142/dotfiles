
" source ~/.vimrc

let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'vim-latex/vim-latex'
	Plug 'neovim/python-client'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'mhartington/oceanic-next'
	Plug 'altercation/vim-colors-solarized'
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	Plug 'zchee/deoplete-jedi'
	Plug 'donRaphaco/neotex', { 'for': 'tex' }
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'vim-pandoc/vim-pandoc'
	Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

let g:deoplete#enable_at_startup = 1

let mapleader = "\\"
nmap <leader><F5> :NERDTreeToggle<CR>
nmap <leader>]    :bnext<CR>
nmap <leader>[    :bprevious<CR>

set nocp

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_DefaultTargetFormat = "pdf"

" For Neovim 0.1.3 and 0.1.4
" let $NVIM_TUI_ENABLE_TRUE_COLOR=0

" Or if you have Neovim >= 0.1.5
set termguicolors
" if (has("termguicolors"))
"  set notermguicolors
" endif

" Theme
syntax enable
set background=light
colorscheme solarized

let g:airline_theme='solarized'

let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

let g:airline_section_x = '%F'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

au TermOpen * setlocal nonumber norelativenumber

let g:terminal_color_0 = "1B2B34"
let g:terminal_color_1 = "ec5f67"
let g:terminal_color_2 = "99c794"
let g:terminal_color_3 = "fac864"
let g:terminal_color_4 = "6699cc"
let g:terminal_color_5 = "c594c5"
let g:terminal_color_6 = "5fb3b3"
let g:terminal_color_7 = "coc5ce"
let g:terminal_color_8 = "65737e"
let g:terminal_color_9 = "ec5f67"
let g:terminal_color_10 = "99c794"
let g:terminal_color_11 = "fac864"
let g:terminal_color_12 = "6699cc"
let g:terminal_color_13 = "c594c5"
let g:terminal_color_14 = "5fb3b3"
let g:terminal_color_15 = "d8dee9"

set number relativenumber

hi Normal guibg=none
hi NonText guibg=none guifg=none cterm=none
hi LineNr guifg=none guibg=none
hi CursorLineNr guifg=yellow guibg=none
hi EndOfBuffer guifg=none guibg=none

" remap split navigation
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

iabbrev defp def (<++>):<++><esc>11hi

tnoremap <Esc> <C-\><C-n>

tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

au BufRead,BufNewFile *.py
    \ set tabstop=4 softtabstop=4 shiftwidth=4 autoindent fileformat=unix

au BufRead,BufNewFile *.tex
    \ set tabstop=4 softtabstop=4 shiftwidth=4 spell

au BufRead,BufNewFile *
    \ set tabstop=4 softtabstop=4 shiftwidth=4




