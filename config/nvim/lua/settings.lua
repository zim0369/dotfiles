-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.api.nvim_command("filetype plugin indent on")
g.mapleader = " " -- change leader to a space
opt.mouse = "a" -- enable mouse support
opt.swapfile = false -- don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.scrolloff = 15
opt.textwidth = 80
opt.list = true
opt.showmatch = true
opt.smartcase = true
opt.linebreak = true
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.cursorline = true
opt.cursorcolumn = true
opt.relativenumber = true
opt.colorcolumn = "80"
opt.signcolumn = "number"
opt.backspace = [[indent,eol,start]]
opt.completeopt = [[menu,menuone,noselect]]
cmd([[set dict+=/usr/share/dict/american-english]])
cmd([[set thesaurus+=/home/zim/.config/nvim/spell/thesaurus.txt]])

opt.listchars = {
	eol = "↲",
	space = "⋅",
	tab = "  ",
	trail = " ",
	extends = "◀",
	precedes = "▶",
}

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.synmaxcol = 240 -- max column for syntax highlight
opt.lazyredraw = true -- faster scrolling

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.tabstop = 4 -- 1 tab 			=			= 4 spaces
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.expandtab = true -- use spaces instead of tabs
opt.smartindent = true -- autoindent new lines

-----------------------------------------------------------
-- Fancy
-----------------------------------------------------------
cmd([[autocmd ColorScheme * highlight link SearchBoxMatch Search]])
opt.termguicolors = true
cmd([[colorscheme gruvbox]])
opt.guifont = "FuraCode Nerd Font:h13"
g.neovide_cursor_vfx_mode = "railgun"

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------

g.table_mode_corner = "|" -- Markdown Compatible

-- g.table_mode_corner_corner = "+" -- ReST-compatible tables
-- g.table_mode_header_fillchar = "=" -- ReST-compatible tables

g.rustfmt_autosave = 0 -- Rust AutoFormat on save
g.rust_clip_command = "xclip -selection clipboard"

g.glow_border = "rounded"

-- g.cursorhold_updatetime = 100

g.yankassassin_use_mappings = 1

cmd([[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]])
cmd([[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]])
