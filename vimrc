set modeline
set modelines=1
set belloff=all
set pastetoggle=<F2>
set number relativenumber

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
set cursorline

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
Plug '907th/vim-auto-save'
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" looks
" give better look when both themes are applied
try
    colorscheme Monokai
    colorscheme molokai_dark
catch
endtry

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1 "0 would mean don't close
let g:NERDTreeIgnore = ['^node_modules$']
"autocmd VimEnter * NERDTree "autoopen on vim start
"autocmd BufWinEnter * NERDTreeMirror "auto mirror on any tab

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
augroup ft_markdown
    au!
    au FileType markdown let b:auto_save = 1
augroup END

" coc-extensions
let g:coc_global_extensions = ['coc-clangd', 'coc-cmake', 'coc-css', 'coc-emmet', 'coc-html', 'coc-json', 'coc-omnisharp', 'coc-python', 'coc-sql', 'coc-tsserver', 'coc-xml']


" vim-mucomplete
let g:mucomplete#enable_auto_at_startup = 1

