set modeline
set modelines=1
set belloff=all

" relative line nos.
" set number relativenumber

" Enable filetype plugins
filetype plugin on
filetype indent on

" visual autocomplete
set path+=**
set wildmenu

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set smartcase
set ignorecase
set incsearch
set hlsearch

set magic

" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
endif

set encoding=utf8

" Turn backup off
set nobackup
set nowb
set noswapfile

" status bar related
set noshowmode
set laststatus=2

" moving around windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" resize windows

nnoremap <S-J> <C-W>+
nnoremap <S-K> <C-W>-
nnoremap <S-L> <C-W>>
nnoremap <S-H> <C-W><

" move around tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" highlight matching [{()}]
set showmatch
set mat=2

" tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" indentation
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set number
" set cursorline

set nocompatible
filetype off
syntax on

source ~/.vim/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'amiorin/vim-project'
Plug 'szw/vim-maximizer'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'

call plug#end()

" looks
try
    colorscheme gruvbox
catch
endtry

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=0
autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror

