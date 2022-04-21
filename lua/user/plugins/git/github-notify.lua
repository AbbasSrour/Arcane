local status_ok, github_notify = pcall(require, "github-notifications")
if not status_ok then
	return
end

local kind = require("user.utils.kind")

github_notify.setup({
	icon = kind.git.github, -- Icon to be shown in statusline --
	hide_statusline_on_all_read = false,
	hide_entry_on_read = false, -- Whether to hide the Telescope entry after reading (buggy)
	debounce_duration = 60, -- Minimum time until next refresh
	cache = false, -- Opt in/out of caching
	sort_unread_first = true,
	mappings = {
		mark_read = "<CR>",
		hide = "d", -- remove from Telescope picker, but don't mark as read
		-- open_in_browser = 'o', (WIP)
	},
	prompt_mappings = {
		mark_all_read = "<C-r>",
	}, -- keymaps that apply on a Telescope prompt level (insert mode)
})
