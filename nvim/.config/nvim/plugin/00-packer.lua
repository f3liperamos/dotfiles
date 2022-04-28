-- Bootstrapping packer
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
end

return require("packer").startup(function(use)
	-- packer itself
	use("wbthomason/packer.nvim")

	-- Themes
	use({ "catppuccin/nvim", branch = "main", as = "catppuccin" })

	-- Add icons support
	use("kyazdani42/nvim-web-devicons")

	-- Make buffers look like tabs
	use({ "akinsho/bufferline.nvim", branch = "main", requires = "kyazdani42/nvim-web-devicons" })

	-- gitsigns
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		tag = "v0.4",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- fzf
	use({ "junegunn/fzf", run = ":call fzf#install()" })
	use("junegunn/fzf.vim")

	-- Telescope related, trying fzy fuzzy algorithm
	use({ "nvim-telescope/telescope-fzy-native.nvim", run = "git submodule update --init --recursive" })

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

	-- LSP Signature
	use("ray-x/lsp_signature.nvim")

	-- Shame corner
	use("kchmck/vim-coffee-script")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
