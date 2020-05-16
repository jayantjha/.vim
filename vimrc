set modeline
set modelines=1
set belloff=all

" relative line nos.
" set number relativenumber

" Enable filetype plugins
filetype plugin on
filetype indent on

let mapleader = ";"
set timeoutlen=3000

" often used remappings


" Omnifunc
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menu,menuone,noinsert,noselect
set shortmess+=c
augroup OmniCompletionSetup
    autocmd!
    autocmd FileType c          set omnifunc=ccomplete#Complete
    autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
    autocmd FileType python     set omnifunc=jedi#completions
    autocmd FileType ruby       set omnifunc=rubycomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
augroup END

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
nnoremap <Leader>es :noh<CR>

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
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <Leader>b :b<Space>
nnoremap <Leader>vb :vertical<Space>sb<Space>
nnoremap <Leader>sb :sb<Space>

" resize windows

nnoremap <C-.> <C-W>+
nnoremap <C-,> <C-W>-
nnoremap <C->> <C-W>>
nnoremap <C-<> <C-W><

" move around tabs
nnoremap <C-Right> :tabprevious<CR>
nnoremap <C-Left> :tabnext<CR>

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
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'amiorin/vim-project'
Plug 'szw/vim-maximizer'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'lifepillar/vim-mucomplete'

call plug#end()

" looks
try
    colorscheme gruvbox
catch
endtry

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=0
let g:NERDTreeIgnore = ['^node_modules$']
autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror

" vim-mucomplete
let g:mucomplete#enable_auto_at_startup = 1
