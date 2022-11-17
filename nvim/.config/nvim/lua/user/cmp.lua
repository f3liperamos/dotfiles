-- ensure cmp and luasnip exists
local dependencies = { "cmp", "luasnip" }
local status_ok, deps = require("user.protected-require")(dependencies, "Failed to start cmp.lua")
if not status_ok then return end

local cmp, luasnip = unpack(deps)

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = ""
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				luasnip = "[LuaSnip]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[nvim_lua]",
			})[entry.source.name]
			return vim_item
		end
	},
	mapping = cmp.mapping.preset.insert({
		-- also testing ergonomics for k j item navigation
		["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
		["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	experimental = {
		ghost_text = false,
	},
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "cmdline" },
		{ name = "path" },
	},
})
