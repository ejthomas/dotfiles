filetype plugin indent on

set number         " Show current line number
set relativenumber " Show relative line numbers

" Tab size is 4 characters
set tabstop=4

" Indent size is 4 characters
set shiftwidth=4

" Tab key inserts 4 spaces
set expandtab

" .js files have 2-char tab size
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType javascriptreact setlocal tabstop=2 shiftwidth=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2
autocmd FileType typescriptreact setlocal tabstop=2 shiftwidth=2

" Install vim-plug if not already available
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
     silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugins
call plug#begin()

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'

call plug#end()

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" Fix low-contrast colorscheme issue
autocmd VimEnter,ColorScheme * hi! link CocFloating CocHintFloat

" Cursor fix for Windows Terminal
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"

" Color fix for visual mode
hi Visual cterm=reverse ctermbg=none ctermfg=none

" Reduce lag on leaving insert mode
set ttimeoutlen=0

" Vim airline config
let g:airline#extensions#tabline#enabled = 1
