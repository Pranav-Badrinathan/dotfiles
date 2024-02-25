return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	keys = {
		{ "<leader>T", vim.cmd.TroubleToggle, desc = "Toggle Trouble window" }
	}
}
