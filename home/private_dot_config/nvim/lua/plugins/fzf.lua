return {
	"ibhagwan/fzf-lua",
	opts = {
		winopts = {
			width = 0.95,
			height = 0.95,
			border = "single",
			preview = {
				layout = "vertical",
				vertical = "down:65%",
			},
		},
		keymap = {
			builtin = {
				["<C-d>"] = "preview-page-down",
				["<C-u>"] = "preview-page-up",
				["<Esc>"] = "hide",
				["<F1>"] = "toggle-help",
				["<F2>"] = "toggle-fullscreen",
			},
		},
	},
	config = function(_, opts)
		local fzf = require("fzf-lua")

		fzf.setup(opts)

		vim.keymap.set("n", "<Leader><Leader>", fzf.buffers, { desc = "[ ] find existing buffers" })
		vim.keymap.set("n", "<Leader>s.", fzf.oldfiles, { desc = "[s.]earch recent files" })
		vim.keymap.set("n", "<Leader>sf", fzf.files, { desc = "[s]earch [f]iles" })
		vim.keymap.set("n", "<Leader>sg", fzf.live_grep, { desc = "[s]earch by [g]rep" })
		vim.keymap.set("n", "<Leader>sh", fzf.helptags, { desc = "[s]earch [h]elp" })
		vim.keymap.set("n", "<Leader>sk", fzf.keymaps, { desc = "[s]earch [k]eymaps" })
		vim.keymap.set("n", "<Leader>sr", fzf.resume, { desc = "[s]earch [r]esume" })
		vim.keymap.set("n", "<Leader>ss", fzf.builtin, { desc = "[s]earch builtin[s]" })
		vim.keymap.set("n", "<Leader>sw", fzf.grep_cword, { desc = "[s]earch current [w]ord (normal mode)" })
		vim.keymap.set("v", "<Leader>sw", fzf.grep_visual, { desc = "[s]earch current [w]ord (visual mode)" })
		vim.keymap.set("n", "<leader>/", fzf.blines, { desc = "[/] fuzzy search in current buffer" })

		-- Open nvim configuration files
		vim.keymap.set("n", "<Leader>sn", function()
			fzf.files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[s]earch [n]eovim config" })
	end,
}
