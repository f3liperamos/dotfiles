return {
	"rcarriga/nvim-notify",
	config = function()
		-- check if nvim-notify exists otherwise return an error message
		-- and a fallback to original vim.notify
		local status_ok, notify = pcall(require, "notify")
		if not status_ok then
			local mapping = {
				["debug"] = vim.log.levels.DEBUG,
				["error"] = vim.log.levels.ERROR,
				["info"] = vim.log.levels.INFO,
				["off"] = vim.log.levels.OFF,
				["trace"] = vim.log.levels.TRACE,
				["warn"] = vim.log.levels.WARN,
			}

			vim.notify(
				"nvim-notify not found, check installation",
				mapping.error
			)

			return function(message, log_level, _)
				vim.notify(message, mapping[log_level] or nil)
			end
		end

		-- catppuccin base color
		notify.setup({ background_colour = "#1e1e2e" })

		vim.notify = notify

		return notify
	end,
}
