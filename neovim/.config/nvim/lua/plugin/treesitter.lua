return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			-- query is Treesitter's own query lang.
			ensure_installed = { "c", "rust", "lua", "vim", "vimdoc", "query" },

			-- Install parsers synchronously (only applied to ensure_installed)
			sync_install = false,
			-- Automatically install missing parsers when entering buffer.
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		}
	end
}
