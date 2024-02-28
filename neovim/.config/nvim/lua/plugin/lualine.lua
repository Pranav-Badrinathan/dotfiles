return {
	"nvim-lualine/lualine.nvim",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		sections = {
			lualine_a = {"mode"},
			lualine_b = {"branch", "diff"},
			lualine_c = {"filetype", "filename"},
			lualine_x = {"searchcount", "diagnostics", "encoding"},
			lualine_y = {"location"},
			lualine_z = {"progress"},
		}
	}
}
