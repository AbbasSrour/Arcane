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
	})

	-- FileType PLUGIN: Easily speed up your neovim startup time!
	use({
		"nathom/filetype.nvim",
		config = function()
			require("user.plugins.filetype")
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

	-- Popup NOTLAZYPLUGIN: Implement features from vim popup apis
	use({
		requires = { "nvim-lua/plenary.nvim" },
		"nvim-lua/popup.nvim",
	})

	-- Dressing NOTLAZYPLUGIN: UI Toolkit to select the UI backend (nui, telescope, fzf)
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("user.plugins.ui.dressing")
		end,
	})

	-- Web-DevIcons NOTLAZYPLUGIN: Adds Icons To Neovim
	use({
		"kyazdani42/nvim-web-devicons",
	})

	-- Alpha NOTLAZYPLUGIN: Dashboard
	use({
		"goolord/alpha-nvim",
		config = function()
			require("user.plugins.ui.alpha")
		end,
	})

	-- BufferLine NOTLAZYPLUGIN: As the Name Implies Buffer Line
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("user.plugins.ui.bufferline")
		end,
	})

	-- Lualine NOTLAZYPLUGIN: Status Line
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("user.plugins.lualine")
		end,
	})

	-- Scrollbar PLAZYPLUGIN: Side Scrollbar
	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("user.plugins.ui.scrollbar")
		end,
		opt = true,
		event = "BufRead",
	})

	-- NOTIFICATIONS NOTLAZYPLUGIN: Fancy Notifications
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("user.plugins.ui.notify")
		end,
	})

	-- Indent-Backline PLAZYPLUGIN: Indents to make out code better
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("user.plugins.ui.indentline")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Nvim-Gps PLAZYPLUGIN:
	use({
		"SmiteshP/nvim-gps",
		config = function()
			require("user.plugins.ui.gps")
		end,
		opt = true,
		event = "BufRead",
	})

	--  -- TS-RAINBOW-BRACKETS PLUGIN:
	-- -- use({
	-- -- 	"p00f/nvim-ts-rainbow",
	-- -- 	config = function()
	-- -- 		require("user.plugins.rainbow")
	-- -- 	end,
	-- -- })

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
			local colorscheme = require("user.utils.colorscheme").current_theme()
			if colorscheme.theme == "rose_pine" then
				return true
			else
				return false
			end
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
			local colorscheme = require("user.utils.colorscheme").current_theme()
			if colorscheme.theme == "tokyonight" then
				return true
			else
				return false
			end
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
			local colorscheme = require("user.utils.colorscheme").current_theme()
			if colorscheme.theme == "onedark" then
				return true
			else
				return false
			end
		end,
	})

	-- Cobalt2 PLUGIN:
	-- use({
	-- 	"lalitmee/cobalt2.nvim",
	-- 	requires = "tjdevries/colorbuddy.nvim",
	-- 	config = function()
	-- 		require("colorbuddy").colorscheme("cobalt2")
	-- 	end,
	-- })

	-----------------------------------------------------------------------------------------------------------------
	-- Telescope PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Telescope PLUGIN: Easy Search
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("user.plugins.telescope.setup")
		end,
		opt = true,
		cmd = { "Telescope" },
		event = "BufRead",
	})

	-- Telescope Fuzy Finder NOTLAZYPLUGIN:
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
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
			require("user.plugins.project")
		end,
	})

	-- UtilSnip Telescope Extension NOTLAZYPLUGIN:
	use({
		"fhill2/telescope-ultisnips.nvim",
	})

	-- NEOCLIP PLAZYPLUGIN:
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "tami5/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("user.plugins.telescope.neoclip")
		end,
		opt = true,
		event = "BufRead",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- Lsp PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Lsp-Config PLAZYPLUGIN: -- enable Lsp
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("user.plugins.lsp")
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
			require("user.plugins.lsp.plugins.lspsignature")
		end,
		opt = true,
		event = "BufRead",
	})

	-- FIDGET PLAZYPLUGIN: Lsp Loader Progress
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("user.plugins.lsp.plugins.fidget")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Lightbulb PLAZYPLUGIN: Adds code action indicator when code actions are available
	use({
		"kosayoda/nvim-lightbulb",
		config = function()
			require("user.plugins.lsp.plugins.lightbulb")
		end,
		opt = true,
		event = "BufRead",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- Snippets PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- LuaSnip PLAZYPLUGIN: Snippet Engine
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

	-- ULtiSnips PLAZYPLUGIN: Snippet Engine
	use({
		"SirVer/ultisnips",
		opt = true,
		event = "BufRead",
	})

	-- React-Snippets PLAZYPLUGIN: React Snippets
	use({
		"mlaursen/vim-react-snippets",
		opt = true,
		event = "BufRead",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- Cmp PLUGINS:
	-----------------------------------------------------------------------------------------------------------------
	-- Cmp-Nvim PLAZYPLUGIN: The completion engine plugin
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

			-- Cmp-Lsp PLAZYPLUGIN: Bettter completions than builtin lsp omnifunc
			{ "hrsh7th/cmp-nvim-lsp" },

			-- Cmp-Lua PLAZYPLUGIN: Add completion for lua vim apis
			{ "hrsh7th/cmp-nvim-lua" },

			-- Document-Symbols PLAZYPLUGIN: Add document symbols like functions to / search reasults
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },

			-- Signature-Help PLAZYPLUGIN: Add signature help to cmp
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },

			-- Ultisnips PLAZYPLUGIN: Get suggestions from ultisnips snippets
			{ "quangnguyen30192/cmp-nvim-ultisnips" },
		},
		config = function()
			require("user.plugins.completions.cmp")
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
			require("user.plugins.completions.tabnine")
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
			require("user.plugins.treesitter.setup")
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
			require("user.plugins.treesitter.autopairs")
		end,
		opt = true,
		event = "BufRead",
	})

	-- AutoTag PLAZYPLUGIN: Use treesitter to autoclose and autorename html tag
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("user.plugins.treesitter.autotag")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Treesitter-Context PLAZYPLUGIN: FIXME
	use({
		"romgrk/nvim-treesitter-context",
		config = function()
			require("user.plugins.treesitter.tscontext")
		end,
		opt = true,
		event = "BufRead",
	})

	-- VR-COMMENTS-CONTEXT PLAZYPLUGIN: Vr Function Context as Comments
	use({
		"haringsrob/nvim_context_vt",
		config = function()
			require("user.plugins.treesitter.vrcontext")
		end,
		opt = true,
		event = "BufRead",
	})

	-- SYMBOLS_OUTLINE PLUGIN:
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			require("user.plugins.treesitter.symbolsOutline").setup()
		end,
		cmd = "SymbolsOutline",
		opt = true,
	})

	-- Todo-Comments PLAZYPLUGIN: Highlight comments and notes
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("user.plugins.treesitter.todo")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Comments PLAZYPLUGIN: Easier Time Commenting Shit
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("user.plugins.treesitter.comment")
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
			require("user.plugins.whichkey")
		end,
	})

	-- LEGENDARYKEYS NOTLAZYPLUGIN: Search Keybindings
	use({
		"mrjones2014/legendary.nvim",
		config = function()
			require("user.plugins.legendarykeys")
		end,
	})

	-- Nvim-Tree PLUGIN: Tree Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("user.plugins.ui.nvim-tree")
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
			require("user.plugins.ui.toggleterm")
		end,
		opt = true,
		cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
		keys = "<C-t>",
	})

	-- TroubleToggle PLUGIN: Track Bugs and highlights
	use({
		"folke/trouble.nvim",
		config = function()
			require("user.plugins.ui.trouble")
		end,
		opt = true,
		cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
	})

	-- HEXOKINASE PLUGIN: Virtual Color Identifier
	use({
		"rrethy/vim-hexokinase",
		run = "make hexokinase",
		config = function()
			require("user.plugins.hexokinase")
		end,
		opt = true,
		ft = { "css", "scss", "sass", "xml", "js", "jsx", "conf", "txt", "lua" },
		cmd = "hexokinase",
	})

	-- Session Manager NOTLAZYPLUGIN: Save current session
	use({
		"Shatur/neovim-session-manager",
		config = function()
			require("user.plugins.session-manager")
		end,
	})

	-- NUMB PLAZYPLUGIN: Jump to a specific line with :x
	use({
		"nacro90/numb.nvim",
		config = function()
			require("user.plugins.numbpeek")
		end,
		opt = true,
		event = "BufRead",
	})

	-- -- Copilot PLUGIN:
	use({
		"github/copilot.vim",
		config = function()
			vim.cmd([[imap <silent><script><expr> <C-k> copilot#Accept("\<CR>")]])
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_filetypes = {
				["*"] = true,
				gitcommit = false,
				NeogitCommitMessage = false,
			}
		end,
	})

	-- Dap PLAZYPLUGIN:
	-- use({
	-- 	"mfussenegger/nvim-dap",
	-- })

	--  -- REFACTORING PLUGIN: The Refactoring library based off the Refactoring book by Martin Fowler
	-- use({
	--    "ThePrimeagen/refactoring.nvim",
	--    opt = true,
	--    event = "BufRead"
	--  })
	--  --PKGINFO PLUGIN:
	-- use({
	-- 	"vuki656/package-info.nvim",
	-- 	requires = "MunifTanjim/nui.nvim",
	-- 	config = function()
	-- 		require("user.plugins.pkgs.pkginfo")
	-- 	end,
	-- })

	-----------------------------------------------------------------------------------------------------------------
	-- Git PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Git-Signs PLAZYPLUGIN:
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("user.plugins.git.gitsigns")
		end,
		opt = true,
		event = "BufRead",
	})

	--  -- GH-Notifications PLUGIN:
	use({
		"rlch/github-notifications.nvim",
		config = function() end,
		opt = "true",
		event = "BufRead",
	})

	--  -- Diff-View PLUGIN:
	-- use({
	-- 	"sindrets/diffview.nvim",
	-- 	config = function()
	-- 		require("user.plugins.gitdiff")
	-- 	end,
	-- })
	--
	--  -- Git-Messenger PLUGIN:
	-- -- use({
	-- -- 	"rhysd/git-messenger.vim",
	-- -- 	config = function()
	-- -- 		require("user.plugins.gitmessenger")
	-- -- 	end,
	-- -- })
	--
	--
	--  -- Neogit PLUGIN:
	-- -- use({
	-- -- 	"TimUntersberger/neogit",
	-- -- 	cmd = "Neogit",
	-- -- 	config = function()
	-- -- 		require("user.plugins.neogitplug")
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

	-- Octo PLUGIN:
	-- use({"pwntester/octo.nvim"})
	--
	--  --GITLINKER PLUGIN:
	-- use({
	-- 	"ruifm/gitlinker.nvim",
	-- 	config = function()
	-- 		require("user.plugins.linker")
	-- 	end,
	-- })
	--

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

	-----------------------------------------------------------------------------------------------------------------
	-- To-Check PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Eww Yuck Highlight NOTLAZYPLUGIN:
	-- use({
	-- 	"elkowar/yuck.vim",
	-- })

	-- Surround PLAZYPLUGIN: Surround Characters with brackets and functions FIXME
	-- use({
	-- 	"ur4ltz/surround.nvim",
	-- 	config = function()
	-- 		require("user.plugins.vim-surround")
	-- 	end,
	-- 	opt = true,
	-- 	event = "BufRead",
	-- })

	-- checkout medium for this

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
	--
	--  -- TWILIGHT PLUGIN:
	-- use({
	-- 	"folke/twilight.nvim",
	-- 	config = function()
	-- 		require("user.plugins.twilight")
	-- 	end,
	-- })
	--
	--  -- CRATES PLUGIN:
	-- use({
	-- 	"saecki/crates.nvim",
	-- 	event = { "BufRead Cargo.toml" },
	-- 	config = function()
	-- 		require("user.plugins.crates")
	-- 	end,
	-- })
	--
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

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
