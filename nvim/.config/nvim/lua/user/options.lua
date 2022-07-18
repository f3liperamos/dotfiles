local options = {
	background = "dark",
	cmdheight	= 2,
	fileencoding	= "utf-8",
	ignorecase	= true,
	linebreak = true,
	list  = true, -- always display tabs and spaces
	number = true,
	pumheight	= 10,
	scrolloff = 8,
	showtabline = 2,
	signcolumn = "yes",
	smartcase  = true,
	smartindent	= true,
	termguicolors = true,
	undofile = true,
	mouse = "a",
	-- menuone: pop up even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
	completeopt = { "menu", "menuone", "noselect" }
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
