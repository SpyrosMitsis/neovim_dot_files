--  
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- This sets line numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true


-- 4 space tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


--- This disbles the persistent search and enables incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true


-- This keeps the scrolloff of space of 8 meaning that the will always be either 8
-- lines above or below when scrolling
vim.opt.scrolloff = 8


-- This is used to move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- This is used to use the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")




