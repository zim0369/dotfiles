local g = vim.g         				-- global variables
local fn = vim.fn       				-- call Vim functions
local cmd = vim.cmd     				-- execute Vim commands
local opt = vim.opt         		-- global/buffer/windows-scoped options
local exec = vim.api.nvim_exec 	-- execute Vimscript

-- Auto install packer.nvim if it doesn't exist
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
cmd [[packadd packer.nvim]]

-- Don't clear clipboard when exiting
cmd [[autocmd VimLeave * call system("xsel -ib", getreg('+'))]]

-- Be in normal mode after a new line
cmd [[autocmd FileType text,norg,markdown,conf,vim noremap <buffer> o o<Esc>]]
cmd [[autocmd FileType text,norg,markdown,conf,vim noremap <buffer> O O<Esc>]]

-- If no filetype/filename then set filetype to text
cmd [[autocmd BufEnter * if expand('%') ==# '' | setfiletype text | endif]]
cmd [[autocmd BufEnter * if &filetype ==# '' | setlocal filetype=text | endif]]

-- Triger `autoread` when files changes on disk
cmd [[autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif]]

-- Notification after file change
cmd [[autocmd FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]]

-- don't auto comment new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line length marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-- highlight on yank
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)
