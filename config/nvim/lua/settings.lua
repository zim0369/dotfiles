-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local opt = vim.opt         		-- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ' '             -- change leader to a comma
opt.mouse = 'a'               -- enable mouse support
opt.swapfile = false          -- don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.relativenumber = true             -- show line number
opt.showmatch = true          -- highlight matching parenthesis
opt.colorcolumn = '80'        -- line length marker at 80 columns
opt.signcolumn='number'
opt.scrolloff = 15
opt.cursorline = true
opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- orizontal split to the bottom
opt.ignorecase = true         -- ignore case letters when search
opt.smartcase = true          -- ignore lowercase for the whole pattern
opt.linebreak = true          -- wrap on word boundary
-- opt.foldmethod=expr
-- opt.foldexpr=nvim_treesitter#foldexpr()

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true      -- enable 24-bit RGB colors
cmd [[colorscheme neon]]

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

-- IndentLine
--g.indentLine_setColors = 0  -- set indentLine color
g.indentLine_char = '|'       -- set indentLine character

-- disable IndentLine for markdown files (avoid concealing)
-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
--opt.completeopt = 'menuone,noselect,noinsert'

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit


-- set hlsearch
-- set incsearch
-- set smartcase
-- set ignorecase

-- set showmode
-- set smarttab
-- set expandtab
-- set tabstop=4
-- set autoindent
-- set smartindent
-- set shiftwidth=4
--
-- set rnu
-- set nowb
-- set wrap
-- set mat=5
-- set mouse=a
-- set wildmenu
-- set autoread
-- set path+=**
-- set nobackup
-- set showmatch
-- set noswapfile
-- set cursorline
-- set lazyredraw
-- set scrolloff=15
-- set history=1000
-- set termguicolors
-- set encoding=UTF-8
-- set background=light
-- set signcolumn=number
-- set backspace=indent,eol,start
-- set guifont=FuraCode\ Nerd\ Font:h16
-- set notimeout ttimeout ttimeoutlen=40

-- set nocursorcolumn " https://github.com/vim/vim/issues/8908 closed
