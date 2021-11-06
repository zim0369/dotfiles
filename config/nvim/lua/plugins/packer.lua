local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
-- for packages info see: init.lua (Lua modules)
return packer.startup(function(use)

  -- TODO Install targets.vim
  use 'tpope/vim-repeat'
  use 'hrsh7th/nvim-cmp'
  use 'sunjon/shade.nvim'
  use 'simeji/winresizer'
  use 'markonm/traces.vim'
  use 'tpope/vim-surround'
  use 'hrsh7th/cmp-buffer'
  use 'sainnhe/everforest'
  use 'yuttie/hydrangea-vim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'neovim/nvim-lspconfig'
  use 'windwp/nvim-autopairs'
  use 'wbthomason/packer.nvim'
  use 'glepnir/dashboard-nvim'
  use 'Th3Whit3Wolf/space-nvim'
  use 'yuttie/comfortable-motion.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use {
    'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
  use {
    'phaazon/hop.nvim',
    as = 'hop',
  }
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  }
  use {
    'wellle/targets.vim'
  }
  use {
    'AndrewRadev/sideways.vim'
  }
end)
