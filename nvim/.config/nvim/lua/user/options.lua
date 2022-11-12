-- autocommand to reload options.lua when saving
-- clear autogroup first to prevent it running multiple times
vim.api.nvim_create_augroup("options_user_config", {clear = true})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "options_user_config",
	pattern = "options.lua", 
	command = "source <afile>",
})

local options = {
	background = "dark",
	cmdheight	= 2,
	completeopt = {"menu", "menuone", "noinsert",  "noselect"},
	fileencoding	= "utf-8",
	ignorecase	= true,
	linebreak = true,
	list  = true, -- always display tabs and spaces
	mouse = "a",
	number = true,
	pumheight	= 10,
	relativenumber = true,
	scrolloff = 8,
	showtabline = 2,
	signcolumn = "yes",
	smartcase  = true,
	smartindent	= true,
	termguicolors = true,
	undofile = true,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
