local M = {}
local time = os.date("*t")

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

		-- Options are italic, bold, underline, none, multiple style with comma seperated  keywords = 'italic,bold'
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

		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = true, -- use background color for virtual text
		},
	})
end

M.catppuccin = function()
	vim.g.catppuccin_flavor = "latte" -- latte, frappe, macchiato, mocha
	require("catppuccin").setup({
		transparent_background = false,
		term_colors = false,
		styles = {
			comments = "italic",
			conditionals = "italic",
			loops = "NONE",
			functions = "NONE",
			keywords = "NONE",
			strings = "NONE",
			variables = "NONE",
			numbers = "NONE",
			booleans = "NONE",
			properties = "NONE",
			types = "NONE",
			operators = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_trouble = false,
			cmp = true,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = {
				enabled = true,
				show_root = false,
				transparent_panel = false,
			},
			neotree = {
				enabled = false,
				show_root = false,
				transparent_panel = false,
			},
			which_key = false,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			dashboard = true,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = true,
			markdown = true,
			lightspeed = false,
			ts_rainbow = false,
			hop = false,
			notify = true,
			telekasten = true,
			symbols_outline = true,
		},
	})
end

M.color_palettes = {
	tokyonight = {
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
	rose_pine = {
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
			git = {
				add = "#84Cee4",
				change = "#c4a7e7",
				delete = "#eb6f92",
				conflict = "#f6c177",
			},
		},
	},
	onedark = {
		black = { "#181a1f", "#0e1013", "#151820", "#0c0e15", "#191a1c", "#101012", "#101012" },
		bg0 = { "#282c34", "#1f2329", "#242b38", "#1a212e", "#2c2d30", "#232326", "#fafafa" },
		bg1 = { "#31353f", "#282c34", "#2d3343", "#21283b", "#35373b", "#2c2d31", "#f0f0f0" },
		bg2 = { "#393f4a", "#30363f", "#343e4f", "#283347", "#3e4045", "#35363b", "#e6e6e6" },
		bg3 = { "#3b3f4c", "#323641", "#363c51", "#2a324a", "#404247", "#37383d", "#dcdcdc" },
		bg_d = { "#21252b", "#181b20", "#1e242e", "#141b24", "#242628", "#1b1c1e", "#c9c9c9" },
		bg_blue = { "#73b8f1", "#61afef", "#6db9f7", "#54b0fd", "#79b7eb", "#68aee8", "#68aee8" },
		bg_yellow = { "#ebd09c", "#e8c88c", "#f0d197", "#f2cc81", "#e6cfa1", "#e2c792", "#e2c792" },
		fg = { "#abb2bf", "#a0a8b7", "#a5b0c5", "#93a4c3", "#b1b4b9", "#a7aab0", "#383a42" },
		purple = { "#c678dd", "#bf68d9", "#ca72e4", "#c75ae8", "#c27fd7", "#bb70d2", "#a626a4" },
		green = { "#98c379", "#8ebd6b", "#97ca72", "#8bcd5b", "#99bc80", "#8fb573", "#50a14f" },
		orange = { "#d19a66", "#cc9057", "#d99a5e", "#dd9046", "#c99a6e", "#c49060", "#c18401" },
		blue = { "#61afef", "#4fa6ed", "#5ab0f6", "#41a7fc", "#68aee8", "#57a5e5", "#4078f2" },
		yellow = { "#e5c07b", "#e2b86b", "#ebc275", "#efbd5d", "#dfbe81", "#dbb671", "#986801" },
		cyan = { "#56b6c2", "#48b0bd", "#4dbdcb", "#34bfd0", "#5fafb9", "#51a8b3", "#0184bc" },
		red = { "#e86671", "#e55561", "#ef5f6b", "#f65866", "#e16d77", "#de5d68", "#e45649" },
		grey = { "#5c6370", "#535965", "#546178", "#455574", "#646568", "#5a5b5e", "#a0a1a7" },
		light_grey = { "#848b98", "#7a818e", "#7d899f", "#6c7d9c", "#8b8d91", "#818387", "#818387" },
		dark_cyan = { "#2b6f77", "#266269", "#25747d", "#1b6a73", "#316a71", "#2b5d63", "#2b5d63" },
		dark_red = { "#993939", "#8b3434", "#a13131", "#992525", "#914141", "#833b3b", "#833b3b" },
		dark_yellow = { "#93691d", "#835d1a", "#9a6b16", "#8f610d", "#8c6724", "#7c5c20", "#7c5c20" },
		dark_purple = { "#8a3fa0", "#7e3992", "#8f36a9", "#862aa1", "#854897", "#79428a", "#79428a" },
		git = {
			add = { "#31392b", "#272e23", "#303d27", "#27341c", "#32352f", "#282b26", "#282b26" },
			delete = { "#382b2c", "#2d2223", "#3c2729", "#331c1e", "#342f2f", "#2a2626", "#2a2626" },
			change = { "#1c3448", "#172a3a", "#18344c", "#102b40", "#203444", "#1a2a37", "#1a2a37" },
			conflict = { "#2c5372", "#274964", "#265478", "#1c4a6e", "#32526c", "#2c485f", "#2c485f" },
		},
	},
	catppuccin = {
		frappe = {
			rosewater = "#F2D5CF",
			flamingo = "#EEBEBE",
			pink = "#F4B8E4",
			mauve = "#CA9EE6",
			red = "#E78284",
			maroon = "#EA999C",
			peach = "#EF9F76",
			yellow = "#E5C890",
			green = "#A6D189",
			teal = "#81C8BE",
			sky = "#99D1DB",
			sapphire = "#85C1DC",
			blue = "#8CAAEE",
			lavender = "#BABBF1",

			text = "#C6D0F5",
			subtext1 = "#B5BFE2",
			subtext0 = "#A5ADCE",
			overlay2 = "#949CBB",
			overlay1 = "#838BA7",
			overlay0 = "#737994",
			surface2 = "#626880",
			surface1 = "#51576D",
			surface0 = "#414559",

			base = "#303446",
			mantle = "#292C3C",
			crust = "#232634",
		},
		latte = {
			rosewater = "#dc8a78",
			flamingo = "#DD7878",
			pink = "#ea76cb",
			mauve = "#8839EF",
			red = "#D20F39",
			maroon = "#E64553",
			peach = "#FE640B",
			yellow = "#df8e1d",
			green = "#40A02B",
			teal = "#179299",
			sky = "#04A5E5",
			sapphire = "#209FB5",
			blue = "#1e66f5",
			lavender = "#7287FD",

			text = "#4C4F69",
			subtext1 = "#5C5F77",
			subtext0 = "#6C6F85",
			overlay2 = "#7C7F93",
			overlay1 = "#8C8FA1",
			overlay0 = "#9CA0B0",
			surface2 = "#ACB0BE",
			surface1 = "#BCC0CC",
			surface0 = "#CCD0DA",

			crust = "#DCE0E8",
			mantle = "#E6E9EF",
			base = "#EFF1F5",
		},
		mocchiato = {
			rosewater = "#F4DBD6",
			flamingo = "#F0C6C6",
			pink = "#F5BDE6",
			mauve = "#C6A0F6",
			red = "#ED8796",
			maroon = "#EE99A0",
			peach = "#F5A97F",
			yellow = "#EED49F",
			green = "#A6DA95",
			teal = "#8BD5CA",
			sky = "#91D7E3",
			sapphire = "#7DC4E4",
			blue = "#8AADF4",
			lavender = "#B7BDF8",

			text = "#CAD3F5",
			subtext1 = "#B8C0E0",
			subtext0 = "#A5ADCB",
			overlay2 = "#939AB7",
			overlay1 = "#8087A2",
			overlay0 = "#6E738D",
			surface2 = "#5B6078",
			surface1 = "#494D64",
			surface0 = "#363A4F",

			base = "#24273A",
			mantle = "#1E2030",
			crust = "#181926",
		},
		mocha = {
			rosewater = "#F5E0DC",
			flamingo = "#F2CDCD",
			pink = "#F5C2E7",
			mauve = "#CBA6F7",
			red = "#F38BA8",
			maroon = "#EBA0AC",
			peach = "#FAB387",
			yellow = "#F9E2AF",
			green = "#A6E3A1",
			teal = "#94E2D5",
			sky = "#89DCEB",
			sapphire = "#74C7EC",
			blue = "#89B4FA",
			lavender = "#B4BEFE",

			text = "#CDD6F4",
			subtext1 = "#BAC2DE",
			subtext0 = "#A6ADC8",
			overlay2 = "#9399B2",
			overlay1 = "#7F849C",
			overlay0 = "#6C7086",
			surface2 = "#585B70",
			surface1 = "#45475A",
			surface0 = "#313244",

			base = "#1E1E2E",
			mantle = "#181825",
			crust = "#11111B",
		},
	},
}

