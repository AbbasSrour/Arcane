local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-----------------------------------------------------------------------------------------------------------------
	--  PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-----------------------------------------------------------------------------------------------------------------
	-- Speed PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Impatient PLUGIN: Speed up loading Lua modules in Neovim to improve startup time.
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("user.configs.impatient")
		end,
	})

	-- FileType PLUGIN: Easily speed up your neovim startup time!
	use({
		"nathom/filetype.nvim",
		config = function()
			require("user.configs.filetype")
		end,
	})

	-- STARTUP-TIME-TEST PLUGIN: Check startuptime
	use({
		"dstein64/vim-startuptime",
		opt = true,
		cmd = "StartupTime",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- UI PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Popup PLUGIN: Implement features from vim popup apis
	use({
		requires = { "nvim-lua/plenary.nvim" },
		"nvim-lua/popup.nvim",
	})

	-- Dressing PLUGIN: UI Toolkit to select the UI backend (nui, telescope, fzf)
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("user.configs.dressing")
		end,
	})

	-- Web-DevIcons PLUGIN: Adds Icons To Neovim
	use({
		"kyazdani42/nvim-web-devicons",
	})

	-- Alpha NOTLAZYPLUGIN: Dashboard
	use({
		"goolord/alpha-nvim",
		config = function()
			require("user.configs.alpha")
		end,
		after = "nvim-web-devicons",
	})

	-- BufferLine NOTLAZYPLUGIN: As the Name Implies Buffer Line
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("user.configs.bufferline")
		end,
		after = "nvim-web-devicons",
	})

	-- Lualine NOTLAZYPLUGIN: Status Line
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("user.configs.lualine")
		end,
		after = "nvim-web-devicons",
	})

	-- Scrollbar NOTLAZYPLUGIN: Side Scrollbar
	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("user.configs.scrollbar")
		end,
		after = "nvim-web-devicons",
	})

	-- NOTIFICATIONS NOTLAZYPLUGIN: Fancy Notifications
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("user.configs.notification")
		end,
		after = "nvim-web-devicons",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- Colorscheme PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Rose-Pine PLUGIN:
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("user.utils.colorscheme").rose_pine()
			vim.cmd([[
	try
	  colorscheme rose-pine
	  set background=light
	catch /^Vim\%((\a\+)\)\=:E185/
	  colorscheme default
	  set background=light
	endtry
	]])
		end,
		cond = function()
			local time = os.date("*t")
			return time.hour >= 7 and time.hour < 13
		end,
	})

	-- Tokyonight PLUGIN:
	use({
		"folke/tokyonight.nvim",
		config = function()
			require("user.utils.colorscheme").tokyonight()
			vim.cmd([[
	try
	  colorscheme tokyonight
	  set background=dark
	catch /^Vim\%((\a\+)\)\=:E185/
	  colorscheme default
	  set background=dark
	endtry
	]])
		end,
		cond = function()
			local time = os.date("*t")
			return time.hour >= 13
		end,
	})

	--OneDark PLUGIN:
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("user.utils.colorscheme").onedark()
			vim.cmd([[
	try
	  colorscheme onedark
	  set background=dark
	catch /^Vim\%((\a\+)\)\=:E185/
	  colorscheme default
	  set background=dark
	endtry
	]])
		end,
		cond = function()
			local time = os.date("*t")
			return (time.hour >= 0 and time.hour < 7)
		end,
	})

	-- Cobalt2 PLUGIN:
	-- -- use({
	-- -- 	"lalitmee/cobalt2.nvim",
	-- -- 	requires = "tjdevries/colorbuddy.nvim",
	-- -- 	config = function()
	-- -- 		require("colorbuddy").colorscheme("cobalt2")
	-- -- 	end,
	-- -- })

	-----------------------------------------------------------------------------------------------------------------
	-- Telescope PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Telescope PLUGIN: Easy Search
	use({
		"nvim-telescope/telescope.nvim",
		-- requires = { { "nvim-telescope/telescope-media-files.nvim" }, { "ahmedkhalf/project.nvim" } },
		config = function()
			require("user.configs.telescope")
		end,
		opt = true,
		cmd = "Telescope",
		event = "BufRead",
	})

	-- Telescope-Media-Supp NOTLAZYPLUGIN: View Images with Telescope media_files command
	use({
		"nvim-telescope/telescope-media-files.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" } },
	})

	-- Project NOTLAZYPLUGIN: For All Your uncompleted Projects
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("user.configs.project")
		end,
	})

	-----------------------------------------------------------------------------------------------------------------
	-- Lsp PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Lsp-Config PLAZYPLUGIN: -- enable Lsp
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("user.configs.lsp")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Lsp-Installer PLAZYPLUGIN: -- simple to use language server installer
	use({
		"williamboman/nvim-lsp-installer",
		opt = true,
		event = "BufRead",
	})

	-- Nlsp-Settings PLAZYPLUGIN: -- language server settings defined in json
	use({
		"tamago324/nlsp-settings.nvim",
		opt = true,
		event = "BufRead",
	})

	-- Null-ls PLAZYPLUGIN: -- for formatters and linters
	use({
		"jose-elias-alvarez/null-ls.nvim",
		opt = true,
		event = "BufRead",
	})

	-- Function-Signature PLAZYPLUGIN: Function Parameters
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("user.configs.lsp.lspsignature")
		end,
		opt = true,
		event = "BufRead",
	})

	-- FIDGET PLAZYPLUGIN: Lsp Loader Progress
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("user.configs.fidget")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Lsp-Saga NOTLAZYPLUGIN: Better Lsp UI
	-- use({
	-- 	"tami5/lspsaga.nvim",
	-- 	config = function()
	-- 		require("user.configs.lspsaga")
	-- 	end,
	-- })

	-- CodeActionMenu PLUGIN: Better Menu for CodeActionMenu
	-- use({
	-- 	"weilbith/nvim-code-action-menu",
	-- 	config = function()
	-- 		require("user.configs.codeactions").setup()
	-- 	end,
	-- 	opt = true,
	-- 	cmd = "CodeActionMenu",
	-- })

	-----------------------------------------------------------------------------------------------------------------
	-- Snippets PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- LuaSnip PLAZYPLUGIN: Snippet engine
	use({
		"L3MON4D3/LuaSnip",
		opt = true,
		event = "BufRead",
	})

	-- Friendly-Snippets PLAZYPLUGIN: A bunch of snippets to use
	use({
		"rafamadriz/friendly-snippets",
		opt = true,
		event = "BufRead",
	})

	-- React-Snippets PLUGIN: React Snippets
	use({
		"mlaursen/vim-react-snippets",
		opt = true,
		ft = { "js", "jsx" },
	})

	-----------------------------------------------------------------------------------------------------------------
	-- Cmp PLUGINS:
	-----------------------------------------------------------------------------------------------------------------
	-- Cmp-Nvim PLAZYPLUGIN: The completion plugin
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			-- Cmp-Buffer PLAZYPLUGIN: buffer completions
			{ "hrsh7th/cmp-buffer" },

			-- Cmp-Path PLAZYPLUGIN: path completions
			{ "hrsh7th/cmp-path" },

			-- Cmp-Cmdline PLAZYPLUGIN: cmdline completions
			{ "hrsh7th/cmp-cmdline" },

			-- Cmp-LuaSnip PLAZYPLUGIN:  snippet completions
			{ "saadparwaiz1/cmp_luasnip" },

			-- Cmp-Lsp PLAZYPLUGIN:
			{ "hrsh7th/cmp-nvim-lsp" },

			-- Cmp-Lua PLAZYPLUGIN:
			{ "hrsh7th/cmp-nvim-lua" },

			-- Document-Symbols PLAZYPLUGIN:
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
		},
		config = function()
			require("user.configs.cmp")
		end,
		opt = true,
		event = "BufRead",
	})

	-- TABNINE PLAZYPLUGIN:
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		config = function()
			require("user.configs.cmp.tabnine")
		end,
		opt = true,
		event = "BufRead",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- Treesitter PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Treesitter PLAZYPLUGIN: Syntax Highlight
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("user.configs.treesitter")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Treesitter-TextObj PLAZYPLUGIN: Syntax aware text-objects, select, move, swap, and peek support.
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		opt = true,
		event = "BufRead",
	})

	-- Treesitter-Context-Comm PLAZYPLUGIN: This is useful when there are embedded languages in certain types of files
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		opt = true,
		event = "BufRead",
	})

	-- TreeHopper PLAZYPLUGIN: Plugin that provides region selection using hints on the abstract syntax tree of a document.
	use({
		"mfussenegger/nvim-treehopper",
		opt = true,
		event = "BufRead",
	})

	-- Treesitter-TextSubj PLAZYPLUGIN: Location and syntax aware text objects which *do what you mean*
	use({
		"RRethy/nvim-treesitter-textsubjects",
		opt = true,
		event = "BufRead",
	})

	-- AutoPairs PLAZYPLUGIN:
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("user.configs.autopairs")
		end,
		opt = true,
		event = "BufRead",
	})

	-- AutoTag PLAZYPLUGIN: Use treesitter to autoclose and autorename html tag
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("user.configs.autotag")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Treesitter-Context PLAZYPLUGIN: FIXME
	use({
		"romgrk/nvim-treesitter-context",
		config = function()
			require("user.configs.tscontext")
		end,
		opt = true,
		event = "BufRead",
	})

	--  -- VR-COMMENTS-CONTEXT PLAZYPLUGIN: Vr Function Context as Comments
	use({
		"haringsrob/nvim_context_vt",
		config = function()
			require("user.configs.vrcontext")
		end,
		opt = true,
		event = "BufRead",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- General PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- WhichKey NOTLAZYPLUGIN: Key Popup
	use({
		"folke/which-key.nvim",
		config = function()
			require("user.configs.whichkey")
		end,
	})

	-- LEGENDARYKEYS NOTLAZYPLUGIN: Search Keybindings
	use({
		"mrjones2014/legendary.nvim",
		config = function()
			require("user.configs.legendarykeys")
		end,
		-- cmd = {
		-- 	"Legendary",
		-- 	"require('legendary').find()",
		-- 	"require('legendary').find('keymaps')",
		-- 	"require('legendary').find('keymaps')",
		-- 	"require('legendary').find('autocmds')",
		-- },
		-- keys = "<C-p>",
	})

	-- Comments PLAZYPLUGIN: Easier Time Commenting Shit
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("user.configs.comment")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Nvim-Tree PLUGIN: Tree Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("user.configs.nvim-tree")
		end,
		opt = true,
		cmd = {
			"NvimTreeClipboard",
			"NvimTreeClose",
			"NvimTreeFindFile",
			"NvimTreeOpen",
			"NvimTreeRefresh",
			"NvimTreeToggle",
		},
	})

	-- ToggleTerm PLUGIN: Better Terminal
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("user.configs.toggleterm")
		end,
		opt = true,
		cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
		keys = "<C-t>",
	})

	-- Indent-Backline PLAZYPLUGIN: Indents to make out code better
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("user.configs.indentline")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Todo-Comments PLAZYPLUGIN: Highlight comments and notes
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("user.configs.todo")
		end,
		opt = true,
		event = "BufRead",
	})

	-- TroubleToggle PLUGIN: Track Bugs and highlights
	use({
		"folke/trouble.nvim",
		config = function()
			require("user.configs.trouble")
		end,
		opt = true,
		cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
	})

	-- HEXOKINASE PLUGIN: Virtual Color Identifier
	use({
		"rrethy/vim-hexokinase",
		run = "make hexokinase",
		config = function()
			require("user.configs.hexokinase")
		end,
		opt = true,
		ft = { "css", "scss", "sass", "xml", "js", "jsx", "conf", "txt", "lua" },
		cmd = "hexokinase",
	})

	-- PERSISTANCE PLAZYPLUGIN: Save current session
	use({
		"folke/persistence.nvim",
		module = "persistence",
		config = function()
			require("user.configs.persistance")
		end,
		event = "BufReadPre",
		opt = true,
	})

	-- NUMB PLAZYPLUGIN: Jump to a specific line with :x
	use({
		"nacro90/numb.nvim",
		config = function()
			require("user.configs.numbpeek")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Surround PLAZYPLUGIN: Surround Characters with brackets and functions FIXME
	use({
		"ur4ltz/surround.nvim",
		config = function()
			require("user.configs.vim-surround")
		end,
		opt = true,
		event = "BufRead",
	})

	--  -- REFACTORING PLUGIN: The Refactoring library based off the Refactoring book by Martin Fowler
	-- use({
	--    "ThePrimeagen/refactoring.nvim",
	--    opt = true,
	--    event = "BufRead"
	--  })

	--  -- JSON-SCHEME-STORE PLUGIN:
	-- use("b0o/schemastore.nvim")
	--
	--  -- NEOGEN PLUGIN: Create annotations with one keybind
	-- use("danymat/neogen")
	--
	--  -- HARPOON PLUGIN:
	-- use("ThePrimeagen/harpoon")
	--
	--
	--  -- YODE PLUGIN:
	-- use("hoschi/yode-nvim")
	--
	--  -- OrgMode PLUGIN:
	-- use("jceb/vim-orgmode")
	--
	--  -- Maven PLUGIN:
	-- use("mikelue/vim-maven-plugin")
	--
	--  -- AnyFold PLUGIN:
	-- use("pseewald/vim-anyfold")
	--
	--  --GKEEP-NOTES PLUGIN:
	-- use({ "stevearc/gkeep.nvim", run = ":UpdateRemotePlugins" })
	--
	--  --INSTANT PLUGIN:
	-- use("jbyuki/instant.nvim")
	--
	--  -- SYMBOLS_OUTLINE PLUGIN:
	-- use({
	-- 	"simrat39/symbols-outline.nvim",
	-- 	config = function()
	-- 		require("user.configs.symbolsOutline").setup()
	-- 	end,
	-- })
	--
	--
	--  -- TS-RAINBOW-BRACKETS PLUGIN:
	-- -- use({
	-- -- 	"p00f/nvim-ts-rainbow",
	-- -- 	config = function()
	-- -- 		require("user.configs.rainbow")
	-- -- 	end,
	-- -- })
	--
	--  -- TWILIGHT PLUGIN:
	-- use({
	-- 	"folke/twilight.nvim",
	-- 	config = function()
	-- 		require("user.configs.twilight")
	-- 	end,
	-- })
	--
	--  -- CRATES PLUGIN:
	-- use({
	-- 	"saecki/crates.nvim",
	-- 	event = { "BufRead Cargo.toml" },
	-- 	config = function()
	-- 		require("user.configs.crates")
	-- 	end,
	-- })
	--
	--  --PKGINFO PLUGIN:
	-- use({
	-- 	"vuki656/package-info.nvim",
	-- 	requires = "MunifTanjim/nui.nvim",
	-- 	config = function()
	-- 		require("user.configs.pkginfo")
	-- 	end,
	-- })
	--
	--  -- SNIPRUN PLUGIN:
	-- -- use {
	-- --       "michaelb/sniprun",
	-- --       run = "bash install.sh",
	-- --       config = function()
	-- --         require("config.sniprun").setup()
	-- --       end,
	-- -- }
	--
	--  -- BRACEY-LIVE-SERVER PLUGIN:
	-- use({
	-- 	"turbio/bracey.vim",
	-- 	cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
	-- 	run = "npm install --prefix server",
	-- })
	--
	--  -- NEOCLIP PLUGIN:
	-- use({
	-- 	"AckslD/nvim-neoclip.lua",
	-- 	requires = {
	-- 		{ "tami5/sqlite.lua", module = "sqlite" },
	-- 		{ "nvim-telescope/telescope.nvim" },
	-- 	},
	-- 	config = function()
	-- 		require("user.configs.neoclip")
	-- 	end,
	-- })
	--
	--  --GITLINKER PLUGIN:
	-- use({
	-- 	"ruifm/gitlinker.nvim",
	-- 	config = function()
	-- 		require("user.configs.linker")
	-- 	end,
	-- })
	--
	--  -- Copilot PLUGIN:
	-- use({
	-- 	"github/copilot.vim",
	-- 	config = function()
	-- 		vim.cmd([[imap <silent><script><expr> <C-L> copilot#Accept("\<CR>")]])
	-- 		vim.g.copilot_no_tab_map = true
	-- 		vim.g.copilot_filetypes = {
	-- 			["*"] = true,
	-- 			gitcommit = false,
	-- 			NeogitCommitMessage = false,
	-- 		}
	-- 	end,
	-- })
	--
	-----------------------------------------------------------------------------------------------------------------
	-- Git PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- -- Git-Signs PLAZYPLUGIN:
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("user.configs.gitsigns")
		end,
		opt = true,
		event = "BufRead",
	})

	--  -- Diff-View PLUGIN:
	-- use({
	-- 	"sindrets/diffview.nvim",
	-- 	config = function()
	-- 		require("user.configs.gitdiff")
	-- 	end,
	-- })
	--
	--  -- Git-Messenger PLUGIN:
	-- -- use({
	-- -- 	"rhysd/git-messenger.vim",
	-- -- 	config = function()
	-- -- 		require("user.configs.gitmessenger")
	-- -- 	end,
	-- -- })
	--
	--  -- GH-Notifications PLUGIN:
	-- use({
	-- 	"rlch/github-notifications.nvim",
	-- 	config = function()
	-- 		require("user.configs.githubnotifications")
	-- 	end,
	-- })
	--
	--  -- Neogit PLUGIN:
	-- -- use({
	-- -- 	"TimUntersberger/neogit",
	-- -- 	cmd = "Neogit",
	-- -- 	config = function()
	-- -- 		require("user.configs.neogitplug")
	-- -- 	end,
	-- -- })
	--
	--  -- Vgit PLUGIN:
	-- use({
	-- 	"tanvirtin/vgit.nvim",
	-- 	event = "BufWinEnter",
	-- 	config = function()
	-- 		require("user.confgs.vgitplug")
	-- 	end,
	-- })

	-----------------------------------------------------------------------------------------------------------------
	-- MISC PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Packer NOTLAZYPLUGIN: The Plugin Manager
	use({
		"wbthomason/packer.nvim",
	})

	-- Plenary NOTLAZYPLUGIN: All the lua functions I don't want to write twice.
	use({
		"nvim-lua/plenary.nvim",
	})

	-- Vim-bbye NOTLAZYPLUGIN: Close Buffers
	use({
		"moll/vim-bbye",
	})

	-- FixCursorHold NOTLAZYPLUGIN: Result in more snappiness for some plugins
	use({
		"antoinemadec/FixCursorHold.nvim",
		config = function()
			vim.g.cursorhold_updatetime = 100
		end,
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
