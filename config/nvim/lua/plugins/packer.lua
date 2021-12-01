local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
-- for packages info see: init.lua (Lua modules)
return packer.startup(function(use)

  -- TODO Install targets.vim
  use 'sainnhe/everforest'
  use 'yuttie/hydrangea-vim'
  use 'Th3Whit3Wolf/space-nvim'

  use 'tpope/vim-repeat'
  use 'simeji/winresizer'
  use 'markonm/traces.vim'
  use 'wellle/targets.vim'
  use 'tpope/vim-surround'
  use 'windwp/nvim-autopairs'
  use 'wbthomason/packer.nvim'
  use 'AndrewRadev/sideways.vim'
  use 'akinsho/org-bullets.nvim'
  use 'dhruvasagar/vim-table-mode'
  use 'norcalli/nvim-colorizer.lua'
  use 'kristijanhusak/orgmode.nvim'
  use 'lukas-reineke/headlines.nvim'
  use 'yuttie/comfortable-motion.vim'
  use 'nvim-treesitter/nvim-treesitter'

  use { 'phaazon/hop.nvim',
    as = 'hop', }

  use { 'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim' }

  use { 'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = 'nvim-lua/plenary.nvim'}

  use { 'VonHeikemen/fine-cmdline.nvim',
    requires = 'MunifTanjim/nui.nvim' }

  use { 'VonHeikemen/searchbox.nvim',
    requires = 'MunifTanjim/nui.nvim' }

  use { 'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons', }

  use { 'famiu/feline.nvim',
    requires =  'kyazdani42/nvim-web-devicons' }

  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make' }

  use { 'abecodes/tabout.nvim',
    requires = 'nvim-treesitter',
    --after = {'completion-nvim'} -- if a completion plugin is using tabs load it before
  }

end)
