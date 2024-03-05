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
TODO: 
    - Setup dap
    - Check if you can live without bufferline
    - Try vimwiki
--]]
