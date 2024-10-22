return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
  },
  keys = function()
    return {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ position = "left", reveal = true, toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTre (cwd)",
      },
    }
  end,
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = true,
          never_show = {},
        },
      },
    })
  end,
}
