return {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "[h]arpoon: [a]dd file" })
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        vim.keymap.set("n", "<leader>hn", ui.nav_next, { desc = "[h]arpoon: [n]ext file" })
        vim.keymap.set("n", "<leader>hp", ui.nav_prev, { desc = "[h]arpoon: [p]rev file" })
        vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end)
    end
}
