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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'fatih/vim-go'
Plugin 'zchee/deoplete-go', { 'do': 'make'}
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'

call vundle#end()            " vundle requires
filetype plugin indent on    " vundle requires

set encoding=UTF-8

" setting colorscheme for background
syntax enable
silent! colorscheme gruvbox
set background=dark

" tabs of size 4 made of spaces
set tabstop=2
set shiftwidth=2

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Go search functions
au FileType go nmap <leader>gt :GoDeclsDir<cr>

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
	autocmd FileType text,txt,md,markdown       call WordProcessorMode()
augroup END

" Notes settings
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'

" paste info
set pastetoggle=<F2>

" Airline symbols
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" screen resize settings
nnoremap <C-Up> <ESC>:vert res +10<CR>
nnoremap <C-Down> <ESC>:vert res -10<CR>

" deoplete settings
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" vim-go ignore old neovim
let g:go_version_warning = 0
let g:go_auto_type_info = 1

" vim-go uses imports now
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_set_loclist = 0

" NERDTREES
function! IsNerdTreeEnabled()
  return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction
function! TreeTab()
	if IsNerdTreeEnabled()
		execute 'tabe'
		execute 'NERDTreeMirror'
	else
		execute 'tabe'
	endif
endfu
nnoremap <leader>t :call TreeTab()<CR>
" auto-open if no args are set
autocmd VimEnter * if !argc() | NERDTree | endif
" open on \v
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" close if only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
