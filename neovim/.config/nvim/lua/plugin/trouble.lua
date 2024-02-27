return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "Trouble", "TroubleToggle" },
	keys = {
		{ "<leader>T", vim.cmd.TroubleToggle, desc = "Toggle Trouble window" }
	}
}
