local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
    prompt_border = "rounded",
  },
}

return packer.startup(function(use)
  -----------------------------------------------------------------------------------------------------------------
  -- General Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Plugin Mangager Have packer manage itself
  use({ "wbthomason/packer.nvim" })

  -- Impatient Speed up loading Lua modules in Neovim to improve startup time.
  use({ "lewis6991/impatient.nvim" })

  -- FileType Easily speed up your neovim startup time!
  use({ "nathom/filetype.nvim" })

  -- Plenary All the lua functions I don't want to write twice.
  use({ "nvim-lua/plenary.nvim" })

  -- Vim-bbye Close Buffers
  use({ "moll/vim-bbye" })

  -- FixCursorHold Results in more snappiness for some plugins
  use({ "antoinemadec/FixCursorHold.nvim" })

  -- Zk Note taking assistant
  use({ "mickael-menu/zk-nvim" })

  -- Neovim color utils
  use({ "nvim-colortils/colortils.nvim" })

  -- Search The Internet
  use({ "lalitmee/browse.nvim" })

  -- Registers
  -- use({ "tversteeg/registers.nvim" })

  -- Nvim Spectre Projects
  use({ "windwp/nvim-spectre" })

  -- Session Mangment
  use({ "Shatur/neovim-session-manager" })

  -- Command Runner
  use({ "is0n/jaq-nvim" })

  -- Code Runner
  use({ "0x100101/lab.nvim", run = "cd js && npm ci" })

  -- Extended increment/decrement plugin
  use({ "monaqa/dial.nvim" })

  -- NUMB Jump to a specific line with :x
  use({ "nacro90/numb.nvim" })

  -- Matchup extends vim's % key to language-specific words instead of just single characters.
  use({ "andymass/vim-matchup" })

  -- Smooth Scroll
  use({ "karb94/neoscroll.nvim" })

  -- vim slash enhancing in-buffer search experience
  use({ "junegunn/vim-slash" })

  -- REFACTORING The Refactoring library based off the Refactoring book by Martin Fowler
  -- use({ "ThePrimeagen/refactoring.nvim" })

  --PKGINFO
  -- use({ "vuki656/package-info.nvim", requires = "MunifTanjim/nui.nvim" })

  -- WebApi Interface
  use({ "mattn/webapi-vim" })

  -----------------------------------------------------------------------------------------------------------------
  -- UI Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Popup Implement features from vim popup apis
  use({ "nvim-lua/popup.nvim", requires = { "nvim-lua/plenary.nvim" } })

  -- Dressing UI Toolkit to select the UI backend (nui, telescope, fzf)
  use({ "stevearc/dressing.nvim" })

  -- Web-DevIcons Adds Icons To Neovim
  use({ "kyazdani42/nvim-web-devicons" })

  -- Alpha Dashboard
  use({ "goolord/alpha-nvim" })

  -- BufferLine As the Name Implies Buffer Line
  use({ "akinsho/bufferline.nvim" })

  -- Lualine Status Line
  use({ "nvim-lualine/lualine.nvim" })

  -- Scrollbar Side Scrollbar
  use({ "petertriho/nvim-scrollbar" })

  -- NOTIFICATIONS Fancy Notifications
  use({ "rcarriga/nvim-notify" })

  -- Cy[cle]bu[ffer].nvim
  use({ "ghillb/cybu.nvim" })

  -- Indent-Backline Indents to make out code better
  use({ "lukas-reineke/indent-blankline.nvim" })

  -- Nvim-Tree Tree Explorer
  use({ "kyazdani42/nvim-tree.lua" })

  -- Floating file explorer
  use({ "christianchiarulli/lir.nvim" })

  -- ToggleTerm Better Terminal
  use({ "akinsho/toggleterm.nvim" })

  -- Zen Mode Complete Focus
  use({ "folke/zen-mode.nvim" })

  -- WhichKey Key Popup
  use({ "folke/which-key.nvim" })

  -- LEGENDARYKEYS Search Keybindings
  use({ "mrjones2014/legendary.nvim" })

  -- TroubleToggle Track Bugs and highlights
  use({ "folke/trouble.nvim" })

  -----------------------------------------------------------------------------------------------------------------
  -- Colorscheme Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Rose-Pine
  use({ "rose-pine/neovim", as = "rose-pine" })

  -- Tokyonight
  use({ "folke/tokyonight.nvim" })

  --OneDark
  use({ "navarasu/onedark.nvim" })

  -- Catppuccin
  use({ "catppuccin/nvim", as = "catppuccin" })

  -----------------------------------------------------------------------------------------------------------------
  -- Lsp Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Lsp-Config enable Lsp
  use({ "neovim/nvim-lspconfig" })

  -- Mason Lsp, formatter, linters, debuggers installer
  use({ "williamboman/mason.nvim" })

  -- Mason Config
  use({ "williamboman/mason-lspconfig.nvim" })

  -- Null-ls: for formatters and linters
  use({ "jose-elias-alvarez/null-ls.nvim" })

  -- Lsp-Signature Function Parameters Helper
  use({ "ray-x/lsp_signature.nvim" })

  -- Bread Crumbs
  use({ "SmiteshP/nvim-navic" })

  -- SYMBOLS_OUTLINE
  use({ "simrat39/symbols-outline.nvim" })

  -- Json Schemas
  use({ "b0o/SchemaStore.nvim" })

  -- LudDev for easer nvim lua development
  use({ "folke/neodev.nvim" })

  -- FIDGET Lsp Loader Progress
  use({ "j-hui/fidget.nvim" })

  -- Lightbulb Adds code action indicator when code actions are available
  use({ "kosayoda/nvim-lightbulb" })

  -- Illuminate function names and variables
  use({ "RRethy/vim-illuminate" })

  -- Variable type inline hints
  use({ "lvimuser/lsp-inlayhints.nvim" })
  -- use "simrat39/inlay-hints.nvim"

  -- renders diagnostics using virtual lines on top of the real line of code.
  use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" })

  -- Java
  use({ "mfussenegger/nvim-jdtls" })

  -- Typescript TODO: set this up, also add keybinds to ftplugin
  use({ "jose-elias-alvarez/typescript.nvim" })

  -- Markdown
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", ft = "markdown" })

  -----------------------------------------------------------------------------------------------------------------
  -- Telescope Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Telescope Easy Search
  use({ "nvim-telescope/telescope.nvim" })

  -- Telescope-Media-Supp View Images with Telescope media_files command
  use({ "nvim-telescope/telescope-media-files.nvim" })

  -- Bookmarks
  use({ "tom-anders/telescope-vim-bookmarks.nvim" })

  -- Telescope Fuzy Finder
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- Project For All Your uncompleted Projects
  use({ "ahmedkhalf/project.nvim" })

  -- Telescope File browser
  use({ "nvim-telescope/telescope-file-browser.nvim" })

  -- NEOCLIP
  use({ "AckslD/nvim-neoclip.lua", requires = { { "nvim-telescope/telescope.nvim" } } })

  -- Telescope-Dap: Integration for nvim-dap with telescope.nvim
  use({ "nvim-telescope/telescope-dap.nvim" })

  -- UtilSnip Telescope Extension
  use({ "fhill2/telescope-ultisnips.nvim" })

  -- fzf-lua: Improved fzf.vim written in lua
  use({ "ibhagwan/fzf-lua" })

  -----------------------------------------------------------------------------------------------------------------
  -- Completion And Snippets Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Cmp-Nvim The completion engine plugin
  use({ "hrsh7th/nvim-cmp" })

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

  -- Emoji completions NOICE
  use({ "hrsh7th/cmp-emoji" })

  -- Cmp-Lua Add completion for lua vim apis
  use({ "hrsh7th/cmp-nvim-lua" })

  -- Cmp-Dap: nvim-cmp source for nvim-dap REPL and nvim-dap-ui buffers
  use({ "rcarriga/cmp-dap" })

  -- Document-Symbols Add document symbols like functions to / search reasults
  use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })

  -- Signature-Help Add signature help to cmp
  use({ "hrsh7th/cmp-nvim-lsp-signature-help" })

  -- LuaSnip Snippet Engine
  use({ "L3MON4D3/LuaSnip" })

  -- Friendly-Snippets A bunch of snippets to use
  use({ "rafamadriz/friendly-snippets" })

  -- ULtiSnips Snippet Engine
  use({ "SirVer/ultisnips" })

  -- Ultisnips Get suggestions from ultisnips snippets
  use({ "quangnguyen30192/cmp-nvim-ultisnips" })

  -- React-Snippets React Snippets
  use({ "mlaursen/vim-react-snippets" })

  -----------------------------------------------------------------------------------------------------------------
  -- Syntax Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Treesitter Syntax Highlight
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- Treesitter-Context-Comm This is useful when there are embedded languages in certain types of files
  use({ "JoosepAlviste/nvim-ts-context-commentstring" })

  -- TS-RAINBOW-BRACKETS
  use({ "p00f/nvim-ts-rainbow" })

  -- View treesitter information directly in Neovim!
  use({ "nvim-treesitter/playground" })

  -- AutoPairs
  use({ "windwp/nvim-autopairs" })

  -- AutoTag Use treesitter to autoclose and autorename html tag
  use({ "windwp/nvim-ts-autotag" })

  -- Treesitter-TextObj Syntax aware text-objects, select, move, swap, and peek support.
  use({ "nvim-treesitter/nvim-treesitter-textobjects" })

  -- Treesitter-TextSubj Location and syntax aware text objects which *do what you mean*
  use({ "RRethy/nvim-treesitter-textsubjects" })

  -- Surround code
  use({ "kylechui/nvim-surround" })

  -- Tab out of things
  use({ "abecodes/tabout.nvim", require = { "nvim-treesitter" } })


  -- Motion jump anywhere in a document with as few keystrokes as possible
  -- use({ "phaazon/hop.nvim" })

  -- TreeHopper Plugin that provides region selection using hints on the abstract syntax tree of a document.
  -- use({ "mfussenegger/nvim-treehopper" })

  -- Treesitter-Context: Show code context FIXME
  -- use({ "romgrk/nvim-treesitter-context" })

  -- VR-COMMENTS-CONTEXT : Vr Function Context as Comments
  use({"haringsrob/nvim_context_vt"})

  -- Todo-Comments Highlight comments and notes
  use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

  -- Comments Easier Time Commenting Shit
  use({ "numToStr/Comment.nvim" })

  -- HEXOKINASE Virtual Color Identifier
  use({
    "rrethy/vim-hexokinase",
    run = "make hexokinase",
    opt = true,
    ft = { "css", "scss", "sass", "xml", "js", "jsx", "conf", "txt", "lua" },
    cmd = "hexokinase",
  })

  -----------------------------------------------------------------------------------------------------------------
  -- Debugging Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Dap: Debug Adapter Protocol client
  use({ "mfussenegger/nvim-dap" })

  -- Dap-ui: A UI for nvim-dap
  use({ "rcarriga/nvim-dap-ui" })

  -- Nvim-Dap-VR-text: adds virtual text support to nvim-dap.
  use({ "theHamsta/nvim-dap-virtual-text" })

  -----------------------------------------------------------------------------------------------------------------
  -- VCS Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Git-Signs
  use({ "lewis6991/gitsigns.nvim" })

  -- Git Blame
  use({ "f-person/git-blame.nvim" })

  -- GitLinker
  use({ "ruifm/gitlinker.nvim" })

  -- Gist
  use({ "mattn/vim-gist" })

  -- GH-Notifications
  use({ "rlch/github-notifications.nvim" })

  -- Github
  use({ "pwntester/octo.nvim" })

  -- Github Integration
  -- use({ "ldelossa/gh.nvim" })

  -- Diff-View
  -- use({ "sindrets/diffview.nvim" })

  -- Git-Messenger
  -- use({ "rhysd/git-messenger.vim" })

  -- Neogit
  -- use({ "TimUntersberger/neogit" })

  -- Vgit
  -- use({ "tanvirtin/vgit.nvim" })


  -----------------------------------------------------------------------------------------------------------------
  -- To-Check Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Nvim-Gps: statusline component that shows what scope you are working inside
  -- use({ "SmiteshP/nvim-gps" })

  -- Code Outline alternative
  -- use({ 'stevearc/aerial.nvim' })

  -- Session
  -- use ({"rmagatti/auto-session"})
  -- use ({"rmagatti/session-lens"})

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

  --  -- NEOGEN Create annotations with one keybind
  -- use("danymat/neogen")
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
  -- -- Colorizer
  -- use({ "NvChad/nvim-colorizer.lua" })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
