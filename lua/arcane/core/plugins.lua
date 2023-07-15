local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

local plugins = {
  -----------------------------------------------------------------------------------------------------------------
  -- General Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Plugin Mangager have lazy manage itself
  {"folke/lazy.nvim"},

  -- Impatient Speed up loading Lua modules in Neovim to improve startup time.
  { "lewis6991/impatient.nvim" },

  -- FileType Easily speed up your neovim startup time!
  { "nathom/filetype.nvim" },

  -- Plenary All the lua functions I don't want to write twice.
  { "nvim-lua/plenary.nvim" },

  -- Neovim color utils
  { "nvim-colortils/colortils.nvim" },

  -- Session Mangment
  { "Shatur/neovim-session-manager" },

  -- Vim-bbye Close Buffers
  { "moll/vim-bbye" },

  -----------------------------------------------------------------------------------------------------------------
  -- UI Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Alpha Dashboard
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
  },

  -- BufferLine As the Name Implies Buffer Line
  { "akinsho/bufferline.nvim" },

  -- Web-DevIcons Adds Icons To Neovim
  { "kyazdani42/nvim-web-devicons" },

  -- Dressing UI Toolkit to select the UI backend (nui, telescope, fzf)
  { "stevearc/dressing.nvim" },

  -- Lualine Status Line
  { "nvim-lualine/lualine.nvim" },

  -- Scrollbar Side Scrollbar
  { "petertriho/nvim-scrollbar" },

  -- NOTIFICATIONS Fancy Notifications
  { "rcarriga/nvim-notify" },

  -- Indent-Backline Indents to make out code better
  { "lukas-reineke/indent-blankline.nvim" },

  -- Nvim-Tree Tree Explorer
  { "kyazdani42/nvim-tree.lua" },

  -- ToggleTerm Better Terminal
  {'akinsho/toggleterm.nvim', version = "*", config = true},

  -- WhichKey Key Popup
  { "folke/which-key.nvim" },

  -- LEGENDARYKEYS Search Keybindings
  { "mrjones2014/legendary.nvim" },

  -- TroubleToggle Track Bugs and highlights
  { "folke/trouble.nvim" },

  -----------------------------------------------------------------------------------------------------------------
  -- Colorscheme Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Rose-Pine
  { "rose-pine/neovim", as = "rose-pine" },

  -- Tokyonight
  { "folke/tokyonight.nvim" },

  --OneDark
  { "navarasu/onedark.nvim" },

  -- Catppuccin
  { "catppuccin/nvim", as = "catppuccin" },

  -- Edge
  { "sainnhe/edge", opt = true },

  -- NightFox
  { "EdenEast/nightfox.nvim", opt = true },

  -----------------------------------------------------------------------------------------------------------------
  -- Lsp Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Lsp-Config enable Lsp
  { "neovim/nvim-lspconfig" },

  -- Mason Lsp, formatter, linters, debuggers installer
  { "williamboman/mason.nvim" },

  -- Mason Config
  { "williamboman/mason-lspconfig.nvim" },

  -- Null-ls: for formatters and linters
  { "jose-elias-alvarez/null-ls.nvim" },

  -- Integrates null_ls with mason
  {"jayp0521/mason-null-ls.nvim"},

  -- Illuminate function names and variables
  { "RRethy/vim-illuminate" },

  -- FIDGET Lsp Loader Progress
  { "j-hui/fidget.nvim", tag = 'legacy' },

  -- Lsp-Signature Function Parameters Helper
  { "ray-x/lsp_signature.nvim" },

  -- LudDev for easer nvim lua development
  { "folke/neodev.nvim" },

  -- Lightbulb Adds code action indicator when code actions are available
  { "kosayoda/nvim-lightbulb" },

  -- Variable type inline hints TODO different languages require different lsp settings
  { "lvimuser/lsp-inlayhints.nvim" },

  -- Bread Crumbs
  { "SmiteshP/nvim-navic" },

  -- SYMBOLS_OUTLINE
  { "simrat39/symbols-outline.nvim" },

  -- renders diagnostics using virtual lines on top of the real line of code.
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

  -----------------------------------------------------------------------------------------------------------------
  -- Telescope Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Telescope Easy Search
  { "nvim-telescope/telescope.nvim" },

  -- Telescope Fuzy Finder
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- Telescope-Media-Supp View Images with Telescope media_files command
  { "nvim-telescope/telescope-media-files.nvim" },

  -- Project For All Your uncompleted Projects
  { "ahmedkhalf/project.nvim" },

  -- Telescope File browser
  { "nvim-telescope/telescope-file-browser.nvim" },

  -- NEOCLIP
  { "AckslD/nvim-neoclip.lua", dependencies = { { "nvim-telescope/telescope.nvim" } } },

  -- UtilSnip Telescope Extension
  { "fhill2/telescope-ultisnips.nvim" },

  -- fzf-lua: Improved fzf.vim written in lua
  { "ibhagwan/fzf-lua" },

  -- Telescope-Dap: Integration for nvim-dap with telescope.nvim
  { "nvim-telescope/telescope-dap.nvim" },

  -- search emoji and other symbols
  { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" },

  -----------------------------------------------------------------------------------------------------------------
  -- Completion And Snippets Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Cmp-Nvim The completion engine plugin
  { "hrsh7th/nvim-cmp" },

  -- Cmp-Buffer buffer completions
  { "hrsh7th/cmp-buffer" },

  -- Cmp-Path path completions
  { "hrsh7th/cmp-path" },

  -- Cmp-Cmdline cmdline completions
  { "hrsh7th/cmp-cmdline" },

  -- Cmp-Lsp Bettter completions than builtin lsp omnifunc
  { "hrsh7th/cmp-nvim-lsp" },

  -- Cmp completions for vim functions
  { "hrsh7th/cmp-omni", dependencies = "nvim-cmp" },

  -- Cmp-LuaSnip snippet completions
  { "saadparwaiz1/cmp_luasnip" },

  -- Emoji completions NOICE
  { "hrsh7th/cmp-emoji" },

  -- Cmp-Lua Add completion for lua vim apis
  { "hrsh7th/cmp-nvim-lua" },

  -- Cmp-Dap: nvim-cmp source for nvim-dap REPL and nvim-dap-ui buffers
  { "rcarriga/cmp-dap" },

  -- Document-Symbols Add document symbols like functions to / search reasults
  { "hrsh7th/cmp-nvim-lsp-document-symbol" },

  -- Signature-Help Add signature help to cmp
  { "hrsh7th/cmp-nvim-lsp-signature-help" },

  -- LuaSnip Snippet Engine
  { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },

  -- Friendly-Snippets A bunch of snippets to use
  { "rafamadriz/friendly-snippets" },

  -- ULtiSnips Snippet Engine
  { "SirVer/ultisnips" },

  -- Ultisnips Get suggestions from ultisnips snippets
  { "quangnguyen30192/cmp-nvim-ultisnips" },

  -- React-Snippets React Snippets
  { "mlaursen/vim-react-snippets" },

  -----------------------------------------------------------------------------------------------------------------
  -- Syntax Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Treesitter Syntax Highlight
  {
	  "nvim-treesitter/nvim-treesitter",
	  run = function()
    		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    		ts_update()
	  end
  },

  -- Todo-Comments Highlight comments and notes
  { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" },

  -- Comments Easier Time Commenting Shit
  { "numToStr/Comment.nvim",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
  },

  -- Treesitter-Context-Comm This is useful when there are embedded languages in certain types of files
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  -- View treesitter information directly in Neovim!
  { "nvim-treesitter/playground" },

  -- AutoPairs
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- AutoTag Use treesitter to autoclose and autorename html tag
  { "windwp/nvim-ts-autotag" },

  -----------------------------------------------------------------------------------------------------------------
  -- Debugging Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Dap: Debug Adapter Protocol client
  { "mfussenegger/nvim-dap" },

  -- Dap-ui: A UI for nvim-dap
  { "rcarriga/nvim-dap-ui" },

  -- Nvim-Dap-VR-text: adds virtual text support to nvim-dap.
  { "theHamsta/nvim-dap-virtual-text" },

  -----------------------------------------------------------------------------------------------------------------
  -- VCS Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Git-Signs
  { "lewis6991/gitsigns.nvim" },

  -- Git Blame
  { "f-person/git-blame.nvim" },

  -- GitLinker
  { "ruifm/gitlinker.nvim" },

  -- GH-Notifications
  { "rlch/github-notifications.nvim" },

  -----------------------------------------------------------------------------------------------------------------
  -- To-Check Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Cy[cle]bu[ffer].nvim
  -- { "ghillb/cybu.nvim" },

  -- Floating file explorer
  -- { "christianchiarulli/lir.nvim" },

  -- Zen Mode Complete Focus
  -- { "folke/zen-mode.nvim" },

  -- Nvim Spectre Search and replace TODO 
  -- { "windwp/nvim-spectre" },

  -- Search The Internet
  -- { "lalitmee/browse.nvim" },

  -- Registers
  -- { "tversteeg/registers.nvim" },

  -- Command Runner
  -- { "is0n/jaq-nvim" },

  -- Code Runner
  -- { "0x100101/lab.nvim", run = "cd js && npm ci" },

  -- Extended increment/decrement plugin
  -- { "monaqa/dial.nvim" },

  -- Matchup extends vim's % key to language-specific words instead of just single characters.
  -- {"andymass/vim-matchup" },

  -- Smooth Scroll
  -- { "karb94/neoscroll.nvim" },

  -- vim slash enhancing in-buffer search experience
  -- { "junegunn/vim-slash" },

  -- REFACTORING The Refactoring library based off the Refactoring book by Martin Fowler
  -- { "ThePrimeagen/refactoring.nvim" },

  --PKGINFO
  -- { "vuki656/package-info.nvim", requires = "MunifTanjim/nui.nvim" },

  -- WebApi Interface
  -- { "mattn/webapi-vim" },

  -- a game to learn vim
  -- {'ThePrimeagen/vim-be-good'}

  -- Show match number and index for searching
  -- use {
  --   "kevinhwang91/nvim-hlslens",
  --   branch = "main",
  --   keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
  --   config = [[require('config.hlslens')]],
  -- }

  -- File search, tag search and more
  -- if vim.g.is_win then
  --   use { "Yggdroot/LeaderF", cmd = "Leaderf" }
  -- else
  --   use { "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" }
  -- end

  -- Nvim-Gps: statusline component that shows what scope you are working inside
  -- { "SmiteshP/nvim-gps" },

  -- Code Outline alternative
  -- { 'stevearc/aerial.nvim' },

  -- Session
  -- use ({"rmagatti/auto-session"},
  -- use ({"rmagatti/session-lens"},

  -- Eww Yuck Highlight
  -- {
  -- 	"elkowar/yuck.vim",
  -- },

  -- Surround: Surround Characters with brackets and functions FIXME
  -- {
  -- 	"ur4ltz/surround.nvim",
  -- 	config = function()
  -- 		require("user.plugins.syntax.vim-surround")
  -- 	end,
  -- 	opt = true,
  -- 	event = "BufRead",
  -- },

  --  -- NEOGEN Create annotations with one keybind
  -- "danymat/neogen")
  --
  --  -- YODE
  -- "hoschi/yode-nvim")
  --
  --  -- OrgMode
  -- "jceb/vim-orgmode")
  --
  --  -- Maven
  -- "mikelue/vim-maven-plugin")
  --
  --  -- AnyFold
  -- "pseewald/vim-anyfold")
  --
  --  --GKEEP-NOTES
  -- { "stevearc/gkeep.nvim", run = ":UpdateRemotePlugins" },
  --
  --  --INSTANT
  -- "jbyuki/instant.nvim")
  --
  --  -- TWILIGHT
  -- {
  -- 	"folke/twilight.nvim",
  -- 	config = function()
  -- 		require("user.plugins.zen.twilight")
  -- 	end,
  -- },
  --
  --  -- CRATES
  -- {
  -- 	"saecki/crates.nvim",
  -- 	event = { "BufRead Cargo.toml" },
  -- 	config = function()
  -- 		require("user.plugins.crates")
  -- 	end,
  -- },
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
  -- {
  -- 	"turbio/bracey.vim",
  -- 	cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
  -- 	run = "npm install --prefix server",
  -- },
  --
  -- -- Colorizer
  -- { "NvChad/nvim-colorizer.lua" },
  --
  --
  -- Highlight URLs inside vim
  -- { "itchyny/vim-highlighturl", event = "VimEnter" }
  --
  -- For Windows and Mac, we can open an URL in the browser. For Linux, it may
  -- not be possible since we maybe in a server which disables GUI.
  -- if vim.g.is_win or vim.g.is_mac then
  --   -- open URL in browser
  --   use { "tyru/open-browser.vim", event = "VimEnter" }
  -- end
  --
  -- Automatic insertion and deletion of a pair of characters
  -- { "Raimondi/delimitMate", event = "InsertEnter" }

  -- Comment plugin
  -- { "tpope/vim-commentary", event = "VimEnter" }
  --
  --
  -- Zk Note taking assistant
  -- { "mickael-menu/zk-nvim" },
  --
  --
  -- Json Schemas
  -- { "b0o/SchemaStore.nvim" },

  -- Java
  -- { "mfussenegger/nvim-jdtls" },

  -- Typescript TODO: set this up, also add keybinds to ftplugin
  -- { "jose-elias-alvarez/typescript.nvim" },

  -- Markdown
  -- { "iamcco/markdown-preview.nvim", run = "cd app && npm install", ft = "markdown" },

  -- Inlay Hints
  -- {"simrat39/inlay-hints.nvim"},

  -- Bookmarks
  -- { "tom-anders/telescope-vim-bookmarks.nvim" },
  --
  -- Treesitter-TextObj Syntax aware text-objects, select, move, swap, and peek support.
  -- { "nvim-treesitter/nvim-treesitter-textobjects" },

  -- Treesitter-TextSubj Location and syntax aware text objects which *do what you mean*
  -- { "RRethy/nvim-treesitter-textsubjects" },

  -- Surround code
  -- { "kylechui/nvim-surround" },

  -- Tab out of things
  -- { "abecodes/tabout.nvim", require = { "nvim-treesitter" } },

  -- Motion jump anywhere in a document with as few keystrokes as possible
  -- { "phaazon/hop.nvim" },

  -- TreeHopper Plugin that provides region selection using hints on the abstract syntax tree of a document.
  -- { "mfussenegger/nvim-treehopper" },

  -- Treesitter-Context: Show code context FIXME
  -- { "romgrk/nvim-treesitter-context" },

  -- VR-COMMENTS-CONTEXT : Vr Function Context as Comments
  -- {"haringsrob/nvim_context_vt"},

  -- HEXOKINASE Virtual Color Identifier
  -- {
  --   "rrethy/vim-hexokinase",
  --   run = "make hexokinase",
  --   opt = true,
  --   ft = { "css", "scss", "sass", "xml", "js", "jsx", "conf", "txt", "lua" },
  --   cmd = "hexokinase",
  -- },
  --
  -- Gist
  -- { "mattn/vim-gist" },

  -- Github
  -- { "pwntester/octo.nvim" },

  -- Github Integration
  -- { "ldelossa/gh.nvim" },

  -- Diff-View
  -- { "sindrets/diffview.nvim" },

  -- Git-Messenger
  -- { "rhysd/git-messenger.vim" },

  -- Neogit
  -- { "TimUntersberger/neogit" },

  -- Vgit
  -- { "tanvirtin/vgit.nvim" },
}

reload("lazy").setup(plugins, opts)


