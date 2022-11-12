local notify = require("user.notify")

-- ensure cmp and luasnip exists
local error_title = {title = "failed to start cmp.lua"}
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return notify("cmp not found", "error", error_title)
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return notify("luasnip not found", "error", error_title)
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({

		-- also testing ergonomics for k j item navigation
		["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
		["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
		
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
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
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
	experimental = {
		native_menu = false,
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