local cmp = require("cmp")

require("fine-cmdline").setup({
	cmdline = {
		enable_keymaps = true,
	},
	hooks = {
		after_mount = function(input)
			cmp.setup.buffer({
				sources = {
					{ name = "new-imaginary-source" },
				},
			})
		end,
		set_keymaps = function(imap, feedkeys)
			local fn = require("fine-cmdline").fn

			-- Restore default keybindings...
			imap("<Esc>", fn.close)
			imap("<C-c>", fn.close)

			imap("<Up>", fn.up_search_history)
			imap("<Down>", fn.down_search_history)
		end,
	},
})
