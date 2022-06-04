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
vim.opt.lazyredraw = true

-- Load Core Configs
require("user.core.options")
require("user.core.plugins")
require("user.utils.colorscheme").current_theme()

-- TODO:
--  Change All Plugins to get Icons from lsp_kind => nvim-gps
--  Surround.nvim
--  zen-mode, yode-nvim,
--  Add keymaps to treesitter https://alpha2phi.medium.com/neovim-tips-for-a-better-coding-experience-3d0f782f034e
--  text objects and motions for function (f) and class (c), E.g., daf to delete a function, yaf to yank a function, or dac to delete a class.
-- -- [m, [M, ]M, ]M to navigate between functions.
-- -- [[, ]], [], ][ to navigate between classes.
-- Context, Gitlinker, instant.nvim
-- Ts-rainbow and indentline: color based on theme
--  PackageInfo, crates
--  Neogit, gitdiff, vgit, gitmessenger
--  schemestore, neogen, harpoon, gkeep
--  Floating file explorer: tamago324/lir.nvim
--  https://alpha2phi.medium.com/vim-neovim-plugins-for-a-better-integrated-experience-6accd4c2a52c browser
--  folke/lua-dev
--  Recheck codeactions when its more mature
--  Standerize telescope functions abz for inspiration
--  Rework lualine
--  Refactor lualine utils.null-ls
