require("impatient")

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

-- Core Configs
require("user.core.options")
require("user.core.plugins")

-- TODO:
-- 2- Change All Plugins to get Icons from lsp_kind
-- 2.1- Surround.nvim
-- 2.3- colorschemes plugins
-- 2.4- Todo Trouble not working
-- 3- Rework keymaps with respect to lsp keymaps
-- 3.5- LionC/nest.nvim
-- 4- Add recent used files shortcut to which_key, and rework telescope find file feature
-- 5- zen-mode, yode-nvim,
-- 6- Add keymaps to treesitter https://alpha2phi.medium.com/neovim-tips-for-a-better-coding-experience-3d0f782f034e
-- text objects and motions for function (f) and class (c), E.g., daf to delete a function, yaf to yank a function, or dac to delete a class.
-- -- [m, [M, ]M, ]M to navigate between functions.
-- -- [[, ]], [], ][ to navigate between classes.
-- 7- Neoclip KeyBindings And setup
-- 8- Context, Gitlinker, instant.nvim, nvim-gps
-- 9- Ts-rainbow and indentline: color based on theme
-- 10- PackageInfo, crates
-- 11- Neogit, gitdiff, vgit, gitmessenger, githubnotifications
-- 12- schemestore, neogen, harpoon
-- 13- Floating file explorer: tamago324/lir.nvim
-- 14- Telescope Image viewer, gkeep
-- 15- https://alpha2phi.medium.com/vim-neovim-plugins-for-a-better-integrated-experience-6accd4c2a52c browser
-- 16- Take a look at nui
-- 17- fix onedark colors in colorschemes
-- 18- Move Lsp Telescope commands to lua functions
-- 19- folke/lua-dev
