-- Load everything unrelated to plugins
require("config.keymaps")
require("config.options")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Assign shortcut to open Lazy
vim.keymap.set("n", "<Leader>l", "<Cmd>Lazy<CR>", { desc = "Lazy: open f[l]oating window" })

-- Load plugins
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	ui = { border = "single" },
	rocks = { enabled = false },
})

--[[
TODO: 
    - Setup dap
    - Make a function to detect chezmoi and open config from there
    - Try vimwiki
--]]
