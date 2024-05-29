local lua_opts = require('lsp-zero').nvim_lua_ls()

require('lspconfig').lua_ls.setup(lua_opts)
