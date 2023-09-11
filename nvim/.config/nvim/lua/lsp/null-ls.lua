local builtins = require("null-ls").builtins
require("null-ls").setup({
	sources = {
		builtins.code_actions.gitsigns,

		builtins.formatting.stylua,
		builtins.formatting.eslint_d,
		builtins.formatting.prettierd,
	},
})
