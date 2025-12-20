local add, now = MiniDeps.add, MiniDeps.now

add("ibhagwan/fzf-lua")

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>f", function()
    fzf.files()
end, { desc = "Find files" })
