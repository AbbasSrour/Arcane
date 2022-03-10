local M = {}

M.setup = function()
	local codeactions_status_ok, code_actions = pcall(require, "codeactions")
	if not codeactions_status_ok then
		return
	end
	vim.g.code_action_menu_show_details = false
	vim.g.code_action_menu_show_diff = true
end

return M
