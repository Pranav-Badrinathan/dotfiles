vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Pasting with middle mouse pastes in cursor position, not mouse position.
vim.keymap.set("n", "<MiddleMouse>", "i<MiddleMouse><Esc>")
