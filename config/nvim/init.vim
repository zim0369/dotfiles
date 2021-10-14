let $BASH_ENV = "~/.bash_aliases"
call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'junegunn/fzf.vim'
Plug 'simeji/winresizer'
Plug 'markonm/traces.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/LargeFile'
Plug 'jlanzarotta/bufexplorer'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'easymotion/vim-easymotion'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'yuttie/comfortable-motion.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Themes dark
Plug 'sjl/badwolf'
Plug 'tomasr/molokai' 
Plug 'w0ng/vim-hybrid' 
Plug 'yuttie/hydrangea-vim' 
Plug 'tomasiser/vim-code-dark' 
Plug 'AlessandroYorba/Despacio' 
Plug 'arcticicestudio/nord-vim' 
Plug 'rafalbromirski/vim-aurora' 
Plug 'ghifarit53/tokyonight-vim' 
Plug 'tyrannicaltoucan/vim-deep-space' 
" Themes light/dark
Plug 'morhetz/gruvbox'
Plug 'nightsense/snow' 
Plug 'cocopon/iceberg.vim' 
Plug 'junegunn/seoul256.vim'
Plug 'nightsense/stellarized' 
Plug 'nightsense/cosmic_latte' 
Plug 'NLKNguyen/papercolor-theme' 
Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()			

 
 



syntax on
set nocompatible
filetype plugin indent on
 
"neovide 
set guifont=FuraCode\ Nerd\ Font:h17
let g:neovide_cursor_vfx_mode = "railgun"

"                       LEADER KEY 
let mapleader="," 

" ====================== Plugin-settings ==========================

nnoremap <Leader><leader>p :PlugInstall<CR>
nnoremap <Leader><leader>c :PlugClean<CR>
nnoremap <Leader><leader>u :PlugUpdate<CR>

"                       nvimtree
lua require'nvim-web-devicons'.setup()
lua require 'nvim-tree'.setup()
nnoremap <C-n> :NvimTreeToggle<CR>

"Colorschemes    
let g:molokai_original = 1
let g:despacio_Pitch = 0
let g:despacio_Sunset = 1
let g:despacio_Twilight = 0
let g:despacio_Midnight = 0
let g:deepspace_italics = 1
let g:badwolf_tabline = 0
let g:badwolf_darkgutter = 1
let g:badwolf_css_props_highlight = 1
let g:seoul256_background = 233 
let g:tokyonight_style = 'storm'
let g:tokyonight_enable_italic = 1
let g:hybrid_reduced_contrast = 1
let g:hybrid_custom_term_colors = 1
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_contrast_light = 'medium'

"                          Easymotion
" Move to word
let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'
map f <Plug>(easymotion-bd-w)

" Explorers
nnoremap <leader>f :Files<CR>
let g:fzf_layout = {'down':'40%' }

nnoremap <leader>e :BufExplorer<CR>
nnoremap <silent> <F11> :BufExplorer<CR>
nnoremap <silent> <s-F11> :ToggleBufExplorer<CR>
nnoremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
nnoremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>

"                         winresizer
" If you want to start window resize mode by `Ctrl+E`
let g:winresizer_start_key = '<C-E>'
let g:winresizer_gui_start_key = '<C-E>'
" To expand your window size toward upper using upper arrow (instead of k)
let g:winresizer_keycode_up = "<k>"
" To expand your window size toward lower using down arrow (instead of j)
let g:winresizer_keycode_down = "<j>"

"                      Programming

"                       coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile "prettier

"                         VIM SURROUND
xmap s  <Plug>VSurround
xmap S  <Plug>VgSurround
nmap s  ys
nmap S  ys$
" ======================= Key-bindings ==========================
 
" Do not lose selection after indentation.
vnoremap <silent> < <gv
vnoremap <silent> > >gv
 
" Easy redo 
nnoremap U :redo<CR>

" move backwards to the end of the word 
nnoremap E ge
 
" history
inoremap <Space> <C-]><Space><c-g>u
inoremap <CR> <CR><c-g>u

" theme
inoremap <C-Space> :!source /home/zim/.github/dotfiles/scripts/theme.sh<CR>
nnoremap <C-Space> :!source /home/zim/.github/dotfiles/scripts/theme.sh<CR>

" ============== 'm'- manipulate, make, move, & more... =================

" viewports
nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-l> <c-w>l

tnoremap <silent> <c-h> <c-w>h
tnoremap <silent> <c-j> <c-w>j
tnoremap <silent> <c-k> <c-w>k
tnoremap <silent> <c-l> <c-w>l
 
"splits  
nnoremap <leader>n :new<CR>
nnoremap <leader>v :vnew<CR>

" Buffer next
nnoremap <Space> :bn<CR>
 
