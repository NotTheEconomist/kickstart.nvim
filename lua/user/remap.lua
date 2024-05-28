vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "jk", vim.cmd.stopinsert)
vim.keymap.set("n", "U", "<C-R>")

-- Quick navigate to front and end of line
vim.keymap.set("n", "gl", "g_")
vim.keymap.set("v", "gl", "g_")
vim.keymap.set("n", "gh", "^")
vim.keymap.set("v", "gh", "^")

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
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+P")
vim.keymap.set("v", "<leader>p", "\"+p")

-- Quick formatting through LSP
vim.keymap.set("n", "<leader>F", function()
    vim.lsp.buf.format()
end)

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
