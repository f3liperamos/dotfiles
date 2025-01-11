return {
	"saghen/blink.cmp",
	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },
		completion = {
			menu = {
				border = "solid",
				draw = {
					columns = {
						{ "label", "label_description" },
						{ "kind_icon", "kind", gap = 1 },
						{ "source_name" },
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				treesitter_highlighting = false,
				window = { border = "solid" },
			},
		},
		signature = {
			enabled = true,
			window = { border = "solid" },
		},
		sources = {
			default = { "lsp", "buffer", "path" },
		},
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
	},
	opts_extend = { "sources.default" },
}
