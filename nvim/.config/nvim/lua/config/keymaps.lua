vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to the up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to the right window" })

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left without exiting visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right without exiting visual mode" })

vim.keymap.set("v", "<C-c>", '"*y', { desc = 'Copy selection to "* register' })
vim.keymap.set("v", "p", '"_dP', { desc = "Replace selection without yanking" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll down and centralize screen" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll up and centralize screen" })
vim.keymap.set("n", "n", "nzz", { desc = "Go to next search result and centralize screen" })
vim.keymap.set("n", "N", "Nzz", { desc = "Go to previous search result and centralize screen" })

vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "<Esc> clears highlights when in normal mode" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
