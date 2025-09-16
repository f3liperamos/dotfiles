-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main?tab=readme-ov-file#highlighting
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("EnableTreesitterHighlighting", { clear = true }),
	desc = "Try to enable tree-sitter syntax highlighting",
	pattern = "*", -- run on *all* filetypes
	callback = function()
		pcall(function()
			vim.treesitter.start()
		end)
	end,
})
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
