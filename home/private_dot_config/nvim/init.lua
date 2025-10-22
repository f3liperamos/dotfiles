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


-- stylua: ignore start
-- ============================================================================
-- ============================== Options =====================================
-- ============================================================================

-- General ====================================================================
vim.g.mapleader = " "                          -- Use `<Space>` as <Leader> key
vim.g.maplocalleader = " "                     -- Use `<Space>` as <Leader> key
vim.o.mouse = "a"                              -- Enable mouse
vim.o.mousescroll = "ver:25,hor:6"             -- Customize mouse scroll
vim.o.switchbuf = "usetab"                     -- Use already opened buffers when switching
vim.o.undofile = true                          -- Enable persistent undo
vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit ShaDa file (for startup)

-- Enable all filetype plugins and syntax (if not enabled, for better startup)
vim.cmd("filetype plugin indent on")
if vim.fn.exists("syntax_on") ~= 1 then
	vim.cmd("syntax enable")
end

-- UI =========================================================================
vim.o.background = "dark"                 -- Adjusts default color groups for that background
vim.o.breakindent = true                  -- Every wrapped line will continue visually indented
vim.o.breakindentopt = "list:-1"          -- Add padding for lists (if 'wrap' is set)
vim.o.colorcolumn = "+1"                  -- Draw column on the right of maximum width
vim.o.cursorline = true                   -- Highlights the line where cursor is
vim.o.cursorlineopt = "screenline,number" -- Show cursor line per screen line
vim.o.inccommand = "split"                -- Shows the effects of :substitute as you type
vim.o.linebreak = true                    -- Wrap lines at 'breakat' (if 'wrap' is set)
vim.o.list = true                         -- Show special characters such as Tabs or Spaces
vim.o.number = true                       -- Show line numbers
vim.o.pumheight = 10                      -- Maximum number of items to show in the popup menu
vim.o.relativenumber = true               -- Use relative numbers
vim.o.scrolloff = 8                       -- Number of screen lines to keep above and below the cursor
vim.o.shortmess = "CFOSWaco"              -- :h shortmess
vim.o.signcolumn = "yes"                  -- Always show signcolumn to reduce flicker
vim.o.splitbelow = true                   -- Horizontal splits will be below
vim.o.splitkeep = "screen"                -- Reduce scroll during window split
vim.o.splitright = true                   -- Vertical splits will be to the right
vim.o.winborder = "single"                -- Use border in floating windows
vim.o.wrap = false                        -- Don't visually wrap lines (toggle with \w)

-- Define how special characters must be shown
vim.o.fillchars = "eob: ,fold:╌"
vim.o.listchars = "extends:…,nbsp:␣,precedes:…,tab:> "

-- Folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
vim.o.foldlevel = 10        -- Fold nothing by default; set to 0 or 1 to fold
vim.o.foldmethod = "indent" -- Fold based on indent level
vim.o.foldnestmax = 10      -- Limit number of fold levels
vim.o.foldtext = ""         -- Show text under fold with its highlighting

-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main?tab=readme-ov-file#folds
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Editing ====================================================================
vim.o.autoindent = true        -- Use auto indent
vim.o.formatoptions = "rqnl1j" -- Improve comment editing
vim.o.ignorecase = true        -- Ignore case during search
vim.o.incsearch = true         -- Show search matches while typing
vim.o.infercase = true         -- Infer case in built-in completion
vim.o.shiftwidth = 2           -- Use this number of spaces for indentation
vim.o.smartindent = true       -- Make indenting smart
vim.o.spelloptions = "camel"   -- Treat camelCase word parts as separate words
vim.o.tabstop = 4              -- Use this number to represent how tabs will show up
vim.o.timeoutlen = 300         -- Time in milliseconds to wait for a mapped sequence to complete.
vim.o.updatetime = 300         -- If this many milliseconds nothing is typed swap file is writen or CursorHold event is executed
vim.o.virtualedit = "block"    -- Allow going past end of line in blockwise mode

-- NOTE: Do I want that? I might actually want to _ and - to be treated as words
vim.o.iskeyword = "@,48-57,_,192-255,-" -- Treat dash as `word` textobject part

-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Built-in completion
vim.o.complete = ".,w,b,kspell"                     -- Use less sources
vim.o.completeopt = "menuone,noselect,fuzzy,nosort" -- Use custom behavior

-- Autocommands ===============================================================

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
-- stylua: ignore end

