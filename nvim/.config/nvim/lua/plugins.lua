vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- packer itself
	use("wbthomason/packer.nvim")

	-- Themes
	use("catppuccin/nvim")

	-- fzf
	use({ "junegunn/fzf", run = ":call fzf#install()" })
	use("junegunn/fzf.vim")

	-- Others / Not categorized yet
	use("editorconfig/editorconfig-vim")
	use("nvim-lualine/lualine.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("jose-elias-alvarez/null-ls.nvim")

	-- Completion
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- Shame corner
	use("kchmck/vim-coffee-script")
end)
