local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add({ source = 'catppuccin/nvim', name = 'catppuccin'})
  require('catppuccin').setup({
    flavour = 'macchiato',
    no_italic = true
  })
  vim.cmd.colorscheme "catppuccin"
end
)
