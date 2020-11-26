call plug#begin()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Using Dracula until I port embark and ayu-mirage to valid tmThemes"
" Plug 'embark-theme/vim', { 'as': 'embark' }
" Plug 'ayu-theme/ayu-vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

"LSP Related
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

filetype plugin indent on
syntax on 
set termguicolors
set number 
set list
set linebreak
colorscheme dracula 
map <Space> <leader>

" Reload vim init
nmap <leader>r :source $HOME/.config/nvim/init.vim<CR>

" FZF
" Search relative to where nvim was opened
nmap <leader>p :Files!<CR>
"Search relative to CURRENT file
nmap <leader>P :Files! <C-R>=expand('%:h')<CR><CR>
nmap <leader>hist :History!<CR>
nmap <leader>rg :Rg!<CR>
nmap <leader>b :Buffers!<CR>
nmap <leader>gf :GFiles?<CR>

let g:fzf_preview_window = 'right:70%'
let g:fzf_action = { 'enter': 'tab split', 'ctrl-t': 'tab split', 'ctrl-x': 'split', 'ctrl-v': 'vsplit' }

" Load LSP configs

" Set a fixed column for errors or warnings
set signcolumn=yes

lua require('lsp_config')

set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_matching_strategy_list = ['exact', 'fuzzy']

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" These shortcuts are not good, find new ones
nnoremap <leader>dn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>dp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

