local add = MiniDeps.add

add({
	source = "mfussenegger/nvim-dap",
	depends = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python",

	},
})

local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<F1>", dap.continue, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F2>", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<F5>", dap.step_back, { desc = "Debug: Step Back" })
vim.keymap.set("n", "<F13>", dap.restart, { desc = "Debug: Restart" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, { desc = "Debug: Run To Cursor" })

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

dapui.setup({})


--- TODO: fix python dap
require('dap-python').setup("uv")

--- Scala config ---
dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

