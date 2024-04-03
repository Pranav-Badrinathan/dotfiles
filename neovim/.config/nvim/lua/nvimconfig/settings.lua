local opt = vim.opt

opt.termguicolors = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false -- This is default, but still set explicitly

-- Set vim persistent undo.
-- opt.undodir = vim.fn.stdpath("config") .. "/.undo"
opt.undofile = true

opt.relativenumber = true
opt.scrolloff = 6
opt.signcolumn = "yes:1"
opt.colorcolumn = {81, 101}

opt.wrap = false
opt.incsearch = true
opt.updatetime = 100
opt.splitbelow = true