-- ============================================================================
-- ============================== Keymaps =====================================
-- ============================================================================

-- General mappings ===========================================================

local map = function(mode, lhs, rhs, desc)
	-- See `:h vim.keymap.set()`
	vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

local map_leader = function(mode, suffix, rhs, desc)
	vim.keymap.set(mode, "<Leader>" .. suffix, rhs, { desc = desc })
end

map("n", "<C-h>", "<C-w>h", "Go to the left window")
map("n", "<C-j>", "<C-w>j", "Go to the down window")
map("n", "<C-k>", "<C-w>k", "Go to the up window")
map("n", "<C-l>", "<C-w>l", "Go to the right window")

map("i", "jk", "<Esc>", "Exit insert mode")
map("i", "kj", "<Esc>", "Exit insert mode")

map("v", "<", "<gv", "Indent left without exiting visual mode")
map("v", ">", ">gv", "Indent right without exiting visual mode")

map("v", "<C-c>", '"*y', 'Copy selection to "* register')
map("v", "p", '"_dP', "Replace selection without yanking")

map("n", "<C-u>", "<C-u>zz", "Scroll down and centralize screen")
map("n", "<C-d>", "<C-d>zz", "Scroll up and centralize screen")
map("n", "n", "nzz", "Go to next search result and centralize screen")
map("n", "N", "Nzz", "Go to previous search result and centralize screen")

map("n", "<Esc>", "<Cmd>nohlsearch<CR>", "<Esc> clears highlights when in normal mode")
map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Buffer mappings ============================================================
map_leader("n", "ba", "<Cmd>b#<CR>", "Go to previous buffer")
map_leader("n", "bd", "<Cmd>bd<CR>", "Delete buffer")

local new_scratch_buffer = function()
	vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))
end
map_leader("n", "bs", new_scratch_buffer, "Create scratch buffer")

-- Explore mappings ===========================================================

map_leader("n", "ed", "<Cmd>Oil<CR>", "Open parent directory (Oil)")
map_leader("n", "ef", "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", "Open file tree (MiniFiles)")
map_leader("n", "en", "<Cmd>lua MiniNotify.show_history()<CR>", "Show notifications")

-- Fuzzy mappings =============================================================
map_leader("n", "f.", "<Cmd>FzfLua oldfiles<CR>", "Recent files")
map_leader("n", "f/", "<Cmd>FzfLua search_history<CR>", "Search history")
map_leader("n", "f:", "<Cmd>FzfLua command_history<CR>", "Command history")
map_leader("n", "fF", "<Cmd>FzfLua lsp_finder<CR>", "LSP: Finder")
map_leader("n", "fR", "<Cmd>FzfLua lsp_references<CR>", "LSP: References")
map_leader("n", "fS", "<Cmd>FzfLua lsp_workspace_symbols<CR>", "LSP: Workspace symbols")
map_leader("n", "fb", "<Cmd>FzfLua buffers<CR>", "Buffers")
map_leader("n", "fd", "<Cmd>FzfLua diagnostics_document<CR>", "Diagnostic buffer")
map_leader("n", "ff", "<Cmd>FzfLua files<CR>", "Files")
map_leader("n", "fg", "<Cmd>FzfLua live_grep<CR>", "Live Grep")
map_leader("n", "fk", "<Cmd>FzfLua keymaps<CR>", "List keymaps")
map_leader("n", "fr", "<Cmd>FzfLua resume<CR>", "Resume last fuzzy search")
map_leader("n", "fs", "<Cmd>FzfLua builtin<CR>", "Builtins")
map_leader("n", "fs", "<Cmd>FzfLua lsp_document_symbols<CR>", "LSP: Document symbols")
map_leader("n", "fw", "<Cmd>FzfLua grep_cword<CR>", "Word at the cursor")
map_leader("v", "fw", "<Cmd>FzfLua grep_visual<CR>", "Search selected")

-- TODO: Test those in a git repo
-- FzfLua git_hunks (scopes: added, modified, all, buffer)

-- Git mappings ===============================================================
map_leader("n", "gg", "<Cmd>0G<CR>", "Open fugitive")
map_leader("n", "go", "<Cmd>lua MiniDiff.toggle_overlay()<CR>", "Toggle Overlay")

