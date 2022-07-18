-- check if nvim-notify exists otherwise return the defaul notify
local status_ok, notify = pcall(require, 'notify')
if not status_ok then
	return vim.notify
end

notify.setup({
	-- catppuccin base color
	background_colour = "#1e1e2e"
})

return notify
