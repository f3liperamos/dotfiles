call plug#begin()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Using Dracula until I port embark and ayu-mirage to valid tmThemes"
" Plug 'embark-theme/vim', { 'as': 'embark' }
" Plug 'ayu-theme/ayu-vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Themes
Plug 'lifepillar/vim-gruvbox8'
Plug 'dracula/vim', { 'as': 'dracula' }

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

"LSP Related
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

filetype plugin indent on
syntax on 
set termguicolors number list linebreak
set signcolumn=yes
set completeopt=menuone,noinsert,noselect
set shortmess+=c
colorscheme dracula 

map <Space> <leader>

" Reload vim init
nmap <leader>r :source $HOME/.config/nvim/init.vim<CR>

" Telescope
noremap <leader>p <cmd>Telescope find_files<CR>
nnoremap <leader>hist <cmd>Telescope oldfiles<CR>
nnoremap <leader>lg <cmd> Telescope live_grep<CR>

" Syntax - It breaks a lot in rust :(
lua require('treesitter')

" Load LSP configs
lua require('lsp_config')
let g:completion_matching_strategy_list = ['exact', 'fuzzy']

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" These shortcuts are not good, find new ones
nnoremap <leader>dn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>dp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>fmt <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>df <cmd>lua vim.lsp.buf.code_action()<CR>
