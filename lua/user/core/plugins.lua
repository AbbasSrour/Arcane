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
	-- General PLUGINS:
	-- Packer PLUGIN: The Plugin Manager
	use({
		"wbthomason/packer.nvim",
		-- event = "Don't Do IT",
	})
	-- Plenary PLUGIN: All the lua functions I don't want to write twice.
	use({
		"nvim-lua/plenary.nvim",
		-- event = "Don't Do It",
	})
	-- Vim-bbye PLUGIN: Close Buffers
	use({
		"moll/vim-bbye",
		-- event = "No need",
	})
	-- FixCursorHold PLUGIN: Result in more snappiness for plugins using those events, such as: coc.nvim, vim-gutter...
	use({
		"antoinemadec/FixCursorHold.nvim",
		config = function()
			vim.g.cursorhold_updatetime = 100
		end,
		-- event = "No Need"
	})
	-- Impatient PLUGIN: Speed up loading Lua modules in Neovim to improve startup time.
	use({
		"lewis6991/impatient.nvim",
		config = function()
			require("user.configs.impatient")
		end,
		-- event = "No need"
	})

	-- UI PLUGINS:
	-- Popup PLUGIN:
	use({
		"nvim-lua/popup.nvim",
		-- event = "VimEnter",
	})
	-- Dressing PLUGIN:
	use({
		"stevearc/dressing.nvim",
		-- event = "VimEnter",
	})
	-- Web-DevIcons PLUGIN:
	use({
		"kyazdani42/nvim-web-devicons",
		-- event = "VimEnter",
	})
	-- BufferLine PLUGIN:
	use({
		"akinsho/bufferline.nvim",
		config = function()
			require("user.configs.bufferline")
		end,
		-- event = "VimEnter",
	})
	-- Lualine PLUGIN: FIX:
	use({
		"nvim-lualine/lualine.nvim",
		-- config = function()
		-- 	require("user.configs.lualine.init")
		-- end,
		-- event = "BufReadPre",
	})
	-- Alpha PLUGIN:
	use({
		"goolord/alpha-nvim",
		config = function()
			require("user.configs.alpha")
		end,
		-- event = "VimEnter",
	})
	-- Scrollbar PLUGIN:
	use({
		"petertriho/nvim-scrollbar",
		config = function()
			require("user.configs.scrollbar")
		end,
		-- event = "VimEnter",
	})
	-- NOTIFICATIONS PLUGIN:
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("user.configs.notification")
		end,
		-- event = "VimEnter",
	})

	-- Telescope PLUGINS:
	-- Telescope PLUGIN:
	use({
		"nvim-telescope/telescope.nvim",
    config = function ()
      require("user.configs.telescope")
    end,
    -- opt = "true",
		-- cmd = "Telescope",
	})
	-- Telescope-Media-Supp PLUGIN:
	use({
		"nvim-telescope/telescope-media-files.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		-- config = function()
		-- 	require("telescope").extensions.media_files.media_files()
		-- end,
	})

	-- General PLUGINS:
	-- FILETYPE PLUGIN:
	use("nathom/filetype.nvim")
	-- REFACTORING PLUGIN:
	use("ThePrimeagen/refactoring.nvim")
	-- JSON-SCHEME-STORE PLUGIN:
	use("b0o/schemastore.nvim")
	-- NEOGEN PLUGIN:
	use("danymat/neogen")
	-- HARPOON PLUGIN:
	use("ThePrimeagen/harpoon")
	-- STARTUP-TIME-TEST PLUGIN:
	use("dstein64/vim-startuptime")
	-- FIDGET PLUGIN:
	use({ "j-hui/fidget.nvim", event = "BufReadPre" })
	-- YODE PLUGIN:
	use("hoschi/yode-nvim")
	-- OrgMode PLUGIN:
	use("jceb/vim-orgmode")
	-- Maven PLUGIN:
	use("mikelue/vim-maven-plugin")
	-- AnyFold PLUGIN:
	use("pseewald/vim-anyfold")
	--GKEEP-NOTES PLUGIN:
	use({ "stevearc/gkeep.nvim", run = ":UpdateRemotePlugins" })
	--INSTANT PLUGIN:
	use("jbyuki/instant.nvim")
	-- WhichKey PLUGIN:
	use({
		"folke/which-key.nvim",
		config = function()
			require("user.configs.whichkey")
		end,
	})
	-- LEGENDARYKEYS PLUGIN:
	use({
		"mrjones2014/legendary.nvim",
		config = function()
			require("user.configs.legendarykeys")
		end,
	})
	-- AutoPairs PLUGIN:
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("user.configs.autopairs")
		end,
	})
	-- Comments PLUGIN:
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("user.configs.comment")
		end,
	})
	-- Nvim-Tree PLUGIN:
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("user.configs.nvim-tree")
		end,
	})
	-- ToggleTerm PLUGIN:
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("user.configs.toggleterm")
		end,
	})
	-- Project-Manager PLUGIN:
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("user.configs.project")
		end,
	})
	-- Indent-Backline PLUGIN:
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("user.configs.indentline")
		end,
	})
	-- Todo-Comments PLUGIN:
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("user.configs.todo")
		end,
	})
	-- TroubleToggle PLUGIN:
	use({
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
		config = function()
			require("user.configs.trouble")
		end,
	})
	-- AutoTag PLUGIN: Use treesitter to autoclose and autorename html tag
	use({
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("user.configs.autotag")
		end,
	})
	-- HEXOKINASE PLUGIN:
	use({
		"rrethy/vim-hexokinase",
		run = "make hexokinase",
		config = function()
			require("user.configs.hexokinase")
		end,
	})
	-- SYMBOLS_OUTLINE PLUGIN:
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			require("user.configs.symbolsOutline").setup()
		end,
	})
	-- PERSISTANCE PLUGIN:
	use({
		"folke/persistence.nvim",
		event = "BufReadPre",
		module = "persistence",
		config = function()
			require("user.configs.persistance")
		end,
	})
	-- TS-RAINBOW-BRACKETS PLUGIN:
	-- use({
	-- 	"p00f/nvim-ts-rainbow",
	-- 	config = function()
	-- 		require("user.configs.rainbow")
	-- 	end,
	-- })
	-- TWILIGHT PLUGIN:
	use({
		"folke/twilight.nvim",
		config = function()
			require("user.configs.twilight")
		end,
	})
	-- CRATES PLUGIN:
	use({
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("user.configs.crates")
		end,
	})
	--PKGINFO PLUGIN:
	use({
		"vuki656/package-info.nvim",
		requires = "MunifTanjim/nui.nvim",
		config = function()
			require("user.configs.pkginfo")
		end,
	})
	-- VR-COMMENTS-CONTEXT PLUGIN:
	use({
		"haringsrob/nvim_context_vt",
		config = function()
			require("user.configs.vrcontext")
		end,
	})
	-- NUMB PLUGIN:
	use({
		"nacro90/numb.nvim",
		config = function()
			require("user.configs.numbpeek")
		end,
	})
	-- SNIPRUN PLUGIN:
	-- use {
	--       "michaelb/sniprun",
	--       run = "bash install.sh",
	--       config = function()
	--         require("config.sniprun").setup()
	--       end,
	-- }
	-- BRACEY-LIVE-SERVER PLUGIN:
	use({
		"turbio/bracey.vim",
		cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
		run = "npm install --prefix server",
	})
	-- NEOCLIP PLUGIN:
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "tami5/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("user.configs.neoclip")
		end,
	})
	--GITLINKER PLUGIN:
	use({
		"ruifm/gitlinker.nvim",
		config = function()
			require("user.configs.linker")
		end,
	})
	-- Surround PLUGIN: FIXME:
	use({
		"ur4ltz/surround.nvim",
		config = function()
			require("user.configs.vim-surround")
		end,
	})
	-- Copilot PLUGIN:
	use({
		"github/copilot.vim",
		config = function()
			vim.cmd([[imap <silent><script><expr> <C-L> copilot#Accept("\<CR>")]])
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_filetypes = {
				["*"] = true,
				gitcommit = false,
				NeogitCommitMessage = false,
			}
		end,
	})

	-- Colorschemes PLUGINS:
	-- Tokyonight PLUGIN:
	use({
		"folke/tokyonight.nvim",
		config = function()
			require("user.core.colorscheme").tokyonight()
		end,
	})
	-- Rose-Pine PLUGIN:
	use({
		"rose-pine/neovim",
		config = function()
			require("user.core.colorscheme").rose_pine()
		end,
	})
	--OneDark PLUGIN:
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("user.core.colorscheme").onedark()
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

	-- Cmp PLUGINS:
	-- Cmp-Nvim PLUGIN: The completion plugin
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("user.configs.cmp")
		end,
	})
	-- TABNINE PLUGIN:
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
		config = function()
			require("user.configs.tabnine")
		end,
	})
	-- Cmp-Buffer PLUGIN: buffer completions
	use("hrsh7th/cmp-buffer")
	-- Cmp-Path PLUGIN: path completions
	use("hrsh7th/cmp-path")
	-- Cmp-Cmdline PLUGIN:
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	-- Cmp-LuaSnip PLUGIN:
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	-- Cmp-Lsp PLUGIN:
	use("hrsh7th/cmp-nvim-lsp")
	-- Cmp-Lua PLUGIN:
	use("hrsh7th/cmp-nvim-lua")
	-- Document-Symbols PLUGIN:
	use("hrsh7th/cmp-nvim-lsp-document-symbol")

	-- Snippets PLUGINS:
	-- LuaSnip PLUGIN:
	use("L3MON4D3/LuaSnip") --snippet engine
	-- Friendly-Snippets PLUGIN:
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	-- React-Snippets PLUGIN:
	use("mlaursen/vim-react-snippets")

	-- Lsp PLUGINS:
	-- Lsp-Config PLUGIN:
	use("neovim/nvim-lspconfig") -- enable LSP
	-- Lsp-Installer PLUGIN:
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	-- Nlsp-Settings PLUGIN:
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	-- Null-ls PLUGIN:
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	-- Function-Signature PLUGIN:
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("user.configs.lspsignature")
		end,
	})
	-- Lsp-Saga PLUGIN:
	use({
		"tami5/lspsaga.nvim",
		config = function()
			require("user.configs.lspsaga")
		end,
	})
	-- CodeActionMenu PLUGIN:
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
		config = function()
			require("user.configs.codeactions").setup()
		end,
	})

	-- Treesitter PLUGINS:
	-- Treesitter PLUGIN:
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("user.configs.treesitter")
		end,
	})
	-- Treesitter-TextObj PLUGIN:
	use("nvim-treesitter/nvim-treesitter-textobjects")
	-- Treesitter-Context-Comm PLUGIN:
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- Treesitter-Hint-TextObj PLUGIN:
	use("mfussenegger/nvim-ts-hint-textobject")
	-- Treesitter-TextSubj PLUGIN:
	use("RRethy/nvim-treesitter-textsubjects")
	-- Treesitter-Context PLUGIN:
	use({
		"romgrk/nvim-treesitter-context",
		config = function()
			require("user.configs.tscontext")
		end,
	})

	-- Git PLUGINS:
	-- Git-Signs PLUGIN:
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("user.configs.gitsigns")
		end,
	})
	-- Diff-View PLUGIN:
	use({
		"sindrets/diffview.nvim",
		config = function()
			require("user.configs.gitdiff")
		end,
	})
	-- Git-Messenger PLUGIN:
	-- use({
	-- 	"rhysd/git-messenger.vim",
	-- 	config = function()
	-- 		require("user.configs.gitmessenger")
	-- 	end,
	-- })
	-- GH-Notifications PLUGIN:
	use({
		"rlch/github-notifications.nvim",
		config = function()
			require("user.configs.githubnotifications")
		end,
	})
	-- Neogit PLUGIN:
	-- use({
	-- 	"TimUntersberger/neogit",
	-- 	cmd = "Neogit",
	-- 	config = function()
	-- 		require("user.configs.neogitplug")
	-- 	end,
	-- })
	-- Vgit PLUGIN:
	-- use({
	-- 	"tanvirtin/vgit.nvim",
	-- 	event = "BufWinEnter",
	-- 	config = function()
	-- 		require("user.confgs.vgitplug")
	-- 	end,
	-- })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
