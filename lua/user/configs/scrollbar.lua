local minimap_status_ok, scrollbar = pcall(require, "scrollbar")
if not minimap_status_ok then
	return
end

local colors = require("tokyonight.colors").setup()
local time = os.date("*t")
local scrollbarColor
if time.hour < 13 then
	scrollbarColor = "white"
end
if time.hour >= 13 then
	scrollbarColor = colors.bg_highlight
end

scrollbar.setup({
	handle = {
		color = scrollbarColor,
	},
	marks = {
		Search = { color = colors.orange },
		Error = { color = colors.error },
		Warn = { color = colors.warning },
		Info = { color = colors.info },
		Hint = { color = colors.hint },
		Misc = { color = colors.purple },
	},
})

scrollbar.setup({
	show = true,
	handle = {
		text = " ",
		-- color = scrollbarColor,
		hide_if_all_visible = true, -- Hides handle if all lines are visible
	},
	marks = {
		Search = { text = { "-", "=" }, priority = 0, color = "orange" },
		Error = { text = { "-", "=" }, priority = 1, color = "red" },
		Warn = { text = { "-", "=" }, priority = 2, color = "yellow" },
		Info = { text = { "-", "=" }, priority = 3, color = "blue" },
		Hint = { text = { "-", "=" }, priority = 4, color = "green" },
		Misc = { text = { "-", "=" }, priority = 5, color = "purple" },
	},
	excluded_filetypes = {
		"",
		"prompt",
		"TelescopePrompt",
	},
	autocmd = {
		render = {
			"BufWinEnter",
			"TabEnter",
			"TermEnter",
			"WinEnter",
			"CmdwinLeave",
			"TextChanged",
			"VimResized",
			"WinScrolled",
		},
	},
	handlers = {
		diagnostic = true,
		search = false, -- Requires hlslens to be loaded
	},
})
