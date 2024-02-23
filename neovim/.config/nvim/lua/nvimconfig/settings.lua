local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false -- This is default, but still set explicitly

-- Set vim persistent undo.
opt.undodir = vim.fn.stdpath("config") .. "/.undo"
