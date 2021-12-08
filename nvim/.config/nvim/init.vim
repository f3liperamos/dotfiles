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


Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" I unfortunately need this one
Plug 'kchmck/vim-coffee-script'

call plug#end()

colorscheme gruvbox
filetype plugin indent on
syntax on
set termguicolors number list linebreak 
set signcolumn=yes
set shortmess+=c
set background=dark
set spell spelllang=en_us

" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

map <Space> <leader>

" Reload vim init
nmap <leader>r :source $HOME/.config/nvim/init.vim<CR>

" fzf
" noremap <leader>p <cmd>:Files<CR>
" noremap <leader>lg <cmd>:Rg<CR>
" noremap <leader>hist <cmd>:History<CR>
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

" Telescope
noremap <leader>p <cmd>Telescope git_files<CR>
noremap <leader>gs <cmd>Telescope grep_string<CR>
noremap <leader>hist <cmd>Telescope oldfiles<CR>
noremap <leader>k <cmd>Telescope keymaps<CR>

" Loading lua files
lua require('treesitter')
lua require('lsp_config')
lua require('statusbar')
