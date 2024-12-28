return {
	"folke/flash.nvim",
	opts = {
		modes = {
			search = {
				enabled = true,
			},
		},
	},
	keys = {
		{
			"<C-s>",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash: [Ctrl-s]tart jump",
		},
		{
			"S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash: Treesitter [S]cope select",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Flash: Execute [r]emote motion",
		},
	},
}
