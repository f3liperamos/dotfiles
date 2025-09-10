return {
	"folke/which-key.nvim",
	opts = {
		preset = "helix",
		-- TODO: Workaround till https://github.com/folke/which-key.nvim/issues/967
		show_help = false,
	},
	config = function(_, opts)
		require("which-key").setup(opts)
		require("which-key").add({
			{ "<Leader>b", desc = "[b]uffers", hidden = true },
			{ "<Leader>c", desc = "[c]ode", hidden = true },
			{ "<Leader>d", desc = "[d]ocument", hidden = true },
			{ "<Leader>r", desc = "[r]ename", hidden = true },
			{ "<Leader>s", desc = "[s]earch", hidden = true },
			{ "<Leader>w", desc = "[w]orkspace", hidden = true },
		})
	end,
}
