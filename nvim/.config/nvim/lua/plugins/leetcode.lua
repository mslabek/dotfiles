local add = MiniDeps.add

add({
  source = "kawre/leetcode.nvim",
  hooks = {
    post_install = function()
      vim.cmd("TSUpdate html")
    end,
  },
  depends = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
})


require("leetcode").setup({

})
