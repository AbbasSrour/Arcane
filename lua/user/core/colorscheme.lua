local M = {}
local time = os.date("*t")

M.setup = function()
	-- 12AM -> 7AM
	if time.hour >= 0 and time.hour < 7 then
		require("user.core.colorscheme").onedark()
		vim.cmd([[
	try
	  colorscheme onedark
	  set background=dark
	catch /^Vim\%((\a\+)\)\=:E185/
	  colorscheme default
	  set background=dark
	endtry
	]])
	end

	-- 7AM -> 1PM
	if time.hour >= 7 and time.hour < 13 then
		require("user.core.colorscheme").rose_pine()
		vim.cmd([[
	try
	  colorscheme rose-pine
	  set background=light
	catch /^Vim\%((\a\+)\)\=:E185/
	  colorscheme default
	  set background=light
	endtry
	]])
	end

	-- 1PM -> 8PM
	if time.hour >= 13 and time.hour < 23 then
		require("user.core.colorscheme").tokyonight()
		vim.cmd([[
	try
	  colorscheme tokyonight
	  set background=dark
	catch /^Vim\%((\a\+)\)\=:E185/
	  colorscheme default
	  set background=dark
	endtry
	]])
	end

	-- 8PM -> 11:59PM
	if time.hour >= 23 then
		require("user.core.colorscheme").onedark()
		vim.cmd([[
	try
	  colorscheme onedark
	  set background=dark
	catch /^Vim\%((\a\+)\)\=:E185/
	  colorscheme default
	  set background=dark
	endtry
	]])
	end
end

M.tokyonight = function()
	vim.g.tokyonight_style = "storm"
	vim.g.tokyonight_cterm_colors = false
	vim.g.tokyonight_terminal_colors = true
	vim.g.tokyonight_hide_inactive_statusline = true
	vim.g.tokyonight_dark_sidebar = true
	vim.g.tokyonight_dark_float = true
	vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
	vim.g.tokyonight_sidebars = {
		"qf",
		"vista_kind",
		"terminal",
		"packer",
		"spectre_panel",
		"NeogitStatus",
		"help",
	}
	vim.g.tokyonight_italic_comments = true
	vim.g.tokyonight_italic_keywords = true
	vim.g.tokyonight_italic_functions = false
	vim.g.tokyonight_italic_variables = false
end

M.rose_pine = function()
	require("rose-pine").setup({
		dark_variant = "moon",
		bold_vert_split = false,
		dim_nc_background = false,
		disable_background = false,
		disable_float_background = false,
		disable_italics = false,
		---@usage string hex value or named color from rosepinetheme.com/palette
		groups = {
			border = "highlight_med",
			comment = "muted",
			link = "iris",
			punctuation = "subtle",

			error = "love",
			hint = "iris",
			info = "foam",
			warn = "gold",

			headings = {
				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
			-- or set all headings at once
			-- headings = 'subtle'
		},
	})
end

M.onedark = function()
	require("onedark").setup({
		-- Main options --
		style = "cool", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent = false, -- Show/hide background
		term_colors = true, -- Change terminal color as per the selected theme style
		ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
		-- toggle theme style ---
		-- toggle_style_key = "<leader>ts", -- Default keybinding to toggle
		-- toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

		-- Change code style ---
		-- Options are italic, bold, underline, none
		-- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
		code_style = {
			comments = "italic",
			keywords = "italic",
			functions = "none",
			strings = "none",
			variables = "none",
		},

		-- Custom Highlights --
		colors = {}, -- Override default colors
		highlights = {}, -- Override highlight groups

		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = true, -- use background color for virtual text
		},
	})
end

M.colors = {
	tokyonight_colors = {
		none = "NONE",
		bg_dark = "#1f2335",
		bg_alt = "#1f2335",
		bg = "#1a1b26",
		bg_br = "#292e42",
		terminal_black = "#414868",
		fg = "#c0caf5",
		fg_dark = "#a9b1d6",
		fg_gutter = "#3b4261",
		dark3 = "#545c7e",
		comment = "#565f89",
		dark5 = "#737aa2",
		blue0 = "#3d59a1",
		blue = "#7aa2f7",
		cyan = "#7dcfff",
		blue1 = "#2ac3de",
		blue2 = "#0db9d7",
		blue5 = "#89ddff",
		blue6 = "#B4F9F8",
		blue7 = "#394b70",
		violet = "#bb9af7",
		magenta = "#bb9af7",
		magenta2 = "#ff007c",
		purple = "#9d7cd8",
		orange = "#ff9e64",
		yellow = "#e0af68",
		green = "#9ece6a",
		green1 = "#73daca",
		green2 = "#41a6b5",
		teal = "#1abc9c",
		red = "#f7768e",
		red1 = "#db4b4b",
		-- git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
		git = { change = "#6183bb", add = "#449dab", delete = "#f7768e", conflict = "#bb7a61" },
		gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" },
	},

	rose_pine_colors = {
		moon = {
			none = "NONE",
			bg = "#1f1d2e",
			fg = "#e0def4",
			fg_gutter = "#3b4261",
			black = "#393b44",
			gray = "#2a2e36",
			red = "#eb6f92",
			green = "#97c374",
			yellow = "#f6c177",
			blue = "#9ccfd8",
			magenta = "#c4a7e7",
			cyan = "#9ccfd8",
			white = "#dfdfe0",
			orange = "#ea9a97",
			pink = "#D67AD2",
			black_br = "#7f8c98",
			red_br = "#e06c75",
			green_br = "#58cd8b",
			yellow_br = "#FFE37E",
			bg_br = "#393552",
			blue_br = "#84CEE4",
			violet = "#B8A1E3",
			cyan_br = "#59F0FF",
			white_br = "#FDEBC3",
			orange_br = "#F6A878",
			pink_br = "#DF97DB",
			comment = "#526175",
			bg_alt = "#232136",
			git = {
				add = "#84Cee4",
				change = "#c4a7e7",
				delete = "#eb6f92",
				conflict = "#f6c177",
			},
		},
		dawn = {
			base = "#faf4ed",
			surface = "#fffaf3",
			overlay = "#f2e9e1",
			muted = "#9893a5",
			subtle = "#797593",
			text = "#575279",
			love = "#b4637a",
			gold = "#ea9d34",
			rose = "#d7827e",
			pine = "#286983",
			foam = "#56949f",
			iris = "#907aa9",
			highlight_low = "#f4ede8",
			highlight_med = "#dfdad9",
			highlight_high = "#cecacd",
			opacity = 0.05,
			none = "NONE",
		},
	},
}

-- M.current_colors = function()
-- 	local colors = M.colors.tokyonight_colors
-- 	-- local time = os.date("*t")
-- 	if time.hour >= 1 and time.hour < 9 then
-- 		colors = M.colors.rose_pine_colors
-- 	elseif time.hour >= 9 and time.hour < 17 then
-- 		colors = M.colors.tokyonight_colors
-- 	elseif time.hour >= 17 and time.hour < 21 then
-- 		colors = M.colors.catppuccin_colors
-- 	elseif (time.hour >= 21 and time.hour < 24) or (time.hour >= 0 and time.hour < 1) then
-- 		colors = M.colors.kanagawa_colors
-- 	end
-- 	return colors
-- end

-- M.bg = function(group, col)
-- 	vim.cmd("hi " .. group .. " guibg=" .. col)
-- end

-- M.fg_bg = function(group, fgcol, bgcol)
-- 	vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
-- end
return M
