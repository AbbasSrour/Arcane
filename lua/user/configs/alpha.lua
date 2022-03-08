local M = {}

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local kind = require("user.lsp_kind")
local header = {
	type = "text",
	val = require("user.core.banners").dashboard(),
	opts = {
		position = "center",
		hl = "Comment",
	},
}
local plugins = ""
local date = ""
if vim.fn.has("linux") == 1 or vim.fn.has("mac") == 1 then
	local handle = io.popen(
		'fd -d 2 . $HOME"/.local/share/nvim/site/pack/packer/" | grep pack | head -n -2 | wc -l | tr -d "\n" '
	)
	plugins = handle:read("*a")
	handle:close()

	local thingy = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
	date = thingy:read("*a")
	thingy:close()
	plugins = plugins:gsub("^%s*(.-)%s*$", "%1")
else
	plugins = "N/A"
	date = "  whatever "
end

local plugin_count = {
	type = "text",
	val = "└─ " .. kind.cmp_kind.Module .. " " .. plugins .. " plugins in total ─┘",
	opts = {
		position = "center",
		hl = "String",
	},
}

local heading = {
	type = "text",
	val = "┌─ " .. kind.icons.calendar .. " Today is " .. date .. " ─┐",
	opts = {
		position = "center",
		hl = "String",
	},
}

local fortune = require("alpha.fortune")()
-- fortune = fortune:gsub("^%s+", ""):gsub("%s+$", "")
local footer = {
	type = "text",
	val = fortune,
	opts = {
		position = "center",
		hl = "Comment",
		hl_shortcut = "Comment",
	},
}

local function button(sc, txt, keybind)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		text = txt,
		shortcut = sc,
		cursor = 5,
		width = 24,
		align_shortcut = "right",
		hl_shortcut = "Number",
		hl = "Function",
	}
	if keybind then
		opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
	end

	return {
		type = "button",
		val = txt,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
			vim.api.nvim_feedkeys(key, "normal", false)
		end,
		opts = opts,
	}
end

local buttons = {
	type = "group",
	val = {
		button("e", " " .. kind.cmp_kind.File .. " New file", ":ene <BAR> startinsert <CR>"),
		button("f", " " .. kind.cmp_kind.Folder .. " Explore", ":Telescope find_files<CR>"),
		button("p", " " .. kind.nvim_tree_icons.folder.default .. "  Projects", ":Telescope projects<CR>"),
		button("s", " " .. kind.icons.magic .. " Restore", ":lua require('persistence').load()<cr>"),
		button("r", " " .. kind.icons.clock .. " Recents", ":Telescope oldfiles<CR>"),
		button("g", " " .. kind.icons.git .. " Git Status", "<cmd>lua _LAZYGIT_TOGGLE()<CR>"),
		button("c", " " .. kind.icons.settings .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
		button("q", " " .. kind.icons.quit .. " Quit", ":qa<CR>"),
	},
	opts = {
		spacing = 1,
	},
}

local section = {
	header = header,
	buttons = buttons,
	plugin_count = plugin_count,
	heading = heading,
	footer = footer,
}

local opts = {
	layout = {
		{ type = "padding", val = 1 },
		section.header,
		{ type = "padding", val = 2 },
		section.heading,
		section.plugin_count,
		{ type = "padding", val = 1 },
		section.buttons,
		section.footer,
	},
	opts = {
		margin = 5,
	},
}
alpha.setup(opts)

return M
