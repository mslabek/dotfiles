local add = MiniDeps.add

-- mason setup
add('mason-org/mason.nvim')

require('mason').setup({

})

add("neovim/nvim-lspconfig")
vim.lsp.enable({
    'basedpyright'
})

--- Metals setup
add("scalameta/nvim-metals")

local metals_config = require("metals").bare_config()
metals_config.on_attach = function(client, bufnr)
  -- your on_attach function
end

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt" },
  callback = function()
    print("Configuring metals...")
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