-- LSP Mappings ===============================================================
map_leader("n", "lD", vim.lsp.buf.declaration, "Declaration")
map_leader("n", "lR", vim.lsp.buf.rename, "Rename")
map_leader("n", "la", vim.lsp.buf.code_action, "code action")
map_leader("n", "ld", vim.lsp.buf.definition, "Definition")
map_leader("n", "lh", vim.lsp.buf.hover, "Hover")
map_leader("n", "li", vim.lsp.buf.implementation, "Implementation")
map_leader("n", "lq", vim.diagnostic.setloclist, "Send diagnostic to quickfix")
map_leader("n", "lr", vim.lsp.buf.references, "References")
map_leader("n", "ls", vim.lsp.buf.document_symbol, "document symbols")
map_leader("n", "lt", vim.lsp.buf.type_definition, "Type definition")
map_leader({ "n", "x" }, "lf", "<Cmd>lua require('conform').format({lsp_fallback = true})<CR>", "Format")

-- Terminal Mappings ==========================================================
map_leader("n", "tT", "<Cmd>horizontal terminal<CR>", "Terminal (horizontal)")
map_leader("n", "tt", "<Cmd>vertical terminal<CR>", "Terminal (vertical)")

-- ============================================================================
-- ============================== Plugins =====================================
-- ============================================================================

