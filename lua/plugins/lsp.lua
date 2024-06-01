return {
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'antosha417/nvim-lsp-file-operations', config = true },
            { 'folke/neodev.nvim',                   opts = {} },
            { 'nvim-telescope/telescope.nvim' },
        },
        config = function()
            local lspconfig = require('lspconfig')
            local cmp_nvim_lsp = require('cmp_nvim_lsp')
            local mason_lspconfig = require('mason-lspconfig')
            local telescope = require('telescope.builtin')
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(event)
                    local make_opts = function(desc)
                        local opts = { buffer = event.buf, silent = true, remap = false }
                        if (desc ~= nil) then
                            opts["desc"] = desc
                        end
                        return opts
                    end

                    vim.keymap.set("n", "gd", telescope.lsp_definitions, make_opts("LSP: [g]oto [d]efinition"))
                    vim.keymap.set("n", "gr", telescope.lsp_references, make_opts("LSP: [g]oto [r]eferences"))
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, make_opts("Hover"))
                    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol,
                        make_opts("LSP: [v]iew [w]orkspace [s]ymbols"))
                    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, make_opts("LSP: [c]ode [a]ctions"))
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, make_opts("LSP: [r]e[n]ame"))
                    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, make_opts(nil))
                end
            })

            local capabilities = cmp_nvim_lsp.default_capabilities()
            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities
                    })
                end,
                ["pylsp"] = function()
                    lspconfig["pylsp"].setup({
                        capabilities = capabilities,
                        settings = {
                            pylsp = {
                                plugins = {
                                    black = { enabled = true },
                                    pylsp_mypy = { enabled = true },
                                    pyls_isort = { enabled = true },
                                    jedi_completion = { enabled = true },
                                }
                            }
                        }
                    })
                end,
            })
        end
    }
}
