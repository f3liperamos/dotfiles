require("config.options")
require("config.keymaps")
require("config.plugins")
require("config.colorscheme")
require("config.cmp")
require("config.lsp")

-- Not sure how to set these without vim.cmd, not
-- even sure if I need those
-- vim.cmd([[filetype plugin indent on]])
-- vim.cmd([[syntax on]])

--[[
" ========================
" old fzf keybindings, disabled until further notice (Telescope)
" noremap <leader>p <cmd>:Files<CR>
" noremap <leader>lg <cmd>:Rg<CR>
" noremap <leader>hist <cmd>:History<CR>
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
" ========================
]]
