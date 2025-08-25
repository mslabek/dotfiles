local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add({source = 'folke/which-key.nvim'})
end)
