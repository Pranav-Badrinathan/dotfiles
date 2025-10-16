return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	opts = {},
	keys = {
		{ "<leader>T", "<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>", desc = "Toggle Trouble window" }
	}
}
