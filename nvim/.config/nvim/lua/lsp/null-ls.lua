local dependencies = { "null-ls" }
local status_ok, deps = require("util.protected-require")(
	dependencies,
	"Failed to start null-ls.lua"
)
if not status_ok then
	return
end

local null_ls = unpack(deps)

local formatting = null_ls.builtins.formatting
null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.eslint_d,
		formatting.prettierd,
	},
})
