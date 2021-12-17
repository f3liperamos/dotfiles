-- Space also triggers Leaders
vim.api.nvim_set_keymap("", "<Space>", "<Leader>", {})

-- Theme
vim.g.colors_name = "catppuccin"

-- Not sure how to set it with lua
vim.cmd("filetype plugin indent on")

-- Not sure if I need it.
-- vim.cmd("syntax on")

-- Options
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.list = true
vim.opt.linebreak = true
vim.opt.signcolumn = "yes"
vim.opt.background = "dark"

-- Is it needed?
-- vim.opt.shortmess:append({c=true})


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
