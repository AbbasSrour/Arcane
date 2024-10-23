local colors = require("arcane.utils.colorscheme").current_theme_component_colors
local conditions = require("arcane.ui.lualine.conditions")
local kind = require("arcane.utils.kind")

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
  -- Main Section
  mainIcon = {
    function()
      return kind.misc.mainIcon .. ""
    end,
    color = { gui = "bold" },
    padding = { left = 1, right = 1 },
    separator = { right = kind.misc.seperator.triangle.right .. "" },
    cond = nil,
  },

  -- File Name Section
  filetype = {
    "filetype",
    cond = conditions.hide_in_width,
    colored = true,
    icon_only = true,
    padding = { left = 2, right = 0.2 },
    color = nil,
  },
  filename = {
    "filename",
    path = 0,
    file_status = true,
    symbols = {
      modified = " [+]", --" " .. kind.nvim_tree_icons.not_saved, -- Text to show when the file is modified.
      readonly = " " .. kind.nvim_tree_icons.read_only, -- Text to show when the file is non-modifiable or readonly.
      unnamed = "[No Name]", -- Text to show for unnamed buffers.
    },
    color = nil,
    padding = { left = 1, right = 1 },
    separator = { right = kind.misc.seperator.triangle.right .. "" },
    cond = nil,
  },

  -- Git Section
  branch = {
    "b:gitsigns_head",
    icon = kind.git.branch .. "",
    color = { gui = "bold" },
    cond = conditions.hide_in_width,
    padding = { left = 2, right = 1 },
  },
  Github = {
    function()
      local data = require("github-notifications").statusline_notifications()
      if data.count > 10 then
        return data.icon .. " " .. "purge time"
      elseif data.count == 0 then
        return data.icon .. ""
      end
      return data.icon .. " " .. tostring(data.count)
    end,
    padding = { left = 1, right = 1 },
    cond = nil,
    color = { fg = colors.git.github },
  },
  diff = {
    "diff",
    source = diff_source,
    symbols = {
      added = kind.git.added .. " ",
      modified = kind.git.modified .. "",
      removed = kind.git.removed .. " ",
    },
    diff_color = {
      added = { fg = colors.git.add, bg = nil },
      modified = { fg = colors.git.change, bg = nil },
      removed = { fg = colors.git.delete, bg = nil },
    },
    padding = { left = 1 },
    color = nil,
    cond = nil,
  },
  pkginfo = {
    function()
      return require("package-info").get_status()
    end,
  },
  gps = {
    function()
      local gps = require("nvim-gps")
      local msg = ""
      if gps.is_available() then
        msg = gps.get_location()
      end
      return msg
    end,
    padding = { left = 1.5 },
    cond = nil,
    color = nil,
  },

  -- LSP Section
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
      error = kind.lsp.error .. " ",
      warn = kind.lsp.warn .. " ",
      info = kind.lsp.info .. " ",
      hint = kind.lsp.hint .. " ",
    },
    padding = { left = 1, right = 1 },
    color = nil,
    cond = conditions.hide_in_width,
    update_in_insert = true, -- Update diagnostics in insert mode.
    always_visible = false,
  },
  lsp = {
    function(msg)
      msg = msg or kind.lsp.inactive .. "LS Inactive"
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
          return kind.misc.ls_inactive .. "LS Inactive"
        end
        return msg
      end
      local buf_ft = vim.bo.filetype
      local buf_client_names = {}
      local trim = vim.fn.winwidth(0) < 120

      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          local _added_client = client.name
          if trim then
            _added_client = string.sub(client.name, 1, 4)
          end
          table.insert(buf_client_names, _added_client)
        end
      end

      -- add formatter
      local formatters = require("arcane.utils.lsp_providers")
      local supported_formatters = {}
      for _, fmt in pairs(formatters.list_registered_formmaters(buf_ft)) do
        local _added_formatter = fmt
        if trim then
          _added_formatter = string.sub(fmt, 1, 4)
        end
        table.insert(supported_formatters, _added_formatter)
      end
      vim.list_extend(buf_client_names, supported_formatters)

      -- add linter
      local linters = require("arcane.utils.lsp_providers")
      local supported_linters = {}
      for _, lnt in pairs(linters.list_registered_linters(buf_ft)) do
        local _added_linter = lnt
        if trim then
          _added_linter = string.sub(lnt, 1, 4)
        end
        table.insert(supported_linters, _added_linter)
      end
      vim.list_extend(buf_client_names, supported_linters)

      return kind.lsp.active .. "" .. table.concat(buf_client_names, ",")
    end,
    padding = { left = 1, right = 1 },
    color = { gui = "bold" },
    cond = conditions.hide_in_width,
  },
  treesitter = {
    function()
      local b = vim.api.nvim_get_current_buf()
      if next(vim.treesitter.highlighter.active[b]) then
        return kind.misc.treesitter .. " "
      end
      return ""
    end,
    padding = { left = 1, right = 1 },
    color = { fg = colors.treesitter },
    cond = conditions.hide_in_width,
  },

  -- Vim Section
  mode = {
    "mode",
    fmt = function(str)
      return str
    end,
  },
  modeIcon = {
    function()
      return kind.misc.vim_mode .. " "
    end,
    padding = { left = 0, right = 0 },
    separator = { left = kind.misc.seperator.circle.left },

    color = nil,
    cond = nil,
  },

  -- Progress Section
  progress = {
    "progress",
    cond = conditions.hide_in_width,
    padding = { left = 0.5, right = 1 },
    color = nil,
  },
  progressIcon = {
    function()
      return kind.misc.vim_pos .. " "
    end,
    padding = { left = 0, right = 0 },
    separator = { left = kind.misc.seperator.circle.left },
    color = nil,
    cond = nil,
  },

  -- Extensions
  NvimTree = {
    function()
      return kind.nvim_tree_misc.explorer .. " " .. "NvimTree"
    end,
    separator = { right = kind.misc.seperator.triangle.right },
  },

  SyOutline = {
    function()
      return kind.misc.symbolsOutline .. " " .. "Symbols Outline"
    end,
    separator = { left = kind.misc.seperator.circle.left },
  },

  -- fileformat = {
  -- 	"fileformat",
  -- 	symbols = {
  -- 		unix = kind.misc.linux .. "",
  -- 		dos = kind.misc.windows .. "",
  -- 		mac = kind.misc.apple .. "",
  -- 	},
  -- 	color = nil,
  -- 	cond = nil,
  -- },
  --Signature
  -- signature = {
  -- 	function()
  -- 		if not packer_plugins["lsp_signature.nvim"] or packer_plugins["lsp_signature.nvim"].loaded == false then
  -- 			return ""
  -- 		end
  -- 		local sig = require("lsp_signature").status_line()
  -- 		return " " .. kind.lsp.signature .. " " .. sig.hint -- return sig.label .. "🐼" .. sig.hint
  -- 	end,
  -- 	color = nil,
  -- 	cond = nil,
  -- },

  -- location = {
  -- 	"location",
  -- 	cond = conditions.hide_in_width,
  -- 	padding = { left = 0, right = 1 },
  -- 	color = nil,
  -- },
  -- scrollbar = {
  -- 	function()
  -- 		local current_line = vim.fn.line(".")
  -- 		local total_lines = vim.fn.line("$")
  -- 		local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  -- 		local line_ratio = current_line / total_lines
  -- 		local index = math.ceil(line_ratio * #chars)
  -- 		return chars[index]
  -- 	end,
  -- 	padding = { left = 0, right = 0 },
  -- 	-- color = { fg = colors.purple, bg = colors.bg },
  -- 	cond = nil,
  -- },
  -- Space
  -- spaces = {
  -- 	function()
  -- 		if not vim.api.nvim_buf_get_option(0, "expandtab") then
  -- 			return "Tab size: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
  -- 		end
  -- 		local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
  -- 		if size == 0 then
  -- 			size = vim.api.nvim_buf_get_option(0, "tabstop")
  -- 		end
  -- 		return "Spaces: " .. size .. " "
  -- 	end,
  -- 	cond = conditions.hide_in_width,
  -- 	color = nil,
  -- },

  --Encodeing
  -- encoding = {
  -- 	"o:encoding",
  -- 	fmt = string.upper,
  -- 	color = nil,
  -- 	cond = conditions.hide_in_width,
  -- },

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
