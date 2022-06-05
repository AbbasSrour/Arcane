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
	-- Performance Increasing PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Impatient Speed up loading Lua modules in Neovim to improve startup time.
	use({
		"lewis6991/impatient.nvim",
	})

	-- FileType Easily speed up your neovim startup time!
	use({
		"nathom/filetype.nvim",
		config = function()
			require("user.plugins.misc.filetype")
		end,
	})

	-- STARTUP-TIME-TEST Check startuptime
	use({
		"dstein64/vim-startuptime",
		opt = true,
		cmd = "StartupTime",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- UI PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Popup Implement features from vim popup apis
	use({
		requires = { "nvim-lua/plenary.nvim" },
		"nvim-lua/popup.nvim",
	})

	-- Dressing UI Toolkit to select the UI backend (nui, telescope, fzf)
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("user.plugins.ui.dressing")
		end,
	})

	-- Web-DevIcons Adds Icons To Neovim
	use({
		"kyazdani42/nvim-web-devicons",
	})

	-- Alpha Dashboard
	use({
		"goolord/alpha-nvim",
		config = function()
			require("user.plugins.ui.alpha")
		end,
	})

	-- BufferLine As the Name Implies Buffer Line
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("user.plugins.ui.bufferline")
		end,
	})

	-- Lualine Status Line
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("user.plugins.lualine")
		end,
	})

	-- Scrollbar Side Scrollbar
	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("user.plugins.ui.scrollbar")
		end,
		opt = true,
		event = "BufRead",
	})

	-- NOTIFICATIONS Fancy Notifications
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("user.plugins.ui.notify")
		end,
	})

	-- Indent-Backline Indents to make out code better
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("user.plugins.ui.indentline")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Nvim-Gps: statusline component that shows what scope you are working inside
	use({
		"SmiteshP/nvim-gps",
		config = function()
			require("user.plugins.ui.gps")
		end,
		opt = true,
		event = "BufRead",
	})

	--  -- TS-RAINBOW-BRACKETS
	-- -- use({
	-- -- 	"p00f/nvim-ts-rainbow",
	-- -- 	config = function()
	-- -- 		require("user.plugins.rainbow")
	-- -- 	end,
	-- -- })

	-----------------------------------------------------------------------------------------------------------------
	-- Colorscheme PLUGINS:
	-----------------------------------------------------------------------------------------------------------------
	-- Rose-Pine
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("user.utils.colorscheme").rose_pine()
		end,
	})

	-- Tokyonight
	use({
		"folke/tokyonight.nvim",
		config = function()
			require("user.utils.colorscheme").tokyonight()
		end,
	})

	--OneDark
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("user.utils.colorscheme").onedark()
		end,
	})

	-- Catppuccin
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require("user.utils.colorscheme").catppuccin()
		end,
	})

	-- Cobalt2
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
	-- Telescope Easy Search
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("user.plugins.search.telescope")
		end,
		-- opt = true,
		-- cmd = { "Telescope" },
		-- event = "BufRead",
	})

	-- Telescope Fuzy Finder
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	-- Telescope-Media-Supp View Images with Telescope media_files command
	use({
		"nvim-telescope/telescope-media-files.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" } },
	})

	-- Project For All Your uncompleted Projects
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("user.plugins.misc.project")
		end,
	})

	-- UtilSnip Telescope Extension
	use({
		"fhill2/telescope-ultisnips.nvim",
	})

	-- NEOCLIP
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "tami5/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("user.plugins.search.neoclip")
		end,
		opt = true,
		event = "BufRead",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- Lsp PLUGINS:
	-----------------------------------------------------------------------------------------------------------------
	-- Lsp-Config -- enable Lsp
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("user.plugins.lsp")
		end,
		-- opt = true,
		-- event = "BufRead",
	})

	-- Lsp-Installer -- simple to use language server installer
	use({
		"williamboman/nvim-lsp-installer",
		-- opt = true,
		-- event = "BufRead",
	})

	-- Nlsp-Settings: language server settings defined in json
	use({
		"tamago324/nlsp-settings.nvim",
		opt = true,
		event = "BufRead",
	})

	-- Null-ls -- for formatters and linters
	use({
		"jose-elias-alvarez/null-ls.nvim",
		opt = true,
		event = "BufRead",
	})

	-- Function-Signature Function Parameters
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("user.plugins.lsp.plugins.lspsignature")
		end,
		opt = true,
		event = "BufRead",
	})

	-- FIDGET Lsp Loader Progress
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("user.plugins.lsp.plugins.fidget")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Lightbulb Adds code action indicator when code actions are available
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
	-- LuaSnip Snippet Engine
	use({
		"L3MON4D3/LuaSnip",
		opt = true,
		event = "BufRead",
	})

	-- Friendly-Snippets A bunch of snippets to use
	use({
		"rafamadriz/friendly-snippets",
		opt = true,
		event = "BufRead",
	})

	-- ULtiSnips Snippet Engine
	use({
		"SirVer/ultisnips",
		opt = true,
		event = "BufRead",
	})

	-- React-Snippets React Snippets
	use({
		"mlaursen/vim-react-snippets",
		opt = true,
		event = "BufRead",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- Cmp PLUGINS:
	-----------------------------------------------------------------------------------------------------------------
	-- Cmp-Nvim The completion engine plugin
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("user.plugins.completions.cmp")
		end,
		-- opt = true,
		-- event = "BufRead",
	})

	-- Cmp-Buffer buffer completions
	use({ "hrsh7th/cmp-buffer" })

	-- Cmp-Path path completions
	use({ "hrsh7th/cmp-path" })

	-- Cmp-Cmdline cmdline completions
	use({ "hrsh7th/cmp-cmdline" })

	-- Cmp-LuaSnip snippet completions
	use({ "saadparwaiz1/cmp_luasnip" })

	-- Cmp-Lsp Bettter completions than builtin lsp omnifunc
	use({ "hrsh7th/cmp-nvim-lsp" })

	-- Cmp-Lua Add completion for lua vim apis
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Document-Symbols Add document symbols like functions to / search reasults
	use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })

	-- Signature-Help Add signature help to cmp
	use({ "hrsh7th/cmp-nvim-lsp-signature-help" })

	-- Ultisnips Get suggestions from ultisnips snippets
	use({ "quangnguyen30192/cmp-nvim-ultisnips" })

	-- TABNINE
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

	-- Copilot
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

	-----------------------------------------------------------------------------------------------------------------
	-- Treesitter PLUGINS:
	-----------------------------------------------------------------------------------------------------------------
	-- Treesitter Syntax Highlight
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("user.plugins.syntax.treesitter")
		end,
		-- opt = true,
		-- event = "BufRead",
	})

	-- Treesitter-TextObj Syntax aware text-objects, select, move, swap, and peek support.
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		opt = true,
		event = "BufRead",
	})

	-- Treesitter-Context-Comm This is useful when there are embedded languages in certain types of files
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		opt = true,
		event = "BufRead",
	})

	-- TreeHopper Plugin that provides region selection using hints on the abstract syntax tree of a document.
	use({
		"mfussenegger/nvim-treehopper",
		opt = true,
		event = "BufRead",
	})

	-- Treesitter-TextSubj Location and syntax aware text objects which *do what you mean*
	use({
		"RRethy/nvim-treesitter-textsubjects",
		opt = true,
		event = "BufRead",
	})

	-- AutoPairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("user.plugins.syntax.autopairs")
		end,
		opt = true,
		event = "BufRead",
	})

	-- AutoTag Use treesitter to autoclose and autorename html tag
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("user.plugins.syntax.autotag")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Treesitter-Context: Show code context FIXME
	use({
		"romgrk/nvim-treesitter-context",
		config = function()
			require("user.plugins.syntax.tscontext")
		end,
		opt = true,
		event = "BufRead",
	})

	-- VR-COMMENTS-CONTEXT : Vr Function Context as Comments
	use({
		"haringsrob/nvim_context_vt",
		config = function()
			require("user.plugins.syntax.vrcontext")
		end,
		opt = true,
		event = "BufRead",
	})

	-- SYMBOLS_OUTLINE
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			require("user.plugins.syntax.symbolsOutline").setup()
		end,
		cmd = "SymbolsOutline",
		opt = true,
	})

	-- Todo-Comments Highlight comments and notes
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("user.plugins.syntax.todo")
		end,
		opt = true,
		event = "BufRead",
	})

	-- Comments Easier Time Commenting Shit
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("user.plugins.syntax.comment")
		end,
		opt = true,
		event = "BufRead",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- Debugging PLUGINS:
	-----------------------------------------------------------------------------------------------------------------
	-- Dap: Debug Adapter Protocol client
	use({
		"mfussenegger/nvim-dap",
	})

	-- Dap-ui: A UI for nvim-dap
	use({
		"rcarriga/nvim-dap-ui",
	})

	-- Nvim-Dap-VR-text: adds virtual text support to nvim-dap.
	use({
		"theHamsta/nvim-dap-virtual-text",
	})

	-- Telescope-Dap: Integration for nvim-dap with telescope.nvim
	use({
		"nvim-telescope/telescope-dap.nvim",
	})

	-- fzf-lua: Improved fzf.vim written in lua
	use({
		"ibhagwan/fzf-lua",
	})

	-- Cmp-Dap: nvim-cmp source for nvim-dap REPL and nvim-dap-ui buffers
	use({
		"rcarriga/cmp-dap",
	})

	-----------------------------------------------------------------------------------------------------------------
	-- General PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- WhichKey Key Popup
	use({
		"folke/which-key.nvim",
		config = function()
			require("user.plugins.misc.whichkey")
		end,
	})

	-- LEGENDARYKEYS Search Keybindings
	use({
		"mrjones2014/legendary.nvim",
		config = function()
			require("user.plugins.misc.legendarykeys")
		end,
	})

	-- Nvim-Tree Tree Explorer
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

	-- ToggleTerm Better Terminal
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("user.plugins.ui.toggleterm")
		end,
		opt = true,
		cmd = { "ToggleTerm", "ToggleTermToggleAll", "TermExec" },
		keys = "<C-t>",
	})

	-- TroubleToggle Track Bugs and highlights
	use({
		"folke/trouble.nvim",
		config = function()
			require("user.plugins.ui.trouble")
		end,
		opt = true,
		cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
	})

	-- HEXOKINASE Virtual Color Identifier
	use({
		"rrethy/vim-hexokinase",
		run = "make hexokinase",
		config = function()
			require("user.plugins.syntax.hexokinase")
		end,
		opt = true,
		ft = { "css", "scss", "sass", "xml", "js", "jsx", "conf", "txt", "lua" },
		cmd = "hexokinase",
	})

	-- Session Manager Save current session
	use({
		"Shatur/neovim-session-manager",
		config = function()
			require("user.plugins.misc.session-manager")
		end,
	})

	-- NUMB Jump to a specific line with :x
	use({
		"nacro90/numb.nvim",
		config = function()
			require("user.plugins.misc.numbpeek")
		end,
		opt = true,
		event = "BufRead",
	})

	--  -- REFACTORING The Refactoring library based off the Refactoring book by Martin Fowler
	-- use({
	--    "ThePrimeagen/refactoring.nvim",
	--    opt = true,
	--    event = "BufRead"
	--  })
	--
	--  --PKGINFO
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
	-- Git-Signs
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("user.plugins.git.gitsigns")
		end,
		opt = true,
		event = "BufRead",
	})

	-- GH-Notifications
	use({
		"rlch/github-notifications.nvim",
		config = function() end,
		-- opt = "true",
		-- event = "BufRead",
	})

	-- Github Integration
	-- use({
	-- 	"ldelossa/gh.nvim",
	-- })
	--
	--  -- Diff-View
	-- use({
	-- 	"sindrets/diffview.nvim",
	-- 	config = function()
	-- 		require("user.plugins.gitdiff")
	-- 	end,
	-- })
	--
	--  -- Git-Messenger
	-- -- use({
	-- -- 	"rhysd/git-messenger.vim",
	-- -- 	config = function()
	-- -- 		require("user.plugins.gitmessenger")
	-- -- 	end,
	-- -- })
	--
	--  -- Neogit
	-- -- use({
	-- -- 	"TimUntersberger/neogit",
	-- -- 	cmd = "Neogit",
	-- -- 	config = function()
	-- -- 		require("user.plugins.neogitplug")
	-- -- 	end,
	-- -- })
	--
	--  -- Vgit
	-- use({
	-- 	"tanvirtin/vgit.nvim",
	-- 	event = "BufWinEnter",
	-- 	config = function()
	-- 		require("user.confgs.vgitplug")
	-- 	end,
	-- })
	--
	-- Octo
	-- use({"pwntester/octo.nvim"})
	--
	--  --GITLINKER
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
	-- Packer The Plugin Manager
	use({
		"wbthomason/packer.nvim",
	})

	-- Plenary All the lua functions I don't want to write twice.
	use({
		"nvim-lua/plenary.nvim",
	})

	-- Vim-bbye Close Buffers
	use({
		"moll/vim-bbye",
	})

	-- FixCursorHold Results in more snappiness for some plugins
	use({
		"antoinemadec/FixCursorHold.nvim",
		config = function()
			vim.g.cursorhold_updatetime = 100
		end,
	})

	-----------------------------------------------------------------------------------------------------------------
	-- To-Check PLUGINS:
	-----------------------------------------------------------------------------------------------------------------

	-- Eww Yuck Highlight
	-- use({
	-- 	"elkowar/yuck.vim",
	-- })

	-- Surround: Surround Characters with brackets and functions FIXME
	-- use({
	-- 	"ur4ltz/surround.nvim",
	-- 	config = function()
	-- 		require("user.plugins.syntax.vim-surround")
	-- 	end,
	-- 	opt = true,
	-- 	event = "BufRead",
	-- })

	-- checkout medium for this

	--  -- JSON-SCHEME-STORE
	-- use("b0o/schemastore.nvim")
	--
	--  -- NEOGEN Create annotations with one keybind
	-- use("danymat/neogen")
	--
	--  -- HARPOON
	-- use("ThePrimeagen/harpoon")
	--
	--
	--  -- YODE
	-- use("hoschi/yode-nvim")
	--
	--  -- OrgMode
	-- use("jceb/vim-orgmode")
	--
	--  -- Maven
	-- use("mikelue/vim-maven-plugin")
	--
	--  -- AnyFold
	-- use("pseewald/vim-anyfold")
	--
	--  --GKEEP-NOTES
	-- use({ "stevearc/gkeep.nvim", run = ":UpdateRemotePlugins" })
	--
	--  --INSTANT
	-- use("jbyuki/instant.nvim")
	--
	--
	--  -- TWILIGHT
	-- use({
	-- 	"folke/twilight.nvim",
	-- 	config = function()
	-- 		require("user.plugins.zen.twilight")
	-- 	end,
	-- })
	--
	--  -- CRATES
	-- use({
	-- 	"saecki/crates.nvim",
	-- 	event = { "BufRead Cargo.toml" },
	-- 	config = function()
	-- 		require("user.plugins.crates")
	-- 	end,
	-- })
	--
	--
	--  -- SNIPRUN
	-- -- use {
	-- --       "michaelb/sniprun",
	-- --       run = "bash install.sh",
	-- --       config = function()
	-- --         require("config.sniprun").setup()
	-- --       end,
	-- -- }
	--
	--  -- BRACEY-LIVE-SERVER
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
