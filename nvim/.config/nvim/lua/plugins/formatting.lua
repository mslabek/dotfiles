local add, now = MiniDeps.add, MiniDeps.now

add("stevearc/conform.nvim")

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
        python = { "black" },
        yaml = { "yamlfmt" },
        json = { "jq" },
	},
})

vim.keymap.set("n", "<leader>t", function()
	conform.format({ async = true, lsp_fallback = true })
end, { desc = "Format" })
