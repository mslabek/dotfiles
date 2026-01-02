local add = MiniDeps.add

add("nvim-mini/mini.files")

local files = require("mini.files")

files.setup({
	-- Customization of shown content
	content = {
		-- Predicate for which file system entries to show
		filter = nil,
		-- Highlight group to use for a file system entry
		highlight = nil,
		-- Prefix text and highlight to show to the left of file system entry
		prefix = nil,
		-- Order in which to show file system entries
		sort = nil,
	},

	-- Module mappings created only inside explorer.
	-- Use `''` (empty string) to not create one.
	mappings = {
		close = "q",
		go_in = "l",
		go_in_plus = "L",
		go_out = "h",
		go_out_plus = "H",
		mark_goto = "'",
		mark_set = "m",
		reset = "<BS>",
		reveal_cwd = "@",
		show_help = "g?",
		synchronize = "=",
		trim_left = "<",
		trim_right = ">",
	},

	-- General options
	options = {
		-- Whether to delete permanently or move into module-specific trash
		permanent_delete = true,
		-- Whether to use for editing directories
		use_as_default_explorer = true,
	},

	-- Customization of explorer windows
	windows = {
		-- Maximum number of windows to show side by side
		max_number = math.huge,
		-- Whether to show preview of file/directory under cursor
		preview = false,
		-- Width of focused window
		width_focus = 50,
		-- Width of non-focused window
		width_nofocus = 15,
		-- Width of preview window
		width_preview = 25,
	},
})

vim.keymap.set("n", "<leader>e", function()
	files.open()
end, { desc = "Explore files" })

--- Copied from LazyVim
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesActionRename",
	callback = function(event)
		local from = event.data.from
		local to = event.data.to
		local lsp_clients = vim.lsp.get_clients()

		for _, client in ipairs(lsp_clients) do
			print(
				string.format(
					"LSP: %s | id=%d | supports rename=%s",
					client.name,
					client.id,
					vim.inspect(
						client.server_capabilities.workspace and client.server_capabilities.workspace.fileOperations
					)
				)
			)
		end
		for _, client in ipairs(lsp_clients) do
			if client.supports_method("workspace/willRenameFiles") then
				local resp = client.request_sync("workspace/willRenameFiles", {
					files = {
						{
							oldUri = vim.uri_from_fname(from),
							newUri = vim.uri_from_fname(to),
						},
					},
				}, 1000, 0)
				if resp and resp.result ~= nil then
					vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding)
				end
			end
		end
	end,
})
