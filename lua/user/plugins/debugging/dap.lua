local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end
local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
	return
end

require("dapui").setup({
	-- icons = { expanded = "▾", collapsed = "▸" },
	-- mappings = {
	-- 	expand = { "<CR>", "<2-LeftMouse>" }, -- Use a table to apply multiple mappings
	-- 	open = "o",
	-- 	remove = "d",
	-- 	edit = "e",
	-- 	repl = "r",
	-- 	toggle = "t",
	-- },
	-- expand_lines = vim.fn.has("nvim-0.7"), -- Expand lines larger than the window
	-- sidebar = {
	-- 	-- You can change the order of elements in the sidebar
	-- 	elements = {
	-- 		-- Provide as ID strings or tables with "id" and "size" keys
	-- 		{
	-- 			id = "scopes",
	-- 			size = 0.25, -- Can be float or integer > 1
	-- 		},
	-- 		{ id = "breakpoints", size = 0.25 },
	-- 		{ id = "stacks", size = 0.25 },
	-- 		{ id = "watches", size = 00.25 },
	-- 	},
	-- 	size = 40,
	-- 	position = "left", -- Can be "left", "right", "top", "bottom"
	-- },
	-- tray = {
	-- 	elements = { "repl", "console" },
	-- 	size = 10,
	-- 	position = "bottom", -- Can be "left", "right", "top", "bottom"
	-- },
	-- floating = {
	-- 	max_height = nil, -- These can be integers or a float between 0 and 1.
	-- 	max_width = nil, -- Floats will be treated as percentage of your screen.
	-- 	border = "single", -- Border style. Can be "single", "double" or "rounded"
	-- 	mappings = {
	-- 		close = { "q", "<Esc>" },
	-- 	},
	-- },
	-- windows = { indent = 1 },
	-- render = {
	-- 	max_type_length = nil, -- Can be integer or nil.
	-- },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

------------------------------------- Language configurations -----------------------------------------
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { "/home/ares/Documents/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}
