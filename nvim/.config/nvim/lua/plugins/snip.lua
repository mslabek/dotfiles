local add = MiniDeps.add

add({
	source = "L3MON4D3/LuaSnip",
	checkout = "v2.4.1",
	hooks = {
		post_checkout = function()
			vim.fn.system({ "make", "install_jsregexp" })
		end,
	},
})

local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-H>", function()
	ls.jump(-1)
end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.expand("~/.config/snippets") } })

