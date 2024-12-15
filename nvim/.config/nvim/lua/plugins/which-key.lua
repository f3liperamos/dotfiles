return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		preset = 'helix'
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
