return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_filetypes = {
            ["*"] = false,
        }
        vim.keymap.set("i", "<C-y>", "copilot#Accept('\\<CR>')", { silent = true, expr=true, replace_keycodes=false, desc = "Accept Copilot suggestion" })
        vim.keymap.set("i", "<C-n>", "<Plug>(copilot-dismiss)", { silent = true, desc = "Dismiss Copilot suggestion" })
    end
}
