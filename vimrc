call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
Plug 'dag/vim-fish'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

set encoding=UTF-8

" setting colorscheme for background
syntax enable
silent! colorscheme gruvbox
set background=dark

" tabs of size 4 made of spaces
set tabstop=2
set shiftwidth=2
set expandtab

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Go search functions
au FileType go nmap <leader>gt :GoDeclsDir<cr>
autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)

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
" auto-open if no args are set
autocmd VimEnter * if !argc() | NERDTree | endif
" open on \v
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" close if only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 2c99f97be61b3e8371162d85d28d592f ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/pwalters18/.opam/default/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line

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
nnoremap <Space>t :call TreeTab()<CR>

" navigation
nnoremap <Space>j <C-W><C-J>
nnoremap <Space>h <C-W><C-H>
nnoremap <Space>j <C-W><C-K>
nnoremap <Space>l <C-W><C-L>
