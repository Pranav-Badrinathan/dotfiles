vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Pasting with middle mouse pastes in cursor position, not mouse position.
vim.keymap.set("n", "<MiddleMouse>", "i<MiddleMouse><Esc>")

vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-Up>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-Down>", ":m '<-2<CR>gv=gv")

-- Same as 'J', but cursor stays in place. See ":help J".
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("v", "J", "mzJ`z")

-- Paste without taking the thing pasted over into the paste buffer.
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy into OS clipboard/register
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- Delete into void register.
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
