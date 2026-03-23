return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				python = { "isort", "black" },
				lua = { "stylua" },
			},
            formatters = {
                isort = {
                    stdin = true,
                    -- This removes the "--line-ending" argument which doesn't play
                    -- nice with pyproject or .editorconfig additions
                    args = { "--stdout", "-", "--filename", "$FILENAME" },
                }
            },
		})

		vim.keymap.set("n", "<leader>F", function()
			conform.format({
				lsp_fallback = true,
				timeout_ms = 1000,
				async = true,
			})
		end, { desc = "[F]ormat document" })
	end,
}
