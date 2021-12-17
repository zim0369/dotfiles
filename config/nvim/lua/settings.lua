-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd 			    = vim.cmd     				-- execute Vim commands
local exec 			    = vim.api.nvim_exec 	-- execute Vimscript
local fn 			      = vim.fn       				-- call Vim functions
local g 			      = vim.g         			-- global variables
local opt 			    = vim.opt         		-- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.api.nvim_command 'filetype plugin indent on'
g.mapleader         = ' '            -- change leader to a space
opt.mouse           = 'a'            -- enable mouse support
opt.swapfile        = false          -- don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.relativenumber 	= true          -- show line number
opt.showmatch 			= true          -- highlight matching parenthesis
opt.colorcolumn 		= '80'          -- line length marker at 80 columns
opt.signcolumn			='number'
opt.scrolloff 			= 15
opt.cursorline 			= true
opt.cursorcolumn 		= true
opt.textwidth 		  = 80
opt.list       		  = true
opt.splitright 			= true          -- vertical split to the right
opt.splitbelow 			= true          -- orizontal split to the bottom
opt.ignorecase 			= true          -- ignore case letters when search
opt.smartcase 			= true          -- ignore lowercase for the whole pattern
opt.linebreak 			= true          -- wrap on word boundary
opt.backspace 			= [[indent,eol,start]]
opt.completeopt     = [[menu,menuone,noselect]]

opt.listchars = { --•⇀ ×
	eol = '⤶',
	tab = ' ×',
	trail = '•',
	extends = '◀',
	precedes = '▶',
}

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden 			    = true          -- enable background buffers
opt.history 		    = 100           -- remember n lines in history
opt.lazyredraw 	    = true          -- faster scrolling
opt.synmaxcol 	    = 240           -- max column for syntax highlight

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab 			= true      -- use spaces instead of tabs
opt.shiftwidth 			= 4        -- shift 4 spaces when tab
opt.tabstop 			  = 4           -- 1 tab 			=			= 4 spaces
opt.smartindent 		= true    -- autoindent new lines    

-----------------------------------------------------------
-- Fancy
-----------------------------------------------------------
opt.termguicolors   = true
cmd [[colorscheme everforest]]
opt.guifont         = 'FuraCode Nerd Font:h17'
g.neovide_cursor_vfx_mode = "railgun"

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------

-- g.table_mode_corner = '|'            -- Markdown Compatible

g.table_mode_corner_corner = '+'      -- ReST-compatible tables
g.table_mode_header_fillchar = '='    -- ReST-compatible tables

g.rustfmt_autosave = 0                -- Rust AutoFormat on save
g.rust_clip_command = 'xclip -selection clipboard'
