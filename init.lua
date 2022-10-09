-- Load impatient to speed up the config
local status_ok = pcall(require, "impatient")

-- Disable Builtin Plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
vim.opt.lazyredraw = false

-- Load Configs
require('arcane.utils.reload')
require("arcane.core")
require('arcane.utils.colorscheme').current_theme()
require("arcane.lsp")
reload("arcane.ui")
require("arcane.completion")
require("arcane.debugger")
require("arcane.general")
require("arcane.syntax")
require("arcane.search")
require('arcane.vcs')
