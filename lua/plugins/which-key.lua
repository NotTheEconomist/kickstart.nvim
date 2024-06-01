return {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {},
    config = function()
        local wk = require('which-key')
        wk.register({
            ["<leader>s"] = {
                name = "[s]earch..."
            }
        })
        wk.register({
            ["<leader>h"] = {
                name = "[h]arpoon..."
            }
        })
    end

}
