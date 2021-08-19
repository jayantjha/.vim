set modeline
set modelines=1
set belloff=all
set pastetoggle=<F2>
set number relativenumber
"sets number column as signcolumn
"set signcolumn=number
"set signcolumn=yes
autocmd FileType 
\javascript,jsx,vue,typescript,json,
\cs,java,python,sql,cpp,c,clojure setlocal signcolumn=yes


" Fix splits
set splitbelow
set splitright
au VimResized * :wincmd = "Resize splits equally on resize

let mapleader = ";"
" Set leader timout
set timeoutlen=2000

set clipboard=unnamedplus
" Map copy delete and paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Cycle buffers
nnoremap <Leader><Tab> :bn<CR>
nnoremap <Leader><S-Tab> :bp<CR>

" Select buffer
nnoremap <Leader>b :buffers<CR>:b<Space>
nnoremap <Leader>vb :buffers<CR>:vertical<Space>sb<Space>
nnoremap <Leader>sb :buffers<CR>:sb<Space>

" Delete current buffer
nnoremap <Leader>q :b#<bar>bd#<CR>

" Set up scrolling winding one line up and down  
" nnoremap <S-Up> <C-E>
" nnoremap <S-Down> <C-Y> 

" Automatically go to the end of pasted text 
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Code folding
set foldmethod=indent
set foldlevel=5

" Always use vertical diffs 
set diffopt+=vertical

" Enable filetype plugins
filetype plugin on
filetype indent on

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
nnoremap <Leader>/ :nohlsearch<CR>

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

" In insert or command mode, move normally by using Ctrl
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>
"cnoremap <C-h> <Left>
"cnoremap <C-j> <Down>
"cnoremap <C-k> <Up>
"cnoremap <C-l> <Right>

" resize windows
nnoremap <C-.> <C-W>+
nnoremap <C-,> <C-W>-
nnoremap <C->> <C-W>>
nnoremap <C-<> <C-W><

" move around tabs
nnoremap <A-h> :tabprevious<CR>
nnoremap <A-l> :tabnext<CR>

" highlight matching [{()}]
set showmatch
set mat=2

" tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

" indentation
set ai "Auto indent
set si "Smart indent
set nowrap "Don't wrap lines
"set wrap "Wrap lines

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32") || has("win64")
    set wildignore+=.git\*,.hg\*,.svn\*,**\node_modules\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,**/node_modules/*
endif

set number
set cursorline

set nocompatible
filetype off
syntax on

" better backspace
" set backspace=indent,eol,start

" Plugin global variables config before plugin loaded
let g:ale_disable_lsp = 1
let g:coc_config_home = '~\.vim'

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
Plug 'ctrlpvim/ctrlp.vim'
Plug '907th/vim-auto-save'
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'
"Plug 'will133/vim-dirdiff'

call plug#end()

if !empty($CONEMUBUILD)
    set term=pcansi
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    let &t_kb="\xcex" 
    let &t_ku="\xceH"
    let &t_kd="\xceP"
    let &t_kl="\xceK"
    let &t_kr="\xceM"
endif   

" looks
" give better look when both themes are applied
try
    colorscheme Monokai
    colorscheme molokai_dark
catch
endtry

" nerdtree
map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeFocus<CR>
let NERDTreeQuitOnOpen=0 "1 would mean close
let g:NERDTreeIgnore = ['^node_modules$']
" autocmd VimEnter * if !argc() | NERDTree | wincmd w | endif "autoopen on vim start
autocmd BufWinEnter * if !argc() | NERDTreeMirror | endif "auto mirror on any tab
" close nerdtree if it is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1

" vimwiki
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile,BufEnter diary.md VimwikiDiaryGenerateLinks
    autocmd BufNewFile */vimwiki/diary/*.md :r !echo \# %:t:r
    autocmd BufNewFile */vimwiki/diary/*.md :norm kddo
augroup end

" vim-auto-save
let g:auto_save = 0
"augroup ft_markdown
    "au!
    "au FileType markdown let b:auto_save = 1
"augroup END

" coc.nvim
" coc-extensions
"let g:coc_global_extensions = ['coc-clangd', 'coc-cmake', 'coc-css', 'coc-emmet', 'coc-html', 'coc-json', 'coc-omnisharp', 'coc-python', 'coc-sql', 'coc-tsserver', 'coc-xml']
source ~/.vim/cocrc.vim

" Formatting selected code.
nmap <leader>f  <Plug>(coc-format)

" vim-mucomplete
let g:mucomplete#enable_auto_at_startup = 1

" ctrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git'

" ale
let g:ale_set_highlights = 0
let g:ale_sign_error = '~'
let g:ale_sign_warning = '-'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_enabled = 1
"let g:ale_sign_column_always = 1
" Do not lint in the following cases
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\ '\.[jt]s': {'ale_linters': []}
\}

" Rust
let g:rustfmt_autosave = 1

