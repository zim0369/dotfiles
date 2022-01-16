local cmd = vim.cmd

require("paq")({

	-- colorschemes
	"rktjmp/lush.nvim",
	"sainnhe/everforest",
	"yuttie/hydrangea-vim",
	--requires = "rktjmp/lush.nvim"
	"ellisonleao/gruvbox.nvim",

	"savq/paq-nvim",
	"mattn/webapi-vim",
	"jbyuki/venn.nvim",
	"L3MON4D3/LuaSnip",
	"hrsh7th/nvim-cmp",
	"tpope/vim-repeat",
	"muellan/am-colors",
	"simeji/winresizer",
	"tpope/vim-surround",
	"rust-lang/rust.vim",
	"markonm/traces.vim",
	"wellle/targets.vim",
	"fedepujol/move.nvim",
	"rhysd/vim-grammarous",
	"hrsh7th/cmp-nvim-lsp",
	"karb94/neoscroll.nvim",
	"windwp/nvim-autopairs",
	"navarasu/onedark.nvim",
	"echasnovski/mini.nvim",
	"ellisonleao/glow.nvim",
	"neovim/nvim-lspconfig",
	"svban/YankAssassin.vim",
	"wbthomason/packer.nvim",
	"AndrewRadev/sideways.vim",
	"saadparwaiz1/cmp_luasnip",
	"mhartington/formatter.nvim",
	"dhruvasagar/vim-table-mode",
	"norcalli/nvim-colorizer.lua",
	"lukas-reineke/headlines.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	-- "antoinemadec/FixCursorHold.nvim",
	"lukas-reineke/indent-blankline.nvim",

	--require = "nvim-treesitter", after = "completion"
	"abecodes/tabout.nvim",
	"nvim-treesitter/nvim-treesitter",

	--require = "nvim-lua/plenary.nvim"
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"filipdutescu/renamer.nvim",

	--require = "MunifTanjim/nui.nvim"
	"MunifTanjim/nui.nvim",
	"VonHeikemen/searchbox.nvim",
	"VonHeikemen/fine-cmdline.nvim",

	--require = "kyazdani42/nvim-web-devicons"
	"kyazdani42/nvim-tree.lua",
	"kyazdani42/nvim-web-devicons",

	{ "phaazon/hop.nvim", as = "hop" },
	{
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
})
