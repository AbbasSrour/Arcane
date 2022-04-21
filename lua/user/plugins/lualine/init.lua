require("user.plugins.lualine.components")

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end
local NvimTreeExt = { sections = { lualine_a = { Components.NvimTree } }, filetypes = { "NvimTree" } }
local SymbolsOutlineExt = { sections = { lualine_z = { Components.SyOutline } }, filetypes = { "Outline" } }

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" }, --"NvimTree", "Outline"
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { Components.mainIcon },
		lualine_b = { Components.filetype, Components.filename },
		lualine_c = { Components.branch, Components.Github, Components.diff, Components.gps }, -- Components.fileformat, Components.signature,
		lualine_x = { Components.pkginfo, Components.diagnostics, Components.lsp, Components.treesitter },
		lualine_y = { Components.modeIcon, Components.mode },
		lualine_z = { Components.progressIcon, Components.progress }, --Components.scrollbar, Components.location
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { NvimTreeExt, SymbolsOutlineExt },
})
