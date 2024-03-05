return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		require("which-key").setup()
		require("which-key").register({
			["<Leader>c"] = { "[c]ode", _ = "which_key_ignore" },
			["<Leader>d"] = { "[d]ocument", _ = "which_key_ignore" },
			["<Leader>r"] = { "[r]ename", _ = "which_key_ignore" },
			["<Leader>s"] = { "[s]earch", _ = "which_key_ignore" },
			["<Leader>w"] = { "[w]orkspace", _ = "which_key_ignore" },
			["<Leader>b"] = { "[b]uffers", _ = "which_key_ignore" },
		})
	end,
}
