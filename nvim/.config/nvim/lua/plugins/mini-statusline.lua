local add = MiniDeps.add

add("nvim-mini/mini.statusline")

local clue = require("mini.statusline")

clue.setup({
    content = {
        active = nil,
        inactive = nil,
    },
    use_icons = true,
})
