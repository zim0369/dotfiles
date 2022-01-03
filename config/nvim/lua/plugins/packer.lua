local cmd = vim.cmd
cmd([[packadd packer.nvim]])

local packer = require("packer")

-- Add packages
-- for packages info see: init.lua (Lua modules)
return packer.startup(function(use)
	use("sainnhe/everforest")
	use({ "ellisonleao/gruvbox.nvim", requires = "rktjmp/lush.nvim" })
	use("yuttie/hydrangea-vim")
	use("rhysd/vim-grammarous")

	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp

	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use("rust-lang/rust.vim")
	use("mattn/webapi-vim")
	use("jbyuki/venn.nvim")

	use("tpope/vim-repeat")
	use("simeji/winresizer")
	use("markonm/traces.vim")
	use("wellle/targets.vim")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("wbthomason/packer.nvim")
	use("AndrewRadev/sideways.vim")
	use("dhruvasagar/vim-table-mode")
	use("norcalli/nvim-colorizer.lua")
	use("lukas-reineke/headlines.nvim")
	use("yuttie/comfortable-motion.vim")
	use("nvim-treesitter/nvim-treesitter")

	use({ "phaazon/hop.nvim", as = "hop" })

	use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })

	use({ "filipdutescu/renamer.nvim", branch = "master", requires = "nvim-lua/plenary.nvim" })

	use({ "VonHeikemen/fine-cmdline.nvim", requires = "MunifTanjim/nui.nvim" })

	use({ "VonHeikemen/searchbox.nvim", requires = "MunifTanjim/nui.nvim" })

	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

	use({ "famiu/feline.nvim", requires = "kyazdani42/nvim-web-devicons" })

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"abecodes/tabout.nvim",
		requires = "nvim-treesitter",
		--after = {'completion-nvim'} -- if a completion plugin is using tabs load it before
	})
end)
