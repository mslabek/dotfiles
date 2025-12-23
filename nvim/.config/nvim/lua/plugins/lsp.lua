local add = MiniDeps.add

-- mason setup
add("mason-org/mason.nvim")

require("mason").setup({})

add({ source = "neovim/nvim-lspconfig", depends = { "saghen/blink.cmp" } })

vim.lsp.config["bash-language-server"] = {
	name = "bash-languge-server",
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh" },
}

local lsp_servers = { "lua_ls", "bashls" }

--- TODO: migrate keybinds into autocmd on LspAttach
local on_attach = function(client, bufnr)
	local map = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc })
	end

	-- Navigation
	map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
	map("n", "gr", vim.lsp.buf.references, "Go to References")
	map("n", "gI", vim.lsp.buf.implementation, "Go to Implementation")
	map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")

	-- Documentation & Help
	map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
	map("n", "sh", vim.lsp.buf.signature_help, "Signature Help")

	-- Actions
	map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")

	-- Diagnostics
	map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
	map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
	map("n", "<leader>e", vim.diagnostic.open_float, "Show Diagnostic Error")
end

local blink_capabilities = require("blink.cmp").get_lsp_capabilities()

for _, lsp in ipairs(lsp_servers) do
	vim.lsp.config[lsp] = {
		on_attach = on_attach,
		capabilities = blink_capabilities,
	}
end

vim.lsp.enable(lsp_servers)

--- Metals setup
add({
	source = "scalameta/nvim-metals",
	depends = {
		"saghen/blink.cmp",
	},
})

local metals_config = require("metals").bare_config()
metals_config.capabilities = blink_capabilities
metals_config.on_attach = on_attach

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt" },
	callback = function()
		print("Configuring metals...")
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})

--- Java LS Setup
add({
	source = "nvim-java/nvim-java",
    depends = { "JavaHello/spring-boot.nvim", "MunifTanjim/nui.nvim", "mfussenegger/nvim-dap" }
})

require('java').setup({})
vim.lsp.enable('jdtls')

local jdtls_group = vim.api.nvim_create_augroup("jdtls_lsp", {})
vim.lsp.config.jdtls = {
    on_attach = on_attach
}
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "java" },
	group = jdtls_group,
	callback = function()
		require("config.jdtls").setup_jdtls()

	end,
})
