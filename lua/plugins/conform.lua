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
