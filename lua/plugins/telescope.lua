return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build =
            'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('telescope').setup({
            defaults = {
                path_display = { truncate = 3 }
            }
        })
        require('telescope').load_extension('fzf')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[s]earch [f]iles" })
        vim.keymap.set('n', '<leader>sF', function() builtin.find_files({ hidden = true }) end, { desc = "[s]earch [F]iles (including hidden files)"})
        vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = "[s]earch [b]uffers" })
        vim.keymap.set('n', '<leader>sj', builtin.jumplist, { desc = "[s]earch [j]umplist" })
        vim.keymap.set('n', '<leader>svcs', builtin.git_files, { desc = "[s]earch [vcs]" })
        vim.keymap.set('n', '<leader>sht', builtin.help_tags, { desc = "[s]earch [h]elp [t]ags" })
        vim.keymap.set('n', '<leader>D', builtin.diagnostics, { desc = "[D]iagnostics" })
        vim.keymap.set('n', '<leader>/', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end, { desc = "Grep working directory" })
    end
}
