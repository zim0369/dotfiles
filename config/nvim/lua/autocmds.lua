local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options
cmd [[autocmd VimLeave * call system("xsel -ib", getreg('+'))]]

cmd [[autocmd FileType text,markdown,conf,vim noremap <buffer> o o<Esc>]]
cmd [[autocmd FileType text,markdown,conf,vim noremap <buffer> O O<Esc>]]

cmd [[autocmd BufEnter * if expand('%') ==# '' | setfiletype text | endif]]
cmd [[autocmd BufEnter * if &filetype ==# '' | setlocal filetype=text | endif]]

-- Triger `autoread` when files changes on disk
cmd [[autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif]]
-- Notification after file change
cmd [[autocmd FileChangedShellPost *
           \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]]

cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]

cmd [[autocmd FileType markdown let g:indentLine_enabled=0]]

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)
