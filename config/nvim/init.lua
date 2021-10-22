local fn = vim.fn
local execute = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('settings')
require('autocmds')
require('plugins/packer')
require('plugins/hop-nvim')
require('plugins/nvim-tree')
require('plugins/telescope')
require('plugins/feline')
require('plugins/nvim-lspconfig')
require('plugins/vim-easymotion')
require('plugins/nvim-autopairs')
require('plugins/nvim-treesitter')
require('plugins/comfortable-motion')
require('compiler')
require('mappings')

-- require('plugins/tabout-nvim')