require("lazy").setup({
	install = { colorscheme = { "default" } },
	checker = { enabled = true },
	spec = {
		-- Theme ==============================================================
		{
			"catppuccin/nvim",
			lazy = false,
			priority = 1000,
			branch = "main",
			name = "catppuccin",
			config = function()
				require("catppuccin").setup({ auto_integrations = true })
				vim.cmd.colorscheme("catppuccin")
			end,
		},

		-- Navigation =========================================================
		{ "stevearc/oil.nvim", opts = {}, lazy = false },

		{
			"ibhagwan/fzf-lua",
			opts = {
				winopts = {
					width = 0.95,
					height = 0.95,
					border = "single",
					preview = {
						layout = "vertical",
						vertical = "down:65%",
					},
				},
				keymap = {
					builtin = {
						["<C-d>"] = "preview-page-down",
						["<C-u>"] = "preview-page-up",
						["<Esc>"] = "hide",
						["<F1>"] = "toggle-help",
						["<F2>"] = "toggle-fullscreen",
					},
				},
			},
			config = function(_, opts)
				local fzf = require("fzf-lua")
				fzf.setup(opts)
				fzf.register_ui_select()
			end,
		},

		{
			"ggandor/leap.nvim",
			config = function()
				map({ "n", "x", "o" }, "s", "<Plug>(leap)")
				map("n", "S", "<Plug>(leap-from-window)")
				map({ "x", "o" }, "R", function()
					require("leap.treesitter").select({
						opts = require("leap.user").with_traversal_keys("R", "r"),
					})
				end)
			end,
		},

		-- LSP ================================================================
		{
			"nvim-treesitter/nvim-treesitter",
			branch = "main",
			build = ":TSUpdate",
			dependencies = {
				{ "neovim/nvim-lspconfig" },
				{ "mason-org/mason.nvim", opts = {} },
				{ "mason-org/mason-lspconfig.nvim" },
				{ "nvim-treesitter/nvim-treesitter-context" },
				{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
				{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			},
			opts = {
				---@type vim.diagnostic.Opts
				diagnostics = {
					signs = {
						priority = 9999, -- Show signs on top of any other sign, but only for warnings and errors
						severity = {
							min = "WARN",
							max = "ERROR",
						},
					},
					underline = {
						severity = {
							min = "HINT",
							max = "ERROR",
						},
					},
					virtual_lines = {
						current_line = false,
						severity = {
							min = "ERROR",
							max = "ERROR",
						},
					},
					virtual_text = {
						current_line = true,
						severity = {
							min = "HINT",
							max = "WARN",
						},
					},
					update_in_insert = false, -- Don't update diagnostics when typing
				},
				languages = {
					"bash",
					"css",
					"diff",
					"dockerfile",
					"git_rebase",
					"gitcommit",
					"graphql",
					"javascript",
					"jsdoc",
					"json",
					"json5",
					"jsonc",
					"latex",
					"lua",
					"markdown",
					"markdown_inline",
					"rust",
					"tsx",
					"typescript",
				},
				servers = {
					-- Linters / Formatters
					biome = {},
					eslint = {},
					eslint_d = {},
					prettier = {},
					prettierd = {},
					stylelint = {},
					stylua = {},
					kdlfmt = {},

					-- LSPs
					bashls = {},
					cssls = {},
					harper_ls = {},
					html = {},
					jsonls = {},
					lua_ls = {
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								workspace = {
									checkThirdParty = false,
									library = vim.api.nvim_get_runtime_file("", true),
								},
								telemetry = { enable = false },
							},
						},
					},
					rust_analyzer = {},
					vtsls = {},
				},
			},
			config = function(_, opts)
				local isnt_installed = function(lang)
					return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
				end

				local to_install = vim.tbl_filter(isnt_installed, opts.languages)
				if #to_install > 0 then
					require("nvim-treesitter").install(to_install)
				end

				-- Enable tree-sitter after opening a file for a target language
				local filetypes = {}
				for _, lang in ipairs(opts.languages) do
					for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
						table.insert(filetypes, ft)
					end
				end

				vim.api.nvim_create_autocmd("FileType", {
					desc = "Start treesitter",
					group = vim.api.nvim_create_augroup("StartTreesitter", { clear = true }),
					pattern = filetypes,
					callback = function(ev)
						vim.treesitter.start(ev.buf)
					end,
				})

				vim.api.nvim_create_autocmd("LspAttach", {
					group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
					callback = function(event)
						local client = vim.lsp.get_client_by_id(event.data.client_id)
						if
							client
							and client:supports_method(
								vim.lsp.protocol.Methods.textDocument_documentHighlight,
								event.buf
							)
						then
							local highlight_augroup =
								vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
							vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.document_highlight,
							})

							vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.clear_references,
							})

							vim.api.nvim_create_autocmd("LspDetach", {
								group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
								callback = function(event2)
									vim.lsp.buf.clear_references()
									vim.api.nvim_clear_autocmds({
										group = "kickstart-lsp-highlight",
										buffer = event2.buf,
									})
								end,
							})
						end
					end,
				})

				local ensure_installed = vim.tbl_keys(opts.servers or {})
				require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
				require("mason-lspconfig").setup({ automatic_enable = ensure_installed })
				for server_name, config in pairs(opts.servers) do
					vim.lsp.config(server_name, config)
				end

				vim.diagnostic.config(opts.diagnostics)
			end,
		},

		-- Completion
		{
			"saghen/blink.cmp",
			dependencies = { "rafamadriz/friendly-snippets" },
			version = "1.*",
			---@module 'blink.cmp'
			---@type blink.cmp.Config
			opts = {
				keymap = { preset = "default" },
				appearance = {
					nerd_font_variant = "mono",
					kind_icons = {
						Text = "",
						Method = "󰆧",
						Function = "󰊕",
						Constructor = "",
						Field = "󰅫",
						Variable = "󰂡",
						Class = "󰠱",
						Interface = "",
						Module = "",
						Property = "󰜢",
						Unit = "",
						Value = "󰎠",
						Enum = "",
						Keyword = "󰌋",
						Snippet = "",
						Color = "󰏘",
						File = "󰈙",
						Reference = "",
						Folder = "󰉋",
						EnumMember = "",
						Constant = "",
						Struct = "",
						Event = "",
						Operator = "󰆕",
						TypeParameter = "󰅲",
					},
				},
				completion = {
					menu = {
						draw = {
							columns = {
								{ "label", "label_description" },
								{ "kind_icon", "kind", gap = 1 },
								{ "source_name" },
							},
						},
					},
					documentation = { auto_show = true },
				},
				signature = {
					enabled = true,
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
				fuzzy = { implementation = "prefer_rust_with_warning" },
				cmdline = {
					enabled = true,
					keymap = { preset = "cmdline" },
					completion = {
						list = {
							selection = {
								preselect = true,
								auto_insert = true,
							},
						},
						menu = { auto_show = true },
						ghost_text = { enabled = false },
					},
				},
			},
			opts_extend = { "sources.default" },
		},

		-- Editing ============================================================
		{
			"stevearc/conform.nvim",
			version = "9.*",
			opts = {
				format_on_save = false,
				formatters_by_ft = {
					css = { "biome", "eslint_d", "prettierd", stop_after_first = true },
					html = { "prettierd" },
					javascript = { "biome", "eslint_d", "prettierd", stop_after_first = true },
					less = { "stylelint" },
					lua = { "stylua" },
					markdown = { "prettierd" },
					rust = { "rustfmt" },
					sass = { "stylelint" },
					typescript = { "biome", "eslint_d", "prettierd", stop_after_first = true },
					typescriptreact = { "biome", "eslint_d", "prettierd", stop_after_first = true },
					kdl = { "kdlfmt" },
				},
			},
		},

		-- Mini.nvim ==========================================================
		{
			"nvim-mini/mini.nvim",
			version = false,
			config = function()
				require("mini.comment").setup()
				require("mini.diff").setup()
				require("mini.indentscope").setup()
				require("mini.jump").setup()
				require("mini.sessions").setup()
				require("mini.starter").setup()
				require("mini.files").setup()

				local MiniExtra = require("mini.extra")
				MiniExtra.setup()

				local hipatterns = require("mini.hipatterns")
				local hi_words = MiniExtra.gen_highlighter.words
				hipatterns.setup({
					highlighters = {
						fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
						hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
						todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
						note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),
						hex_color = hipatterns.gen_highlighter.hex_color(),
					},
				})

				local ai = require("mini.ai")
				ai.setup({
					custom_textobjects = {
						B = MiniExtra.gen_ai_spec.buffer(),
						F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
						o = ai.gen_spec.treesitter({
							a = { "@conditional.outer", "@loop.outer" },
							i = { "@conditional.inner", "@loop.inner" },
						}),
					},
				})

				local MiniIcons = require("mini.icons")
				MiniIcons.setup()
				MiniIcons.mock_nvim_web_devicons()

				local MiniNotify = require("mini.notify")
				MiniNotify.setup()
				vim.notify = MiniNotify.make_notify()

				local MiniStatusline = require("mini.statusline")
				MiniStatusline.setup()
				MiniStatusline.section_location = function()
					return "%2l:%-2v"
				end

				-- TODO: Review surround shortcuts
				require("mini.surround").setup({
					mappings = {
						add = "<Leader>sa", -- Add surrounding in Normal and Visual modes
						delete = "<Leader>sd", -- Delete surrounding
						find = "<Leader>sf", -- Find surrounding (to the right)
						find_left = "<Leader>sF", -- Find surrounding (to the left)
						highlight = "<Leader>sh", -- Highlight surrounding
						replace = "<Leader>sr", -- Replace surrounding
						update_n_lines = "<Leader>sn", -- Update `n_lines`
					},
				})

				local MiniClue = require("mini.clue")
				MiniClue.setup({
					clues = {
						-- Group descriptions
						{ mode = "n", keys = "<Leader>b", desc = "+Buffer" },
						{ mode = "n", keys = "<Leader>e", desc = "+Explore" },
						{ mode = "n", keys = "<Leader>f", desc = "+Find" },
						{ mode = "n", keys = "<Leader>g", desc = "+Git" },
						{ mode = "n", keys = "<Leader>l", desc = "+Language" },
						{ mode = "n", keys = "<Leader>t", desc = "+Terminal" },
						{ mode = "x", keys = "<Leader>g", desc = "+Git" },
						{ mode = "x", keys = "<Leader>l", desc = "+Language" },
						{ mode = "n", keys = "<Leader>s", desc = "+Surround" },
						{ mode = "x", keys = "<Leader>s", desc = "+Surround" },
						MiniClue.gen_clues.builtin_completion(),
						MiniClue.gen_clues.g(),
						MiniClue.gen_clues.marks(),
						MiniClue.gen_clues.registers(),
						MiniClue.gen_clues.windows(),
						MiniClue.gen_clues.z(),
					},
					triggers = {
						-- Leader triggers
						{ mode = "n", keys = "<Leader>" },
						{ mode = "x", keys = "<Leader>" },

						-- `[` and `]` keys
						{ mode = "n", keys = "[" },
						{ mode = "n", keys = "]" },

						-- Built-in completion
						{ mode = "i", keys = "<C-x>" },

						-- `g` key
						{ mode = "n", keys = "g" },
						{ mode = "x", keys = "g" },

						-- Marks
						{ mode = "n", keys = "'" },
						{ mode = "n", keys = "`" },
						{ mode = "x", keys = "'" },
						{ mode = "x", keys = "`" },

						-- Registers
						{ mode = "n", keys = '"' },
						{ mode = "x", keys = '"' },
						{ mode = "i", keys = "<C-r>" },
						{ mode = "c", keys = "<C-r>" },

						-- Window commands
						{ mode = "n", keys = "<C-w>" },

						-- `z` key
						{ mode = "n", keys = "z" },
						{ mode = "x", keys = "z" },
					},
				})
			end,
		},

		-- Extras =============================================================
		{ "tpope/vim-fugitive" },
		{ "m4xshen/hardtime.nvim", lazy = false, dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
	},
})
