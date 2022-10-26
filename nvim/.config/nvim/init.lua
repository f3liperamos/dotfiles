-- Set Space to also trigger Leader key
vim.api.nvim_set_keymap("", "<Space>", "<Leader>", {})

-- Theme
vim.cmd([[colorscheme catppuccin]])

-- Not sure how to set these without vim.cmd
vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax on]])

-- Options
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.list = true
vim.opt.linebreak = true
vim.opt.signcolumn = "yes"
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.relativenumber = true

--[[
" ========================
" old fzf keybindings, disabled until further notice (Telescope)
" noremap <leader>p <cmd>:Files<CR>
" noremap <leader>lg <cmd>:Rg<CR>
" noremap <leader>hist <cmd>:History<CR>
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
" ========================
]]
