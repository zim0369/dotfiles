require("mini.sessions").setup({ directory = "~/.config/nvim/misc/sessions" })
require("mini.starter").setup()
require("mini.fuzzy").setup()

require("mini.statusline").setup({
	content = {
		active = function()
      -- stylua: ignore start
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local spell         = vim.wo.spell and (MiniStatusline.is_truncated(120) and 'S' or 'SPELL') or ''
      local wrap          = vim.wo.wrap  and (MiniStatusline.is_truncated(120) and 'W' or 'WRAP')  or ''
      local git           = MiniStatusline.section_git({ trunc_width = 75 })
      -- Default diagnstics icon has some problems displaying in Kitty terminal
      local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75, icon = '' })
      local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      local searchcount   = MiniStatusline.section_searchcount({ trunc_width = 75})
      local location      = MiniStatusline.section_location({ trunc_width = 75 })

      -- Usage of `MiniStatusline.combine_groups()` ensures highlighting and
      -- correct padding with spaces between groups (accounts for 'missing'
      -- sections, etc.)
      return MiniStatusline.combine_groups({
        { hl = mode_hl,                  strings = { mode, spell, wrap } },
        { hl = 'MiniStatuslineDevinfo',  strings = { git, diagnostics } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=', -- End left alignment
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl,                  strings = { searchcount, location } },
      })
			-- stylua: ignore end
		end,
	},
})
require("mini.tabline").setup()

vim.defer_fn(function()
	require("mini.comment").setup()
	-- require("mini.cursorword").setup()
	require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = true } })
	require("mini.surround").setup({
		-- Number of lines within which surrounding is searched
		n_lines = 20,

		-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
		highlight_duration = 500,

		-- Pattern to match function name in 'function call' surrounding
		-- By default it is a string of letters, '_' or '.'
		funname_pattern = "[%w_%.]+",

		-- Mappings. Use `''` (empty string) to disable one.
		mappings = {
			add = "s", -- Add surrounding
			delete = "ds", -- Delete surrounding
			-- find = "sf", -- Find surrounding (to the right)
			-- find_left = "sF", -- Find surrounding (to the left)
			-- highlight = "sh", -- Highlight surrounding
			replace = "cs", -- Replace surrounding
			-- update_n_lines = "sn", -- Update `n_lines`
		},
	})
	require("mini.trailspace").setup()
end, 0)
