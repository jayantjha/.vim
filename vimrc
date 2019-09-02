set modeline
set modelines=1

" vundle {{{

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'itchyny/lightline.vim'
Plugin 'lifepillar/vim-mucomplete'
call vundle#end()

" }}} 

syntax enable
colorscheme molokai

" tabs
set tabstop=4
set softtabstop=4
set expandtab

set number
set cursorline

" enable filetype specific indent files
" ~/.vim/indent/*.vim
filetype indent on
set omnifunc=syntaxcomplete#Complete
set shortmess+=c
set belloff+=ctrlg
set completeopt+=menuone,noselect
let g:mucomplete#enable_auto_at_startup=1

" visual autocomplete
set path+=**
set wildmenu

" highlight matching [{()}]
set showmatch

" searching
set incsearch
set hlsearch

" code folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=0

" status bar related
set noshowmode
set laststatus=2

" vim: foldmethod=marker foldlevel=0
