local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
-- for packages info see: init.lua (Lua modules)
return packer.startup(function(use)

  use {'wbthomason/packer.nvim', opt = true}
  use 'rafamadriz/neon'
  use 'simeji/winresizer'
  use 'markonm/traces.vim'
  use 'tpope/vim-surround'
  use 'neovim/nvim-lspconfig'
  use 'windwp/nvim-autopairs'
  use 'yuttie/comfortable-motion.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
  use {
    'phaazon/hop.nvim',
    as = 'hop',
  }
end)
