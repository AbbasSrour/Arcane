-- Load impatient to speed up the config
local status_ok = pcall(require, "impatient")

-- Reload Config
if File_watchers == nil then
	File_watchers = {}
end
local watch_file_augroup = "watch_file_augroup"
vim.api.nvim_create_augroup(watch_file_augroup, { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
	group = watch_file_augroup,
	callback = function()
		for _, watcher in pairs(File_watchers) do
			watcher:stop()
		end
	end,
})
local function watch_file(fname, cb, time)
	if File_watchers[fname] then
		File_watchers[fname]:stop()
		File_watchers[fname] = nil
	end

	File_watchers[fname] = vim.loop.new_fs_poll()
	File_watchers[fname]:start(fname, time, vim.schedule_wrap(cb))
end

local init_lua = vim.fn.stdpath("config") .. "/init.lua"
watch_file(init_lua, function()
	dofile(init_lua)
	vim.notify("Reloaded init.lua", vim.diagnostic.severity.INFO)
end, 500)

-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting()]])

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
--  Dap