local function onedark_theme()
	local styles = { dark = 1, darker = 2, cool = 3, deep = 4, warm = 5, warmer = 6, light = 7 }
	-- local index = styles[vim.g.onedark_config.style] -- FIXME:
	local index = styles["cool"]
	return index
end

M.component_colors = {
	onedark = {
		treesitter = M.color_palettes.onedark.green[onedark_theme()],
		scrollbar = M.color_palettes.onedark.bg2[onedark_theme()],
		git = {
			add = M.color_palettes.onedark.green[onedark_theme()],
			delete = M.color_palettes.onedark.red[onedark_theme()],
			change = M.color_palettes.onedark.orange[onedark_theme()],
			github = M.color_palettes.onedark.black[onedark_theme()],
		},
	},
	rose_pine = {
		treesitter = M.color_palettes.rose_pine.moon.green,
		scrollbar = M.color_palettes.rose_pine.moon.love,
		git = {
			add = M.color_palettes.rose_pine.moon.green,
			delete = M.color_palettes.rose_pine.moon.red,
			change = M.color_palettes.rose_pine.moon.orange,
			github = M.color_palettes.rose_pine.moon.black,
		},
	},
	tokyonight = {
		treesitter = M.color_palettes.tokyonight.green,
		scrollbar = M.color_palettes.tokyonight.terminal_black, -- bg_br
		git = {
			add = M.color_palettes.tokyonight.green,
			delete = M.color_palettes.tokyonight.red,
			change = M.color_palettes.tokyonight.orange,
			github = M.color_palettes.tokyonight.bg,
		},
	},
}

M.current_theme_colors = {}

M.current_theme = function()
	if time.hour >= 0 and time.hour < 7 then
		M.current_theme_colors = M.component_colors.onedark
		vim.cmd([[
	    try
	      colorscheme onedark
	      set background=dark
	    catch /^Vim\%((\a\+)\)\=:E185/
	      colorscheme default
	      set background=dark
	    endtry
	    ]])
	elseif time.hour >= 7 and time.hour < 10 then
		M.current_theme_colors = M.component_colors.rose_pine
		vim.cmd([[
	      try
	        colorscheme rose-pine
	        set background=light
	      catch /^Vim\%((\a\+)\)\=:E185/
	        colorscheme default
	        set background=light
	      endtry
	      ]])
	elseif time.hour >= 10 then
		M.current_theme_colors = M.component_colors.tokyonight
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
end

return M
