call plug#begin()

" ========================
" THEMES
" ========================
" Issue: https://github.com/sharkdp/bat is used together with fzf and it only
" accepts .tmThemes as syntax highlighting. To keep both vim and bat with
" consistent highlighting I've opted to use gruvbox theme on them.
" Embark would be go to theme
" Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'morhetz/gruvbox'


" Telescope -- keeping it here to give another chance in future
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" I unfortunately need this one
Plug 'kchmck/vim-coffee-script'

call plug#end()

colorscheme gruvbox
filetype plugin indent on
syntax on
set termguicolors number list linebreak signcolumn=yes
set shortmess+=c

" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

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
