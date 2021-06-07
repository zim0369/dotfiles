


call plug#begin('~/.vim/plugged')
 
" nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
 
" vim find/replace highlight
 Plug 'osyo-manga/vim-over'
 Plug 'markonm/traces.vim'

" easy motion
Plug 'easymotion/vim-easymotion'

call plug#end()			
  


" ================ File management ==================
let mapleader="," 

set clipboard=unnamedplus
 
" Turn off swap files
set noswapfile
set nobackup
set nowb
 
" set timeoutlen=0
set notimeout ttimeout ttimeoutlen=40 
set mouse=a
set scrolloff=9 
set cursorline
" The alacritty/tmux cursor style overrides the below property 
" hi Cursor ctermbg=43 ctermfg=16 
hi CursorLine ctermbg=17 gui=NONE term=NONE cterm=NONE
autocmd InsertEnter * highlight CursorLine ctermfg=None ctermbg=None
autocmd InsertLeave * highlight CursorLine ctermfg=None ctermbg=17
"use guifg and guibg instead of ctermfg and ctermbg in gvim 
hi SpellBad ctermfg='white' ctermbg=22 
hi SpellCap ctermfg='white' ctermbg=22
hi SignColumn ctermfg='white' ctermbg=16
hi Visual  ctermfg=16 ctermbg=14 
hi Search ctermfg=16 ctermbg=3 
 
" Don't know which color this handles
" hi IncSearch ctermfg=16 ctermbg=4 
" Visit the link below for more ctermbg colors
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
 
" reload files changed outside vim
set autoread
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" ================ Folds ============================

" ================ Encoding =========================

"set encoding to utf8
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif


" ================ Key-bindings ================
  
" clipboard 

" fast scrolling
nnoremap J 6j
nnoremap K 6k
vnoremap J 6j
vnoremap K 6k

" stay in normal mode after inserting a new line
noremap o o <Esc>
noremap O O <Esc>

" ================ Indentation ======================

set autoindent
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode 
set smartindent
filetype indent on 
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" ================ Number column ====================

" To toggle numbering
 nmap <silent> <F10> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" ================ Searching ========================

" Ignorecase when searching
set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" toggle search highlighting
" nnoremap <F3> :set hlsearch!<CR>

" get rid of stuff highlighted before
" map <esc> :noh<cr>

" ================ Performance ======================

" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw
" vim timeout (forgot why I need this or if I do at all)
" set ttyfast
" set ttimeoutlen=10

" ================ Misc =============================

filetype plugin on
syntax on 

" highlight matching braces
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=0

" disable wrapping of long lines into multiple lines
" set nowrap

" history
set history=1000

" on some systems the backspace does not work as expected.
" this fixes the problem
set backspace=indent,eol,start

" ================ Plugins ==========================

" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 1

" show nerd tree always on the right instead on the left
let g:NERDTreeWinPos = "right"

" ========= template / compile / run ===============

nnoremap <F8> :!cp ~/Work/templates/template.%:e %<Enter> 
 
"f9 to run current filetype
map <F9> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!clear && time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!clear && time ./%<"
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
exec "!brave-nightly % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!clear && time go run %"
endif
endfunc

" Nerdtree stuff 
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-y> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
