-- Load everything unrelated to plugins
require("config.keymaps")
require("config.options")

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins", { ui = { border = "single" } })

--[[
-- Pending
2. Change keybindings to `keys` property on lazy.nvim?
3. Remove unnecessary protected calls from lazy configs. Probably not necessary anymore
4. Cleanup migration from packer, re-check if there is any leftover
--]]
