return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true})()
	end,
	-- config = function()
	-- 	local configs = require("nvim-treesitter.configs")
	-- 	
	-- 	configs.set({
	-- 		ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "python", "c++" },
	-- 		sync_install = false,
	-- 		highlight = { enable = true },
	-- 		indent = { enable = true },
	-- 	})
	-- end
}
