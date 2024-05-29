vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "jk", vim.cmd.stopinsert)
vim.keymap.set("n", "U", "<C-R>")

-- Quick navigate to front and end of line
vim.keymap.set({ "n", "v" }, "gl", "g_")
vim.keymap.set({ "n", "v" }, "gh", "^")

vim.keymap.set("n", "%", "gg0vG$")

-- Use the :move command to shift lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join lines together without moving your cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in the middle of the page when jumping half pages at a time
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Same as above, but for search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy and paste to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Diagnostics
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end)

-- Tab navigation
vim.keymap.set({"n", "i", "v", "x"}, "<C-t><C-t>", vim.cmd.tabnew)
vim.keymap.set({"n", "i", "v", "x"}, "<C-t>x", vim.cmd.tabclose)
vim.keymap.set({"n", "i", "v", "x"}, "<C-t>n", vim.cmd.tabnext)
vim.keymap.set({"n", "i", "v", "x"}, "<C-t>p", vim.cmd.tabprev)

-- Indent/dedent in visual mode
vim.keymap.set("v", "<", "<gv", {noremap = true, silent = true})
vim.keymap.set("v", ">", ">gv", {noremap = true, silent = true})
