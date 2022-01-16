local g = vim.g -- global variables
local fn = vim.fn -- call Vim functions
local cmd = vim.cmd -- execute Vim commands
local opt = vim.opt -- global/buffer/windows-scoped options
local exec = vim.api.nvim_exec -- execute Vimscript

-- Auto install packer.nvim if it doesn't exist
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end
cmd([[packadd packer.nvim]])

cmd([[au FileType markdown,text,norg,org,vim,conf setlocal spell]])

-- Don't clear clipboard when exiting
cmd([[au VimLeave * call system("xsel -ib", getreg('+'))]])

-- Be in normal mode after a new line
cmd([[au FileType text,norg,markdown,conf,vim noremap <buffer> o o<Esc>]])
cmd([[au FileType text,norg,markdown,conf,vim noremap <buffer> O O<Esc>]])

-- If no filetype/filename then set filetype to text
cmd([[au BufEnter * if expand('%') ==# '' | setfiletype text | endif]])
cmd([[au BufEnter * if &filetype ==# '' | setlocal filetype=text | endif]])

-- Triger `autoread` when files changes on disk
cmd([[au FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif]])

-- Notification after file change
cmd([[au FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]])

-- don't auto comment new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- Formatting
cmd([[ autocmd BufWritePre *.rs RustFmt]])

-- add line length marker for selected filetypes
-- cmd([[au FileType text,markdown,org,neorg,html setlocal cc=80]])

-- 2 spaces for selected filetypes
cmd([[ au FileType markdown setlocal shiftwidth=3 tabstop=3 ]])
cmd([[ au FileType org,norg,xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2 ]])

-- highlight on yank
exec(
	[[
  augroup YankHighlight
  au!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=369}
  augroup end
  ]],
	false
)
