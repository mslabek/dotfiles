local add = MiniDeps.add

add({
	source = "saghen/blink.cmp",
	depends = { "L3MON4D3/LuaSnip" },
	checkout = "v1.8.0",
})

require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
		menu = {
			draw = {
				treesitter = { "lsp" },
			},
        },
	},
	sources = {
		default = { "snippets", "lsp", "path", "buffer" },
	},
	snippets = { preset = "luasnip" },
	fuzzy = { implementation = "prefer_rust" },
})
