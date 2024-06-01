vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew" })

vim.keymap.set("i", "jk", vim.cmd.stopinsert, { desc = "Exit insert mode" })
vim.keymap.set("n", "U", "<C-R>", { desc = "[U]ndo" })

-- Quick navigate to front and end of line
vim.keymap.set({ "n", "v" }, "gl", "g_", { desc = "Goto end of line" })
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "Goto start of line" })

vim.keymap.set("n", "<leader>A", "gg0vG$", { desc = "Select [A]ll" })

-- Use the :move command to shift lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines down" })

-- Join lines together without moving your cursor
vim.keymap.set("n", "J", "mzJ`z", { desc = "[J]oin lines" })

-- Keep cursor in the middle of the page when jumping half pages at a time
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump [U]p" })

-- Same as above, but for search terms
vim.keymap.set("n", "n", "nzzzv", { desc = "Next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev match" })

-- Copy and paste to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { noremap = true, silent = true, desc = "[Y]ank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p", { desc = "[P]ut from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", "\"+P", { desc = "[P]ut from system clipboard" })

-- Quickfix navigation
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- Diagnostics
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = "[V]iew [D]iagnostics" })
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next [d]iagnostic" })
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Prev [d]iagnostic" })

-- Tab navigation
vim.keymap.set({ "n", "v", "x" }, "<leader>tt", vim.cmd.tabnew, { desc = "New tab" })
vim.keymap.set({ "n", "v", "x" }, "<leader>tx", vim.cmd.tabclose, { desc = "Close tab" })
vim.keymap.set({ "n", "v", "x" }, "<leader>tn", vim.cmd.tabnext, { desc = "Next tab" })
vim.keymap.set({ "n", "v", "x" }, "<leader>tp", vim.cmd.tabprev, { desc = "Prev tab" })

-- Indent/dedent in visual mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
