local lsp = require('lspconfig')

lsp.pylsp.setup({
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
