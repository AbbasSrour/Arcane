local colors = require("user.configs.lualine.colors")
local conditions = require("user.configs.lualine.conditions")

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

Components = {
	-- Main icon
	mainIcon = {
		function()
			return " "
		end,
		padding = { left = 1, right = 1 },
		separator = { right = "" },
		cond = nil,
	},

	-- File Name, Type && Location
	filetype = {
		"filetype",
		cond = conditions.hide_in_width,
		colored = false,
		icon_only = true,
		padding = { left = 2, right = 0.2 },
		color = {},
	},
	filename = {
		"filename",
		path = 0,
		color = {},
		padding = { left = 1, right = 1 },
		separator = { right = "" },
		cond = nil,
	},
	fileformat = {
		"fileformat",
		symbols = {
			unix = "", -- e712
			dos = "", -- e70f
			mac = "", -- e711
		},
	},
	-- Github
	branch = {
		"b:gitsigns_head",
		icon = " ",
		color = { gui = "bold" },
		cond = conditions.hide_in_width,
	},
	diff = {
		"diff",
		source = diff_source,
		symbols = { added = "  ", modified = "柳", removed = " " },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.yellow },
			removed = { fg = colors.red },
		},
		color = {},
		cond = nil,
	},

	-- Diagnostics
	diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = " ", warn = " ", info = " ", hint = " " },
		padding = { left = 1, right = 1 },
		color = {},
		cond = conditions.hide_in_width,
		update_in_insert = true, -- Update diagnostics in insert mode.
		always_visible = false,
	},

	-- Package Info
	pkginfo = {
		function()
			return require("package-info").get_status()
		end,
	},

	-- Github
	Github = {
		function()
			return require("github-notifications").statusline_notification_count
		end,
	},

	-- Treesitter
	treesitter = {
		function()
			local b = vim.api.nvim_get_current_buf()
			if next(vim.treesitter.highlighter.active[b]) then
				return "  "
			end
			return ""
		end,
		padding = { left = 0, right = 1 },
		color = { fg = colors.green },
		cond = conditions.hide_in_width,
	},

	--LSP
	lsp = {
		function(msg)
			msg = msg or "LS Inactive"
			local buf_clients = vim.lsp.buf_get_clients()
			if next(buf_clients) == nil then
				-- TODO: clean up this if statement
				if type(msg) == "boolean" or #msg == 0 then
					return "LS Inactive"
				end
				return msg
			end
			local buf_ft = vim.bo.filetype
			local buf_client_names = {}

			-- add client
			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" then
					table.insert(buf_client_names, client.name)
				end
			end

			-- add formatter
			-- local formatters = require "lvim.lsp.null-ls.formatters"
			-- local supported_formatters = formatters.list_registered(buf_ft)
			-- vim.list_extend(buf_client_names, supported_formatters)

			-- add linter
			-- local linters = require "lvim.lsp.null-ls.linters"
			-- local supported_linters = linters.list_registered(buf_ft)
			-- vim.list_extend(buf_client_names, supported_linters)

			return "  " .. table.concat(buf_client_names, ", ")
		end,
		padding = { left = 1, right = 1 },
		color = { gui = "bold" },
		cond = conditions.hide_in_width,
	},

	-- Vim Mode
	mode = {
		"mode",
		fmt = function(str)
			return str
		end,
	},
	modeIcon = {
		function()
			return ""
		end,
		padding = { left = 1, right = 2 },
		separator = { left = "" },
		color = {},
		cond = nil,
	},

	-- Progress
	scrollbar = {
		function()
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local chars = { "  ", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
		end,
		padding = { left = 0, right = 0 },
		color = { fg = colors.yellow, bg = colors.bg },
		cond = nil,
	},
	progress = {
		"progress",
		cond = conditions.hide_in_width,
		padding = { left = 0.5, right = 1 },
		color = {},
	},
	progressIcon = {
		function()
			return " "
		end,
		padding = { left = 0, right = 0 },
		separator = { left = "" },
		color = {},
		cond = nil,
	},
	location = {
		"location",
		cond = conditions.hide_in_width,
		padding = { left = 0, right = 1 },
		color = {},
	},

	-- Space
	spaces = {
		function()
			if not vim.api.nvim_buf_get_option(0, "expandtab") then
				return "Tab size: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
			end
			local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
			if size == 0 then
				size = vim.api.nvim_buf_get_option(0, "tabstop")
			end
			return "Spaces: " .. size .. " "
		end,
		cond = conditions.hide_in_width,
		color = {},
	},

	--Encodeing
	encoding = {
		"o:encoding",
		fmt = string.upper,
		color = {},
		cond = conditions.hide_in_width,
	},

	-- Python
	-- python_env = {
	--   function()
	--     local utils = require "lvim.core.lualine.utils"
	--     if vim.bo.filetype == "python" then
	--       local venv = os.getenv "CONDA_DEFAULT_ENV"
	--       if venv then
	--         return string.format("  (%s)", utils.env_cleanup(venv))
	--       end
	--       venv = os.getenv "VIRTUAL_ENV"
	--       if venv then
	--         return string.format("  (%s)", utils.env_cleanup(venv))
	--       end
	--       return ""
	--     end
	--     return ""
	--   end,
	--   color = { fg = colors.green },
	--   cond = conditions.hide_in_width,
	-- },
}
