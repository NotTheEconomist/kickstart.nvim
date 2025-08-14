return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true
        vim.g.enable_copilot = false
        vim.keymap.set("i", "<C-y>", "<Plug>(copilot-accept)", { silent = true, desc = "Accept Copilot suggestion" })
        vim.keymap.set("i", "<C-n>", "<Plug>(copilot-dismiss)", { silent = true, desc = "Dismiss Copilot suggestion" })
    end
}
