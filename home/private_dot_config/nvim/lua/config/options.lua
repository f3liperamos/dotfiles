local options = {
	background = "dark",
	breakindent = true,
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
	showtabline = 0,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	timeoutlen = 300,
	undofile = true,
	updatetime = 250,
	winborder = "solid",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main?tab=readme-ov-file#folds
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
