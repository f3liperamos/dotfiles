" ========================
" Plugins
" ========================
call plug#begin()

" ========================
" Themes 
" ========================
Plug 'catppuccin/nvim'

" ========================
" Others / Not categorized yet
" ========================
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jose-elias-alvarez/null-ls.nvim'

" ========================
" Completion
" ========================
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" ========================
" Shame Corner
" ========================
Plug 'kchmck/vim-coffee-script'
call plug#end()

" ========================
" Editor defaults
" ========================
colorscheme catppuccin
filetype plugin indent on
syntax on
set termguicolors number list linebreak
set signcolumn=yes
set shortmess+=c
set background=dark

map <Space> <leader>

" ========================
" Reload vim init
" ========================
nmap <leader>r :source $HOME/.config/nvim/init.vim<CR>

" ========================
" fzf keybindings, disabled until further notice (Telescope)
" noremap <leader>p <cmd>:Files<CR>
" noremap <leader>lg <cmd>:Rg<CR>
" noremap <leader>hist <cmd>:History<CR>
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
" ========================

" ========================
" Telescope keybindings
" ========================
noremap <leader>p <cmd>Telescope git_files<CR>
noremap <leader>gs <cmd>Telescope grep_string<CR>
noremap <leader>hist <cmd>Telescope oldfiles<CR>
noremap <leader>k <cmd>Telescope keymaps<CR>

" ========================
" Loading lua config files
" TODO: Convert all init.vim to init.lua
" ========================
lua require('treesitter')
lua require('lsp_config')
lua require('statusbar')
lua require('autocomplete')
