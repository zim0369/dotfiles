" Don't clear the clipboard on exiting vim 
autocmd VimLeave * call system("xsel -ib", getreg('+'))

autocmd FileType text,markdown,conf,vim noremap <buffer> o o<Esc>
autocmd FileType text,markdown,conf,vim noremap <buffer> O O<Esc>

" if nofiletype then set it to text
autocmd BufEnter * if expand('%') ==# '' | setfiletype text | endif
autocmd BufEnter * if &filetype ==# '' | setlocal filetype=text | endif

" reload files changed outside vim
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
           \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