" FANCY LINE MOVING
" nnoremap <C-K> <CMD>m .-2<CR>
" nnoremap <C-J> <CMD>m .+1<CR>
" nnoremap <C-H> <<
" nnoremap <C-L> >>  
"  
" vnoremap <C-K> :m '<-2<CR>gv
" vnoremap <C-J> :m '>+1<CR>gv
" vnoremap <C-H> <gv
" vnoremap <C-L> >gv 
" 
" " These lines conflict with the default bindings 
" inoremap <C-H> <CMD>normal <<<CR>
" inoremap <C-L> <CMD>normal >><CR>
" inoremap <C-K> <CMD>m .-2<CR>
" inoremap <C-J> <CMD>m .+1<CR>

" copy the entire file to the clipboard
noremap Y :w <bar> :!xsel -b < %<CR><CR>

" Copy pasting (Using gvim to use inbuilt clipboards)
xnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>P "+P
xnoremap <leader>P "+P
inoremap <expr> <c-p> pumvisible() ? '<c-p>' : '<c-r>+'

" Don't clear the clipboard on exiting vim 
" autocmd VimLeave * call system("xsel -ib", getreg('+'))

" To toggle numbering
nmap <leader>i :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" nohl
nnoremap <silent><expr> H (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

"                            NAVIGATION KEYBINDINGS 

" tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
 
"todo 
nnoremap td :e ~/.todo.txt<CR>
 
" line in line scroll 
noremap <silent> j gj
noremap <silent> k gk
noremap <silent> dj dj
noremap <silent> dk dk
noremap <silent> 0 g0
noremap <silent> $ g$

" Don't include leading whitespace
onoremap a' 2i'
onoremap a" 2i"
xnoremap a' 2i'
xnoremap a" 2i"
 
" if nofiletype then set it to text
" autocmd BufNewFile,BufRead * if &filetype ==# '' | setlocal filetype=text | endif
" autocmd BufEnter * if expand('%') ==# '' | setfiletype text | endif
" " stay in normal mode after inserting a new line
" noremap o o <Esc>
" autocmd FileType text,markdown,conf,vim noremap <buffer> o o<Esc>
" noremap O O <Esc>
" autocmd FileType text,markdown,conf,vim noremap <buffer> O O<Esc>
 
" save
nnoremap <leader>w :w<CR>
" Source vimrc
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
" buffer delete
nnoremap <leader>d :bd<CR>
" Reload buffer
nnoremap <leader>l <Cmd>nohlsearch<Bar>diffupdate<CR><C-L>

" ============================ Switches/Misc =============================

" numbering
set nu 

" background
set background=light

" 256 colors
set termguicolors

" Cursors
set cursorline
set nocursorcolumn 
" https://github.com/vim/vim/issues/8908 closed

set notimeout ttimeout ttimeoutlen=40 
set mouse=a
set scrolloff=15

" highlight matching braces
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=5

" Set recursive search
set path+=**

" Use tab completion everywhere 
set wildmenu

" wrapping of long lines into multiple lines
set wrap

" history
set history=1000

" on some systems the backspace does not work as expected.
" this fixes the problem
set backspace=indent,eol,start

" encoding
set encoding=UTF-8

set signcolumn=number

"                       INDENTATION

set autoindent
set showmode 
set smartindent
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
" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" " Notification after file change
" autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" ============== template / compile / run ====================

nnoremap <leader>t :!cp ~/templates/template.%:e %<Enter> 

"shortcut to run current filetype
map <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'rust'
        exec "!cargo build --manifest-path=%:p:h:h/Cargo.toml"
        exec "!time cargo run --manifest-path=%:p:h:h/Cargo.toml"
         
    "elseif &filetype == 'rust'
    "    exec "!rustc %:p --out-dir=%:p:h"
    "    exec "!time " .expand("%:p:r")
    " elseif expand('%:t') == 'main.rs'
    "     exec "!cargo build --manifest-path=%:p:h:h/Cargo.toml"
    "     exec "!time cargo run --manifest-path=%:p:h:h/Cargo.toml"

    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java -cp %:p:h %:t:r"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'javascript'
        exec "!time node %"
    elseif &filetype == 'html'
        exec "!chromium % &"
    elseif &filetype == 'tex'
        exec "!pdflatex --output-directory=%:p:h %"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'text'
        exec "!echo 'words : ' && wc -w % && echo 'lines : ' && wc -l % && echo 'size : ' && du -h %"
    elseif &filetype == 'markdown'
        exec "!echo 'words : ' && wc -w % && echo 'lines : ' && wc -l % && echo 'size : ' && du -h %"
    endif
endfunc

" =================================================================

colorscheme gruvbox
syntax on
