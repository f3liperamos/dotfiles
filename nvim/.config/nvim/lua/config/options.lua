-- autocommand to reload options.lua when saving
-- clear autogroup first to prevent it running multiple times
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("dotfiles-options", { clear = true }),
	pattern = "options.lua",
	command = "source <afile>",
})

local options = {
	background = "dark",
	cmdheight = 1,
	completeopt = { "menu", "menuone", "noinsert", "noselect" },
	cursorline = true,
	fileencoding = "utf-8",
	ignorecase = true,
	inccommand = "split",
	linebreak = true,
	list = true,
	mouse = "a",
	number = true,
	pumheight = 10,
	relativenumber = true,
	scrolloff = 8,
	showmode = false,
	showtabline = 2,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	termguicolors = true,
	timeoutlen = 300,
	undofile = true,
	updatetime = 250,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
