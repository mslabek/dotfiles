local add = MiniDeps.add

add({
	source = "nvim-treesitter/nvim-treesitter",
	hooks = {
		post_checkout = function()
			vim.cmd("TSUpdate")
		end,
	},
})
require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = { enable = true },
})
