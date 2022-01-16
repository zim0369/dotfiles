local map = vim.api.nvim_set_keymap
local defo = { noremap = true, silent = true }
local cmd = vim.cmd

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

map("n", "gr", '<cmd>lua require("renamer").rename()<cr>', defo)
map("v", "gr", '<cmd>lua require("renamer").rename()<cr>', defo)

-- map("n", "y", "<plug>YAMotion<cr>", defo)
-- map("x", "y", "<plug>YAVisual<cr>", defo)
-- map("n", "yy", "<plug>YALine<cr>", defo)

map("n", "<C-j>", ":bp<CR>", defo)
map("i", "<C-j>", "<esc>:bp<CR>", defo)
map("n", "<C-k>", ":bn<CR>", defo)
map("i", "<C-k>", "<esc>:bn<CR>", defo)

map("n", "dk", "dkk", defo)

map("i", "<C-z>", ":<esc>stop<CR>", defo)

-- map("n", "<C-b>", ":bp<CR>", defo)
-- map("n", "<C-f>", ":bn<CR>", defo)

map("n", "/", ":SearchBoxMatchAll<CR>", defo)
map("x", "/", ":SearchBoxMatchAll visual_mode=true<CR>", defo)
map("n", "?", ":SearchBoxMatchAll reverse=true<CR>", defo)

-- map("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })

map("n", "t", "f", defo)

map("n", "Q", ":q!<CR>", defo)
map("n", "Z", ":wq<CR>", defo)

map("n", "<leader>e", ":lua vim.diagnostic.open_float(0,{scope = 'cursor'})<CR>", defo)
map("n", "<leader>r", ":SearchBoxReplace confirm=menu<CR>", defo)
map("v", "<leader>r", ":SearchBoxReplace confirm=menu visual_mode=true<CR>", defo)

map("n", "<leader>mi", ":PaqInstall<CR>", defo)
map("n", "<leader>mu", ":PaqUpdate<CR>", defo)
map("n", "<leader>mc", ":PaqSync<CR>", defo)
map("n", "<leader>mr", ":PaqClean<CR>", defo)

map("n", "<leader>mp", ":Glow<CR>", defo)

map("n", "<leader>mv", ":mkview<CR>", defo)
map("n", "<leader>ov", ":loadview<CR>", defo)

map("n", "<leader>s", ":w<CR>", defo)
map("n", "<leader>d", ":bd<CR>", defo)

map("n", "<leader>v", ":vnew<CR>", defo)
map("n", "<leader>n", ":new<CR>", defo)

map("n", "<leader>tm", ":TableModeToggle<CR>", defo)
map("n", "<leader>tn", ":tabnew<CR>", defo)
map("n", "<leader>th", ":-tabmove<CR>", defo)
map("n", "<leader>tl", ":+tabmove<CR>", defo)

map("n", "<leader>i", ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', defo)
map("n", "<C-Space>", ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>', defo)
map("i", "<C-Space>", ':<esc>exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>', defo)

--map("i", "<C-H>", "<C-W>", { noremap = true })

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------

-- nvim-tree
map("n", "<leader><leader>", ":NvimTreeToggle<CR>", defo) -- open/close

map("n", "o", "o <Esc>", defo)
map("n", "O", "O <Esc>", defo)
map("n", "<C-l>", ":SearchBoxClear<CR><C-l>", defo)
map("i", "<C-l>", ":<esc>SearchBoxClear<CR><C-l>", defo)

map("n", "Y", 'gg"+yG``', defo)
map("v", "-", '"+y', defo)
map("n", "-", '"+yy', defo)
map("v", "x", '"+ygvd', defo)
map("v", "+", '"+p', defo)
map("n", "+", '"+P', defo)
map("n", "_", "a <esc>", defo)

map("n", "<Leader>fb", ":lua require([[telescope.builtin]]).buffers()<cr>", defo)
map("n", "<Leader>fg", ":lua require([[telescope.builtin]]).live_grep()<cr>", defo)
map("n", "<Leader>fc", ":lua require([[telescope.builtin]]).colorscheme()<cr>", defo)
map("n", "<Leader>ff", ':lua require"telescope.builtin".find_files()<CR>', defo)
map("n", "<Leader>fh", ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', defo)
map("n", "<Leader>/", ":lua require[[telescope.builtin]].current_buffer_fuzzy_find{}<CR>", defo)

map("v", "f", "<cmd>lua require'hop'.hint_words()<cr>", {})
map("o", "f", "<cmd>lua require'hop'.hint_words()<cr>", {})
map("n", "f", "<cmd>lua require'hop'.hint_words()<cr>", {})
map("v", "F", "<cmd>lua require'hop'.hint_words({current_line_only = true})<cr>", {})
map("o", "F", "<cmd>lua require'hop'.hint_words({current_line_only = true})<cr>", {})
map("n", "F", "<cmd>lua require'hop'.hint_words({current_line_only = true})<cr>", {})

map("n", "<leader>b", ":!cp ~/boilerplates/boilerplate.%:e %<Enter>", defo)

map("n", "<leader>h", ":SidewaysLeft<cr>", defo)
map("n", "<leader>l", ":SidewaysRight<cr>", defo)

map("n", "<C-d>", ":MoveLine(1)<CR>", { noremap = true, silent = true })
map("i", "<C-d>", ":<esc>MoveLine(1)<CR>", { noremap = true, silent = true })
map("n", "<C-u>", ":MoveLine(-1)<CR>", { noremap = true, silent = true })
map("i", "<C-u>", ":<esc>MoveLine(-1)<CR>", { noremap = true, silent = true })
map("v", "<C-d>", ":MoveBlock(1)<CR>", { noremap = true, silent = true })
map("v", "<C-u>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
-- map('n', '<C-l>', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
-- map('n', '<C-h>', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
-- map('v', '<C-l>', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
-- map('v', '<C-h>', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
