local add, now = MiniDeps.add, MiniDeps.now

--- TODO: migrate to main branch - treesitter 1.0
add({
	source = "nvim-treesitter/nvim-treesitter",
    checkout = 'master',
	hooks = {
		post_checkout = function()
			vim.cmd("TSUpdate")
		end,
	},
})
add("nvim-treesitter/nvim-treesitter-textobjects")

require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "markdown", "yaml", "scala", "java", "python" },
	auto_install = true,
	highlight = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
			},
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			include_surrounding_whitespace = true,
		},
	},
})
