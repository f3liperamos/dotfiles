local home = vim.fn.expand("~/zettelkasten")
return {
	enabled = false,
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	opts = {
		-- Folders
		home = home,
		dailies = home .. "/" .. "daily",
		weeklies = home .. "/" .. "weekly",
		templates = home .. "/" .. "templates",
		image_subdir = "img",

		-- Templates
		template_handling = "smart",
		template_new_note = home .. "/" .. "templates/new_note.md",
		template_new_daily = home .. "/" .. "templates/daily.md",
		template_new_weekly = home .. "/" .. "templates/weekly.md",
	},
	keys = {
		{ "<leader>z", ":lua require('telekasten').panel()<CR>", desc = "Open panel [Telekasten]" },
		{ "<leader>zf", ":lua require('telekasten').find_notes()<CR>" },
		{ "<leader>zd", ":lua require('telekasten').find_daily_notes()<CR>" },
		{ "<leader>zg", ":lua require('telekasten').search_notes()<CR>" },
		{ "<leader>zz", ":lua require('telekasten').follow_link()<CR>", desc = "Follow link [Telekasten]" },
		{ "<leader>zt", ":lua require('telekasten').goto_today()<CR>", desc = "Go to Today notes [Telekasten]" },
		{ "<leader>zW", ":lua require('telekasten').goto_thisweek()<CR>", desc = "Go to Weekly Notes [Telekasten]" },
		{ "<leader>zw", ":lua require('telekasten').find_weekly_notesq()<CR>" },
		{ "<leader>zn", ":lua require('telekasten').new_note()<CR>", desc = "New note [Telekasten]" },
		{
			"<leader>zN",
			":lua require('telekasten').new_templated_note()<CR>",
			desc = "New templated note [Telekasten]",
		},
		{ "<leader>zy", ":lua require('telekasten').yank_notelink()<CR>" },
		{ "<leader>zx", ":lua require('telekasten').toggle_todo()<CR>", desc = "Toggle todo [Telekasten]" },
		{ "<leader>zb", ":lua require('telekasten').show_backlinks()<CR>", desc = "Show backlinks [Telekasten]" },
		{ "<leader>zF", ":lua require('telekasten').find_friends()<CR>" },
		{ "<leader>zI", ":lua require('telekasten').insert_img_link({ i=true })<CR>" },
		{ "<leader>zp", ":lua require('telekasten').preview_img()<CR>" }, -- Lacking img nvim/term plugin viewer
		{ "<leader>zm", ":lua require('telekasten').browse_media()<CR>" },
		{ "<leader>#", ":lua require('telekasten').show_tags()<CR>", desc = "Show tags [Telekasten]" },
		{ "<leader>zr", ":lua require('telekasten').rename_note()<CR>", desc = "Rename note [Telekasten]" },
	},
}
