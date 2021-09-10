


call plug#begin('~/.vim/plugged')

" Traces(Real time replace)
Plug 'markonm/traces.vim'

" easy motion
Plug 'easymotion/vim-easymotion'

" syntax highlight
Plug 'sheerun/vim-polyglot'

" Rusted
Plug 'rust-lang/rust.vim'
Plug 'preservim/tagbar'
Plug 'vim-syntastic/syntastic'

" colorscheme
Plug 'morhetz/gruvbox' "light|dark
Plug 'ghifarit53/tokyonight-vim' "dark|dark
Plug 'rafalbromirski/vim-aurora' "dark

call plug#end()			


"                       LEADER KEY 
let mapleader="," 

" ====================== Plugin-settings ==========================

"                         vim-plug
nnoremap <Leader><Leader>p :PlugInstall<CR>
nnoremap <Leader><Leader>c :PlugClean<CR>
nnoremap <Leader><Leader>u :PlugUpdate<CR>
"
"                          Easymotion
map <Leader> <Plug>(easymotion-prefix)
"
"                             RUST
" auto format rust code 
let g:rustfmt_autosave = 1
nnoremap <C-f> :RustFmt<CR>
inoremap <C-f> <Esc>:RustFmt<CR>a

"                       Tagbar
nnoremap tt :TagbarToggle<CR>

"                       Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"                       Colorschemes    
let g:tokyonight_style = 'night' "night/storm
let g:tokyonight_enable_italic = 1

" ======================= Key-bindings ==========================

" Write changes
nnoremap ;; :w<CR>
inoremap ;; <Esc>:w<CR>a

" Follow
nnoremap f *

" Splits
nnoremap mi :vsplit ./ <CR> 
nnoremap mv :split ./ <CR> 

" viewports 
nnoremap m <C-w>
nnoremap me <C-w>=
nnoremap <C-j> <C-w>-
inoremap <C-j> <Esc><C-w>-a
nnoremap <C-k> <C-w>+
inoremap <C-k> <Esc><C-w>+a

" Copy pasting (Using gvim to use inbuilt clipboards)
noremap <leader>y "+y
noremap <leader>p "+p
autocmd VimLeave * call system("xsel -ib", getreg('+'))

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
nnoremap H 6h
nnoremap L 6l
vnoremap H 6h
vnoremap L 6l

" ============================ Switches/Misc =============================

" numbering
set rnu 

" background
set background=dark

" 256 colors
set termguicolors

" Cursors
set cursorline
set cursorcolumn

set notimeout ttimeout ttimeoutlen=40 
set mouse=a
set scrolloff=18 

set nocompatible
filetype plugin on
syntax enable

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
exec "!clear && gcc % -o %< && echo COMPILED"
exec "!clear && time ./%<"
elseif &filetype == 'cpp'
exec "!clear && g++ % -o %< && echo COMPILED"
exec "!clear && time ./%<"
elseif expand('%:t') == 'main.rs'
exec "!clear && cargo build --manifest-path=%:p:h:h/Cargo.toml && echo COMPILED"
exec "!time && cargo run --manifest-path=%:p:h:h/Cargo.toml"
elseif &filetype == 'rust'
exec "!clear && rustc %:p --out-dir=%:p:h && echo COMPILED"
exec "!time " .expand("%:p:r")
elseif &filetype == 'java'
exec "!clear && javac % && echo COMPILED"
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
exec "!go build %< && echo COMPILED"
exec "!clear && time go run %"
endif
endfunc

" ====================================================================

"                           COLORSCHEMES
colorscheme tokyonight
