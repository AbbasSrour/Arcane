local M = {}

-- Keymaps
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

M.keymaps = {
	-- Better window navigation
	{ "<C-h>", "<C-w>h", description = "Move Cursor To The Left Window", mode = { "n" }, opts },
	{ "<C-j>", "<C-w>j", description = "Move Cursor To The Window Above", mode = { "n" }, opts },
	{ "<C-k>", "<C-w>k", description = "Move Cursor To The Window Below", mode = { "n" }, opts },
	{ "<C-l>", "<C-w>l", description = "Move Cursor To The Right Window", mode = { "n" }, opts },

	-- Resize with arrows
	{ "<C-Up>", ":resize -2<CR>", description = "Resize Vertical Up", mode = { "n" }, opts },
	{ "<C-Down>", ":resize +2<CR>", description = "Resize Vertical Down", mode = { "n" }, opts },
	{ "<C-Left>", ":vertical resize -2<CR>", description = "Resize Hortizontal Left", mode = { "n" }, opts },
	{ "<C-Right>", ":vertical resize +2<CR>", description = "Move Horizontal Right", mode = { "n" }, opts },

	-- Navigate buffers
	{ "<S-l>", ":bnext<CR>", description = "Next Buffer", mode = { "n" }, opts },
	{ "<S-h>", ":bprevious<CR>", description = "Previous Buffer", mode = { "n" }, opts },

	-- Move text up and down
	{ "<A-j>", "<Esc>:m .+1<CR>==gi", description = "Move Text Down Normal Mode", mode = { "n" }, opts },
	{ "<A-k>", "<Esc>:m .-2<CR>==gi", description = "Move Text Up Normal Mode", mode = { "n" }, opts },

	{ "<A-j>", ":m .+1<CR>==", description = "Move Text Down Visual Mode", mode = { "v" }, opts },
	{ "<A-k>", ":m .-2<CR>==", description = "Move Text Up Visual Mode", mode = { "v" }, opts },

	{ "J", ":move '>+1<CR>gv-gv", description = "Move Text Down Block Mode", mode = { "x" }, opts },
	{ "K", ":move '<-2<CR>gv-gv", description = "Move Text Up Block Mode", mode = { "x" }, opts },
	{ "<A-j>", ":move '>+1<CR>gv-gv", description = "Move Text Down Block Mode", mode = { "x" }, opts },
	{ "<A-k>", ":move '<-2<CR>gv-gv", description = "Move Text Up Block Mode", mode = { "x" }, opts },

	-- Paste
	{ "p", '"_dP', description = "Paste Text", mode = { "v" }, opts },

	-- Press jk fast to escape
	{ "jk", "<ESC>", description = "Press jk Fast To Escape", mode = { "i" }, opts },

	-- Stay in indent mode
	{ "<", "<gv", description = "Indent Right", mode = { "v" }, opts },
	{ "jk", "<ESC>", description = "Indent Left", mode = { "v" }, opts },

	-- Better terminal navigation
	{ "<C-h>", "<C-\\><C-N><C-w>h", description = "Better Terminal Navigate Left", mode = { "t" }, term_opts },
	{ "<C-j>", "<C-\\><C-N><C-w>j", description = "Better Terminal Navigate Down", mode = { "t" }, term_opts },
	{ "<C-k>", "<C-\\><C-N><C-w>k", description = "Better Terminal Navigate Up", mode = { "t" }, term_opts },
	{ "<C-l>", "<C-\\><C-N><C-w>l", description = "Better Terminal Navigate Right", mode = { "t" }, term_opts },

	-- Legendary
	{ "<C-p>", "<cmd>lua require('legendary').find()<CR>", description = "Search Keymaps", mode = { "n" }, opts },
}

-- Commands
M.commands = {}

-- Auto Commands
M.autocmds = {}

-- Which Key
M.WhichkeyOpts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

M.WhichkeyMappings = {
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Lsp Diagnostics" },
	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Find files",
	},
	["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},

	l = {
		name = "LSP",
		a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		L = {
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
			"List Workspace Folders",
		},
		n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
		N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		R = { "<cmd>Lspsaga rename<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
		W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
	},

	-- l = {
	-- 	name = "LSP",
	-- 	-- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
	-- 	d = {
	-- 		"<cmd>Telescope lsp_document_diagnostics<cr>",
	-- 		"Document Diagnostics",
	-- 	},
	-- 	w = {
	-- 		"<cmd>Telescope lsp_workspace_diagnostics<cr>",
	-- 		"Workspace Diagnostics",
	-- 	},
	-- 	f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
	-- 	i = { "<cmd>LspInfo<cr>", "Info" },
	-- 	I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
	-- 	j = {
	-- 		"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
	-- 		"Next Diagnostic",
	-- 	},
	-- 	k = {
	-- 		"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
	-- 		"Prev Diagnostic",
	-- 	},
	-- 	l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
	-- 	q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
	-- 	r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	-- 	s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
	-- 	S = {
	-- 		"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
	-- 		"Workspace Symbols",
	-- 	},
	-- },

	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	},
	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
	T = {
		name = "Trouble",
		t = { "<cmd>Trouble<cr>", "Trouble" },
		d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
		w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
		l = { "<cmd>Trouble loclist<cr>", "Lock List" },
		q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
		r = { "<cmd>Trouble lsp_references<cr>", "Lsp References" },
	},
}

return M
