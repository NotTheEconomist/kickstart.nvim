return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>svcs', builtin.git_files, {})
        vim.keymap.set('n', '<leader>sht', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>/', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
    end
}
