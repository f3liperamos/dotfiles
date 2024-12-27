return {
	{
		enabled = false, -- Temporary until revamp
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		event = "VeryLazy",
		opts = {
			ensure_installed = { "node2", "chrome" },
			handlers = {},
		},
	},
	{
		enabled = false, -- Temporary until revamp
		"rcarriga/nvim-dap-ui",
		dependencies = { "rcarriga/nvim-dap-ui" },
		event = "VeryLazy",
		opts = {
			controls = { element = "repl", enabled = false },
		},
		keys = {
			{
				"<Leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle nvim-dap-ui",
			},
		},
	},
	{
		enabled = false, -- Temporary until revamp
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
		opts = {},
	},
}
