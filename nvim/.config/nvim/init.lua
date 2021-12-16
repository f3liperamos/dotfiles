require("plugins")
require("treesitter")
require("lsp_config")
require("statusbar")
require("autocomplete")

-- Theme
vim.g.colors_name = "catppuccin"

-- Not sure if I need it.
-- vim.cmd('filetype plugin indent on')
-- vim.cmd('syntax on')

-- Options
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.list = true
vim.opt.linebreak = true
vim.opt.signcolumn = "yes"
vim.opt.background = "dark"

-- Is it needed?
-- vim.opt.shortmess:append({c=true})

-- Telescope keybindings
local opts = { noremap = true }
vim.api.nvim_set_keymap("", "<Space>", "<Leader>", {})
vim.api.nvim_set_keymap("n", "<Leader>p", "<Cmd>Telescope git_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>gs", "<Cmd>Telescope grep_string<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>hist", "<Cmd>Telescope oldfiles<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>k", "<Cmd>Telescope keymaps<CR>", opts)

--[[
" ========================
" old fzf keybindings, disabled until further notice (Telescope)
" noremap <leader>p <cmd>:Files<CR>
" noremap <leader>lg <cmd>:Rg<CR>
" noremap <leader>hist <cmd>:History<CR>
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
" ========================

" ========================
" Loading lua config files
" TODO: Convert all init.vim to init.lua
" ========================
]]
