require('neorg').setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {
      config = {
        markup = {
          enabled = false,
        },
      },
    },
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
      config = {
        workspaces = {
          my_workspace = "~/neorg"
        }
      }
    }
  },
}
 
--require('neorg').setup {
--  -- Tell Neorg what modules to load
--  load = {
--    ["core.defaults"] = {}, -- Load all the default modules
--
--    ["core.norg.completion"] = {
--      config = {
--        engine = "nvim-cmp",
--      }
--    },
--
--    ["core.norg.dirman"] = { -- Manage your directories with Neorg
--      config = {
--        workspaces = {
--          my_workspace = "~/org"
--        }
--      }
--    },
--
--    ["core.norg.concealer"] = { -- Allows for use of icons
--      config = {
--        icons = {
--          todo = {
--            enabled = true,
--
--            done = {
--              enabled = true,
--              icon = "",
--              pattern = "^(%s*%-%s+%[%s*)x%s*%]%s+",
--              whitespace_index = 1,
--              highlight = "NeorgTodoItemDoneMark",
--              padding_before = 0,
--            },
--
--            pending = {
--              enabled = true,
--              icon = "",
--              pattern = "^(%s*%-%s+%[%s*)%*%s*%]%s+",
--              whitespace_index = 1,
--              highlight = "NeorgTodoItemPendingMark",
--              padding_before = 0,
--            },
--
--            undone = {
--              enabled = true,
--              icon = "×",
--              pattern = "^(%s*%-%s+%[)%s+]%s+",
--              whitespace_index = 1,
--              highlight = "TSComment",
--              padding_before = 0,
--            }
--          },
--
--          heading = {
--            enabled = true,
--
--            level_1 = {
--              enabled = true,
--              icon = "✿",
--              pattern = "^(%s*)%*%s+",
--              whitespace_index = 1,
--              highlight = "NeorgHeading1",
--              padding_before = 0,
--            },
--
--            level_2 = {
--              enabled = true,
--              icon = " ■",
--              pattern = "^(%s*)%*%*%s+",
--              whitespace_index = 1,
--              highlight = "NeorgHeading2",
--              padding_before = 1,
--            },
--
--            level_3 = {
--              enabled = true,
--              icon = "  ⬤",
--              pattern = "^(%s*)%*%*%*%s+",
--              whitespace_index = 1,
--              highlight = "NeorgHeading3",
--              padding_before = 2,
--            },
--
--            level_4 = {
--              enabled = true,
--              icon = "   ✦",  -- ○ ★ ⚝ ○ ◉ ★
--              pattern = "^(%s*)%*%*%*%*%s+",
--              whitespace_index = 1,
--              highlight = "NeorgHeading4",
--              padding_before = 3,
--            },
--
--            level_5 = {
--              enabled = true,
--              icon = "    ♥",  -- ○ ★ ⚝ ○ ◉ ★
--              pattern = "^(%s*)%*%*%*%*%*%s+",
--              whitespace_index = 1,
--              highlight = "NeorgHeading5",
--              padding_before = 4,
--            },
--
--          },
--        }
--      } 
--    },
--
--  },
--}
