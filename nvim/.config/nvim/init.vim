call plug#begin()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Using Dracula until I port embark and ayu-mirage to valid tmThemes"
" Plug 'embark-theme/vim', { 'as': 'embark' }
" Plug 'ayu-theme/ayu-vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LSP Related -- keeping it here to give another chance in future
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'

" Telescope -- keeping it here to give another chance in future
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" Themes
Plug 'morhetz/gruvbox'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Using coc over builtin lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" CoffeeIHopeItDiesSoonScript
Plug 'kchmck/vim-coffee-script'

call plug#end()

filetype plugin indent on
syntax on 
set termguicolors number list linebreak
set signcolumn=yes
set completeopt=menuone,noinsert,noselect
set shortmess+=c
colorscheme gruvbox

map <Space> <leader>

" Reload vim init
nmap <leader>r :source $HOME/.config/nvim/init.vim<CR>

" fzf
noremap <leader>p <cmd>:Files<CR>
noremap <leader>lg <cmd>:Rg<CR>
noremap <leader>hist <cmd>:History<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" loading treesitter
lua require('treesitter')

" Load LSP configs
" lua require('lsp_config')
let g:completion_matching_strategy_list = ['exact', 'fuzzy']

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" These shortcuts are not good, find new ones
nmap <leader>dn <Plug>(coc-diagnostic-next)
nmap <leader>dp <Plug>(coc-diagnostic-prev)
nmap <leader>ff <Plug>(coc-fix-current)
