local add = MiniDeps.add

add({ source = "catppuccin/nvim", name = "catppuccin" })
require("catppuccin").setup({
	flavour = "macchiato",
	no_italic = true,
	integrations = { blink_cmp = true },
})
vim.cmd.colorscheme("catppuccin")
