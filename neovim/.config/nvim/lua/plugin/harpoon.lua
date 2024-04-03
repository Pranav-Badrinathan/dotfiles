return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	keys = {
		{
			"<leader>hh",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Toggle harpoon ui quick menu."
		},
		{
			"<leader>hm",
			function()
				local list = require("harpoon"):list()

				local buf_name = vim.fn.expand("%")
				if list:get_by_display(buf_name) == nil then
					list:add()
				else
					list:remove()
				end
			end,
			desc = "Toggle current file in harpoon list."
		},
		{
			"<leader>hd",
			function() require("harpoon"):list():clear() end,
			desc = "Clear the harpoon list"
		},
		{
			"<leader>hj",
			function() require("harpoon"):list():next() end,
			desc = "Toggle the next buffer on the harpoon list."
		},
		{
			"<leader>hk",
			function() require("harpoon"):list():prev() end,
			desc = "Toggle the previous buffer on the harpoon list."
		},
		-- Disabled as of now, as Harpoon 2 does not support terminals yet?
--		{
--			"<leader>ht",
--		}
	},
	config = function()
		require("harpoon"):setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			}
		})
	end,
}
