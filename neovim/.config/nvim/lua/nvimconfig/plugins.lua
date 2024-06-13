-- Get and Update lazy.nvim.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.g.rustaceanvim = {
	server = {
		settings = {
			['rust-analyzer'] = {
				checkOnSave = {
					command = "clippy",
				}
			}
		},
		cmd = function()
			local data_path = vim.fn.stdpath("data")
			local dir = data_path .. "/mason/bin/"
			local ra_cmd = vim.fn.glob(dir .. "rust-analyzer*")

			return { ra_cmd }
		end,
	}
}

require("lazy").setup({
	-- Colorschemes
	"folke/tokyonight.nvim",
	"catppuccin/nvim",
	"rebelot/kanagawa.nvim",
	"bluz71/vim-nightfly-colors",

	{ "lewis6991/gitsigns.nvim", config = true, event = "BufRead" },
	{ "j-hui/fidget.nvim", config = true },

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl",
	opts = {}, event = "BufRead"},

	require("plugin.telescope"),
	require("plugin.treesitter"),

	-- HARPOOOOOOOOOON 2.0!
	require("plugin.harpoon"),
	require("plugin.undotree"),

	-- LSP and Autocomplete. Lazy loading with lsp-zero.
	require("plugin.lsp"),
	require("plugin.trouble"),

	require("plugin.lualine")
})
