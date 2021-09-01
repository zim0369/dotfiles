


call plug#begin('~/.vim/plugged')

" nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" easy motion
Plug 'easymotion/vim-easymotion'

" rustfmt
Plug 'rust-lang/rust.vim'

" vim-devicons (Icons for my sweet nerdtree)
Plug 'ryanoasis/vim-devicons'

call plug#end()			



"                       LEADER KEY 
let mapleader="," 

" ====================== Plugin-settings ==========================
"
"                           COLORSCHEMES
colorscheme monokai-phoenix
"
"
"                           NERDTREE
let g:NERDTreeQuitOnOpen = 1
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" show nerd tree always on the right instead on the left
let g:NERDTreeWinPos = "right"

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"                             RUST
" auto format rust code 
let g:rustfmt_autosave = 1
 
" ======================= Key-bindings ==========================

" Copy pasting (Using gvim to use inbuilt clipboards)
nnoremap <leader>p "+p
vnoremap <leader>y "+y

" Source vimrc
map <leader>v :source ~/.vimrc<CR>

" To toggle numbering
 nmap <leader>i :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" nohl
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

"                            NAVIGATION KEYBINDINGS 

" tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" stay in normal mode after inserting a new line
noremap o o<Esc>
noremap O O<Esc>

" fast scrolling
nnoremap J 6j
nnoremap K 6k
vnoremap J 6j
vnoremap K 6k

" fast scrolling
nnoremap H 3h
nnoremap L 3l
vnoremap H 3h
vnoremap L 3l

" ============================ Switches/Misc =============================

" numbering
set rnu 

" background
set background=dark
 
" Cursors
set cursorline
set cursorcolumn

" set timeoutlen=0
set notimeout ttimeout ttimeoutlen=40 
set mouse=a
set scrolloff=18 

set nocompatible
filetype plugin on
syntax on 

" highlight matching braces
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=0

" Use tab completion everywhere 
set wildmenu

" disable wrapping of long lines into multiple lines
set wrap

" history
set history=1000

" on some systems the backspace does not work as expected.
" this fixes the problem
set backspace=indent,eol,start

" encoding
set encoding=UTF-8

set signcolumn=no

"                       INDENTATION

set autoindent
set showmode 
set smartindent
filetype indent on 
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

"                       SEARCHING

" Ignorecase when searching
set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

"                       PERFORMANCE

" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw

" ========================= Highlighting  ============================
 
" ================ Folds ============================

" ================ File management ==================
 
" Turn off swap files
set noswapfile
set nobackup
set nowb
 
" reload files changed outside vim
set autoread
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" ========= template / compile / run ===============

nnoremap <leader>t :!cp ~/templates/template.%:e %<Enter> 
 
"shortcut to run current filetype
map <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!clear && time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!clear && time ./%<"
elseif &filetype == 'rust'
exec "!rustc %"
exec "!time ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!clear && time java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
exec "!clear && time bash %"
elseif &filetype == 'text'
exec "!clear && echo 'words : ' && wc -w % && echo 'lines : ' && wc -l % && echo 'size : ' && du -h %"
elseif &filetype == 'python'
exec "!clear && time python3 %"
elseif &filetype == 'javascript'
exec "!clear && time node %"
elseif &filetype == 'html'
exec "!chromium % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!clear && time go run %"
endif
endfunc

" ====================================================================

