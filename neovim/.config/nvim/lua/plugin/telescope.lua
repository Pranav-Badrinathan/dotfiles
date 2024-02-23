return {
	'nvim-telescope/telescope.nvim',
	branch = "0.1.x",
	dependencies = { 'nvim-lua/plenary.nvim' },

	-- Wrap "require" in functions as otherwise it tries to access unloaded
	-- plugins, and errors.
	keys = {
		{ 
			"<leader>ff", 
			function() require('telescope.builtin').find_files() end, 
			desc = "Telescope find files" 
		},
		{ 
			"<leader>fg", 
			function() require('telescope.builtin').live_grep() end,
			desc = "Telescope live grep" 
		},
		{ 
			"<leader>gf", 
			function() require('telescope.builtin').git_files() end,
			desc = "Telescope git files" 
		},
		{ 
			"<leader>fs", 
			function()
				require('telescope.builtin')
				.grep_string({ search = vim.fn.input("Grep > ") });
			end, 
			desc = "Telescope quick grep" 
		},
	}
}
