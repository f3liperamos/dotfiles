-- bootstrapping packer 
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end


-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- start packer
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- have packer manage itself

	-- themes
	use({ "catppuccin/nvim", branch = "main", as = "catppuccin" })

	-- better (?) notifications
	use "rcarriga/nvim-notify"

	-- telescope is a highly extendable fuzzy finder
	use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'}, {
		'kyazdani42/nvim-web-devicons'
	} }}

	-- completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	-- nvim-cmp requires one snippet engine
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- LSP later
	--[[use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")

	-- Bunch of cool snippets,
	-- maybe worth to check it out
	use "rafamadriz/friendly-snippets"
	]]

  
	if packer_bootstrap then
		require("packer").sync()
	end

end)
