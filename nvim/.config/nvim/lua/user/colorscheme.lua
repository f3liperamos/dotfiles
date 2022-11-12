local notify = require("user.notify")

local status_ok, _ = pcall(vim.cmd.colorscheme, "catppuccin")
if not status_ok then
	notify("catppuccin not found", "error", {title = "failed to load colorscheme"})
	return
end
