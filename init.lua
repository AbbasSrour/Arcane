-- Load impatient to speed up the config
---@diagnostic disable-next-line: unused-local
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


require('arcane.libs')
reload("arcane.core")
-- reload("arcane.syntax")
-- reload("arcane.completion")
-- reload("arcane.debugger")
-- reload("arcane.general")
-- reload("arcane.lsp")
-- reload("arcane.search")
reload("arcane.ui")
-- reload('arcane.vcs')
--
-- reload("arcane.utils.colorscheme")
-- reload('arcane.utils.winbar')
