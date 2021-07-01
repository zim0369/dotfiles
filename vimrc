


call plug#begin('~/.vim/plugged')
 
" nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" minimap
Plug 'wfxr/minimap.vim'
 
" vim find/replace highlight
Plug 'osyo-manga/vim-over'
Plug 'markonm/traces.vim'

" easy motion
Plug 'easymotion/vim-easymotion'

" Ultisnips 
Plug 'SirVer/ultisnips' 
 
" ReactSnippets 
Plug 'epilande/vim-react-snippets' 
Plug 'epilande/vim-es2015-snippets' 

"Autopairs
Plug 'alvan/vim-closetag' 
Plug 'tpope/vim-surround' 
Plug 'jiangmiao/auto-pairs' 
 
call plug#end()			
  


" ================ File management ==================
let mapleader="," 

set rnu 
 
" Turn off swap files
set noswapfile
set nobackup
set nowb
 
" set timeoutlen=0
set notimeout ttimeout ttimeoutlen=40 
set mouse=a
set scrolloff=18 
hi normal ctermbg=234
set cursorline
" You can turn on the cursorcolumn as well by uncommenting the line below 
" set cursorcolumn
" The alacritty/tmux cursor style overrides the below property 
" hi Cursor ctermbg=43 ctermfg=16 
hi CursorLine ctermbg=17 gui=NONE term=NONE cterm=NONE
hi CursorColumn ctermbg=17 gui=NONE term=NONE cterm=NONE
autocmd InsertEnter * highlight CursorLine ctermfg=None ctermbg=None
autocmd InsertLeave * highlight CursorLine ctermfg=None ctermbg=17
"use guifg and guibg instead of ctermfg and ctermbg in gvim 
hi SpellBad ctermfg='white' ctermbg=22 
hi SpellCap ctermfg='white' ctermbg=22
hi SignColumn ctermfg='white' ctermbg=16
hi Visual  ctermfg=16 ctermbg=14 
hi Search ctermfg=16 ctermbg=3 
hi MinimapCurrentLine ctermfg=Red
 
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

" nohl
nnoremap <leader>h :nohlsearch<CR>

" paste mode 
" nnoremap <leader>p :set invpaste paste? <bar> :set nohlsearch<CR>
nnoremap <leader>p "+P
 
" Copy from vim
vnoremap <leader>y "+y

" stay in normal mode after inserting a new line
noremap o o <Esc>
noremap O O <Esc>

" ================ Indentation ======================

set autoindent
set showmode 
set smartindent
filetype indent on 
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" ================ Number column ====================

" To toggle numbering
 nmap <leader>i :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
 nmap <leader>m :MinimapToggle <CR> 

" ================ Searching ========================

" Ignorecase when searching
set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" ================ Performance ======================

" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw

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

" Nerdtree stuff 
let g:NERDTreeQuitOnOpen = 1
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" show nerd tree always on the right instead on the left
let g:NERDTreeWinPos = "right"
 

" Autocomplete popup
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
nnoremap <silent> <C-p> :FZF -m<CR> 

" ultisnips 
set completeopt+=popup 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vim closetags
  
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
 
" Minimap 
let g:minimap_width = 4
let g:minimap_highlight = 'MinimapCurrentLine'
let g:minimap_left = 1


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
exec "!brave % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!clear && time go run %"
endif
endfunc

