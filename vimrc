set nocompatible              " vundle requires
filetype off                  " vundle requires

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-sensible'
Plugin 'dag/vim-fish'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Shougo/neocomplete.vim'

call vundle#end()            " vundle requires
filetype plugin indent on    " vundle requires

" setting colorscheme for background
syntax enable
silent! colorscheme gruvbox
set background=dark

" tabs of size 4 made of spaces
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set shell=/bin/bash

func! WordProcessorMode()
	setlocal formatoptions=1
	setlocal noexpandtab
	map j gj
	map k gk
	setlocal spell spelllang=en_us
	set complete+=s
	set formatprg=par
	setlocal wrap
	setlocal linebreak
endfu
com! WP call WordProcessorMode()
augroup wordprocessor
	autocmd!
	autocmd FileType text,txt       call WordProcessorMode()
augroup END

" Notes settings
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'

" paste info
set pastetoggle=<F2>

" Airline symbols
let g:airline_powerline_fonts = 1

" enable code folding
set foldmethod=indent
" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
	autocmd!
	autocmd BufRead * normal zR
augroup END

" completion settings
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><C-f>     neocomplete#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
