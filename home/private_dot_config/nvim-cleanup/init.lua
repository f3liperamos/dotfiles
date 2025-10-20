-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- ============================== Options =====================================
-- ============================================================================

-- General ====================================================================
vim.g.mapleader = ' ' -- Use `<Space>` as <Leader> key
vim.g.maplocalleader = " " -- Use `<Space>` as <Leader> key
vim.o.mouse       = 'a'            -- Enable mouse
vim.o.mousescroll = 'ver:25,hor:6' -- Customize mouse scroll
vim.o.switchbuf   = 'usetab'       -- Use already opened buffers when switching
vim.o.undofile    = true           -- Enable persistent undo
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)

-- Enable all filetype plugins and syntax (if not enabled, for better startup)
vim.cmd('filetype plugin indent on')
if vim.fn.exists('syntax_on') ~= 1 then vim.cmd('syntax enable') end

-- UI =========================================================================
vim.o.background = "dark"
vim.o.breakindent = true
vim.o.breakindentopt = "list:-1"
vim.o.colorcolumn = '+1'
vim.o.cursorline = true
vim.o.cursorlineopt  = 'screenline,number' -- Show cursor line per screen line
vim.o.fillchars = 'eob: ,fold:╌'
vim.o.inccommand = "split"
vim.o.linebreak = true
vim.o.list = true
vim.o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:> '
vim.o.number = true
vim.o.pumheight = 10
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shortmess      = 'CFOSWaco'
vim.o.signcolumn = "yes"
vim.o.splitbelow     = true       -- Horizontal splits will be below
vim.o.splitkeep      = 'screen'   -- Reduce scroll during window split
vim.o.splitright     = true       -- Vertical splits will be to the right
vim.o.undofile = true
vim.o.winborder      = 'single'   -- Use border in floating windows
vim.o.wrap           = false      -- Don't visually wrap lines (toggle with \w)

-- Folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
vim.o.foldlevel   = 10       -- Fold nothing by default; set to 0 or 1 to fold
vim.o.foldmethod  = 'indent' -- Fold based on indent level
vim.o.foldnestmax = 10       -- Limit number of fold levels
vim.o.foldtext    = ''       -- Show text under fold with its highlighting
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- https://github.com/nvim-treesitter/nvim-treesitter/tree/main?tab=readme-ov-file#folds

-- Editing ====================================================================
vim.o.autoindent    = true    -- Use auto indent
vim.o.formatoptions = 'rqnl1j'-- Improve comment editing
vim.o.ignorecase    = true    -- Ignore case during search
vim.o.incsearch     = true    -- Show search matches while typing
vim.o.infercase     = true    -- Infer case in built-in completion
vim.o.shiftwidth    = 2       -- Use this number of spaces for indentation
vim.o.smartindent   = true    -- Make indenting smart
vim.o.spelloptions  = 'camel' -- Treat camelCase word parts as separate words
vim.o.virtualedit   = 'block' -- Allow going past end of line in blockwise mode

vim.o.iskeyword = '@,48-57,_,192-255,-' -- Treat dash as `word` textobject part

-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Built-in completion
vim.o.complete    = '.,w,b,kspell'                  -- Use less sources
vim.o.completeopt = 'menuone,noselect,fuzzy,nosort' -- Use custom behavior


-- ============================================================================
-- ============================== Keymaps =====================================
-- ============================================================================

-- General mappings ===========================================================

local map = function(mode, lhs, rhs, desc)
  -- See `:h vim.keymap.set()`
  vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

map("n", "<C-h>", "<C-w>h", "Go to the left window")
map("n", "<C-j>", "<C-w>j", "Go to the down window" )
map("n", "<C-k>", "<C-w>k", "Go to the up window" )
map("n", "<C-l>", "<C-w>l", "Go to the right window" )

map("i", "jk", "<Esc>", "Exit insert mode" )
map("i", "kj", "<Esc>", "Exit insert mode" )

map("v", "<", "<gv", "Indent left without exiting visual mode" )
map("v", ">", ">gv", "Indent right without exiting visual mode" )

map("v", "<C-c>", '"*y', 'Copy selection to "* register')
map("v", "p", '"_dP', "Replace selection without yanking" )

map("n", "<C-u>", "<C-u>zz", "Scroll down and centralize screen" )
map("n", "<C-d>", "<C-d>zz", "Scroll up and centralize screen" )
map("n", "n", "nzz", "Go to next search result and centralize screen" )
map("n", "N", "Nzz", "Go to previous search result and centralize screen" )

map("n", "<Esc>", "<Cmd>nohlsearch<CR>", "<Esc> clears highlights when in normal mode" )
map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode" )

-- map("n", "<Tab>", "<Cmd>b#<CR>", "<Tab> switches between most recent buffers" )



-- ============================================================================
-- ============================== Plugins =====================================
-- ============================================================================

-- Setup lazy.nvim
require("lazy").setup({
  spec = {

    -- Pending conversion
    -- blink-cmp
    -- fzf.lua
    -- hardtime
    -- leap
    -- lspconfig
    -- mason
    -- oil
    -- treesitter
    -- fugitive
    -- gitsigns (or try mini.diff again? min.diff + mini.git?)
    -- conform
    -- nvim-lint?


    -- MINI
    {
      'nvim-mini/mini.nvim',
      version = false,
      config = function ()
	require("mini.extra").setup()
	
	require("mini.comment").setup()
	require("mini.indentscope").setup()
	require("mini.jump").setup()
	require("mini.sessions").setup()
	require("mini.starter").setup()
	-- require("mini.clue") -- TODO: Config this


	local hipatterns = require('mini.hipatterns')
	local hi_words = MiniExtra.gen_highlighter.words
	hipatterns.setup({
	  highlighters = {
	    -- Highlight a fixed set of common words. Will be highlighted in any place,
	    -- not like "only in comments".
	    fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
	    hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
	    todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
	    note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),

	    -- Highlight hex color string (#aabbcc) with that color as a background
	    hex_color = hipatterns.gen_highlighter.hex_color(),
	  },
	})

	require("mini.ai").setup({
	  custom_textobjects = {
	    B = MiniExtra.gen_ai_spec.buffer(),
	    F = require("mini.ai").gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
	  },
	})

	require("mini.icons").setup()
	MiniIcons.mock_nvim_web_devicons()

	require("mini.notify").setup()
	vim.notify = MiniNotify.make_notify()

	require("mini.statusline").setup()
	MiniStatusline.section_location = function()
	  return "%2l:%-2v"
	end

	require("mini.surround").setup({
	  mappings = {
	    add = "gsa", -- Add surrounding in Normal and Visual modes
	    delete = "gsd", -- Delete surrounding
	    find = "gsf", -- Find surrounding (to the right)
	    find_left = "gsF", -- Find surrounding (to the left)
	    highlight = "gsh", -- Highlight surrounding
	    replace = "gsr", -- Replace surrounding
	    update_n_lines = "gsn", -- Update `n_lines`
	  },
	})
      end,
    },
  },
  install = { colorscheme = { "default" } },
  checker = { enabled = true },
})
