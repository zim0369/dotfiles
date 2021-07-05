


call plug#begin('~/.vim/plugged')
 
" vim colorschemes
Plug 'flazz/vim-colorschemes' 
 
" i3 config highlight 
Plug 'mboughaba/i3config.vim'
 
" vim-devicons 
Plug 'ryanoasis/vim-devicons'  

" vim find/replace highlight
Plug 'osyo-manga/vim-over'
Plug 'markonm/traces.vim'
  
" nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" easy motion
Plug 'easymotion/vim-easymotion'

"Autopairs
Plug 'alvan/vim-closetag' 
Plug 'tpope/vim-surround' 
 
" ReactSnippets 
Plug 'epilande/vim-react-snippets' 
Plug 'epilande/vim-es2015-snippets' 

" coc nvim 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
 
call plug#end()			
  


" ================ File management ==================
let mapleader="," 

set rnu 
 
colorscheme monokai-phoenix
 
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
hi CursorLine ctermbg=235 gui=NONE term=NONE cterm=NONE
hi CursorColumn ctermbg=17 gui=NONE term=NONE cterm=NONE
autocmd InsertEnter * highlight CursorLine ctermfg=None ctermbg=None
autocmd InsertLeave * highlight CursorLine ctermfg=None ctermbg=235
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
" if &encoding != 'utf-8'
"     set encoding=utf-8              "Necessary to show Unicode glyphs
" endif
set encoding=UTF-8


" ================ Key-bindings ================
  
" clipboard 
"  
imap ;; <Esc>

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
 

" =======================Autocomplete popup =========================
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
nnoremap <silent> <C-p> :FZF -m<CR> 

" ==================== vim closetags ===============================
  
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
 
" ======================= i3config =============================== 
 
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end
 
" ======================= Coc nvim ================================ 
 
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
 
 
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
exec "!google-chrome-stable % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!clear && time go run %"
endif
endfunc

