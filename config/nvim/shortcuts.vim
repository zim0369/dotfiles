
" Plugin Key-Bindings

map f <Plug>(easymotion-bd-w)

nnoremap <Leader>mc :PlugClean<CR>
nnoremap <Leader>mu :PlugUpdate<CR>
nnoremap <Leader>mi :PlugInstall<CR>

noremap <leader>ma  :'<,'>. !xargs $HOME/.vim/plugged/butcher/string<CR>
noremap <leader>mna :'<,'>. !xargs $HOME/.vim/plugged/butcher/nums<CR>

nnoremap <silent> <leader>j :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <leader>k :call comfortable_motion#flick(-100)<CR>

nnoremap <leader>f :Files<CR>

nnoremap <leader>e :BufExplorer<CR>
nnoremap <silent> <F11> :BufExplorer<CR>
nnoremap <silent> <s-F11> :ToggleBufExplorer<CR>
nnoremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>
nnoremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>

nnoremap <C-n> :NvimTreeToggle<CR>

" >> Telescope bindings
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.buffers{}<CR>
" find in current buffer
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
" pick color scheme
nnoremap <Leader>c <cmd>lua require'telescope.builtin'.colorscheme{}<CR>

" stay in normal mode after inserting a new line
noremap o o <Esc>
noremap O O <Esc>
 
" Do not lose selection after indentation.
vnoremap <silent> < <gv
vnoremap <silent> > >gv
 
" Easy redo 
" nnoremap U :redo<CR>

" viewports
nnoremap <silent> <Leader>mh <c-w>h
nnoremap <silent> <Leader>mj <c-w>j
nnoremap <silent> <Leader>mk <c-w>k
nnoremap <silent> <Leader>ml <c-w>l

tnoremap <silent> <Leader>mh <c-w>h
tnoremap <silent> <Leader>mj <c-w>j
tnoremap <silent> <Leader>mk <c-w>k
tnoremap <silent> <Leader>ml <c-w>l

" Move to next buffer
noremap <leader><leader> :bn<CR>
 
" buffer delete
nnoremap <leader>d :bd<CR>

"splits  
nnoremap <leader>n :new<CR>
nnoremap <leader>v :vnew<CR>

" copy the entire file to the clipboard
noremap Y :w <bar> :!xsel -b < %<CR><CR>

" Copy pasting (Using gvim to use inbuilt clipboards)
xnoremap <leader>y  "+y
nnoremap <leader>y  "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>P "+P
xnoremap <leader>P "+P
inoremap <expr> <c-p> pumvisible() ? '<c-p>' : '<c-r>+'

" To toggle numbering
nmap <leader>i :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" nohl
nnoremap <silent><expr> <leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" tabs
nnoremap <leader>tn :tabnew<Space>
nnoremap <leader>tk :tabnext<CR>
nnoremap <leader>tj :tabprev<CR>
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tl :tablast<CR>
 
"todo 
nnoremap td :e ~/.todo.txt<CR>
 
" Don't include leading whitespace
onoremap a' 2i'
onoremap a" 2i"
xnoremap a' 2i'
xnoremap a" 2i"
 
" save
nnoremap <leader>w :w <bar> :source ~/.config/nvim/init.vim<CR>

" escape
inoremap jk <Esc>
inoremap kj <Esc>

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
" inoremap <C-H> <CMD>normal <<<CR>
" inoremap <C-L> <CMD>normal >><CR>
" inoremap <C-K> <CMD>m .-2<CR>
" inoremap <C-J> <CMD>m .+1<CR>
