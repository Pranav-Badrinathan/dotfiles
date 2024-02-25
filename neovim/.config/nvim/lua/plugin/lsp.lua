return {
	-- Perhaps eventually remove lsp-zero?
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-path" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")

			-----------------------------------------------------------------
			-- The only reason I am using lsp-zero: the predefined cmp_action
			-- functions. Perhaps write them locally and remove this dep.
			-- some day.
			-----------------------------------------------------------------
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp_action.toggle_completion(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-k>"] = cmp_action.tab_complete(),
					["<C-j>"] = cmp_action.select_prev_or_fallback(),
					["<C-l>"] = cmp_action.luasnip_jump_forward(),
					["<C-h>"] = cmp_action.luasnip_jump_backward(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "path" },
				})
			})
		end
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		confg = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			-- If removing lsp-zero, replace this with an autocmd for event
			-- "LspAttach"
			lsp_zero.on_attach(function(_, bufnr)
				-- see :help lsp-zero-keybindings
				lsp_zero.default_keymaps({ buffer = bufnr })

				-- Default keybindings are good, but need one for code action.
				vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action,
					{ buffer = bufnr })
			end)

			require("mason-lspconfig").setup({
				ensure_installed = {},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- Sets up lua_ls for nvim.
						-- Might need to change if we actually start using
						-- Lua itself outside nvim...
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				}
			})
		end
	},

	-- More LSP related pludins. Can be in it's own file but oh well.
	-- Rust.
	{
		'mrcjkb/rustaceanvim',
		version = '^4', -- Recommended
		ft = { 'rust' },
	}
}
