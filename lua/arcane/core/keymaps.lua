local M = {}

---------------------------------------------------------------------------------------------------------------------------------
-- Commands
---------------------------------------------------------------------------------------------------------------------------------
M.commands = {}

---------------------------------------------------------------------------------------------------------------------------------
-- AutoCommands
---------------------------------------------------------------------------------------------------------------------------------
M.autocmds = {
  ------------------------------------------------ Custom -----------------------------------------------------------------------
  -- vim.api.nvim_create_autocmd({ "User" }, {
  --   pattern = { "AlphaReady" },
  --   callback = function()
  --     vim.cmd [[
  --       set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  --     ]]
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "User" }, {
  --   pattern = { "AlphaReady" },
  --   callback = function()
  --     vim.cmd [[
  --       set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
  --     ]]
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "FileType" }, {
  --   pattern = {
  --     "Jaq",
  --     "qf",
  --     "help",
  --     "man",
  --     "lspinfo",
  --     "spectre_panel",
  --     "lir",
  --     "DressingSelect",
  --     "tsplayground",
  --     "Markdown",
  --   },
  --   callback = function()
  --     vim.cmd [[
  --       nnoremap <silent> <buffer> q :close<CR>
  --       nnoremap <silent> <buffer> <esc> :close<CR>
  --       set nobuflisted
  --     ]]
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "FileType" }, {
  --   pattern = { "Jaq" },
  --   callback = function()
  --     vim.cmd [[
  --       nnoremap <silent> <buffer> <m-r> :close<CR>
  --       " nnoremap <silent> <buffer> <m-r> <NOP>
  --       set nobuflisted
  --     ]]
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "BufEnter" }, {
  --   pattern = { "" },
  --   callback = function()
  --     local buf_ft = vim.bo.filetype
  --     if buf_ft == "" or buf_ft == nil then
  --       vim.cmd [[
  --       nnoremap <silent> <buffer> q :close<CR>
  --       nnoremap <silent> <buffer> <c-j> j<CR>
  --       nnoremap <silent> <buffer> <c-k> k<CR>
  --       set nobuflisted
  --     ]]
  --     end
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "BufEnter" }, {
  --   pattern = { "" },
  --   callback = function()
  --     local get_project_dir = function()
  --       local cwd = vim.fn.getcwd()
  --       local project_dir = vim.split(cwd, "/")
  --       local project_name = project_dir[#project_dir]
  --       return project_name
  --     end

  --     vim.opt.titlestring = get_project_dir() .. " - nvim"
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "BufEnter" }, {
  --   pattern = { "term://*" },
  --   callback = function()
  --     vim.cmd "startinsert!"
  --     -- TODO: if java = 2
  --     vim.cmd "set cmdheight=1"
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "FileType" }, {
  --   pattern = { "gitcommit", "markdown" },
  --   callback = function()
  --     vim.opt_local.wrap = true
  --     vim.opt_local.spell = true
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "FileType" }, {
  --   pattern = { "lir" },
  --   callback = function()
  --     vim.opt_local.number = false
  --     vim.opt_local.relativenumber = false
  --   end,
  -- })

  -- vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"
  -- -- vim.api.nvim_create_autocmd({ "BufEnter" }, {
  -- --   callback = function()
  -- --     vim.cmd [[
  -- --       if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  -- --     ]]
  -- --   end,
  -- -- })

  -- vim.api.nvim_create_autocmd({ "VimResized" }, {
  --   callback = function()
  --     vim.cmd "tabdo wincmd ="
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  --   callback = function()
  --     vim.cmd "quit"
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  --   callback = function()
  --     vim.cmd "set formatoptions-=cro"
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  --   callback = function()
  --     vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  --   pattern = { "*.java" },
  --   callback = function()
  --     vim.lsp.codelens.refresh()
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "VimEnter" }, {
  --   callback = function()
  --     vim.cmd "hi link illuminatedWord LspReferenceText"
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  --   pattern = { "*" },
  --   callback = function()
  --     vim.cmd "checktime"
  --   end,
  -- })

  -- vim.api.nvim_create_autocmd({ "CursorHold" }, {
  --   callback = function()
  --     local status_ok, luasnip = pcall(require, "luasnip")
  --     if not status_ok then
  --       return
  --     end
  --     if luasnip.expand_or_jumpable() then
  --       -- ask maintainer for option to make this silent
  --       -- luasnip.unlink_current()
  --       vim.cmd [[silent! lua require("luasnip").unlink_current()]]
  --     end
  --   end,
  -- })

  -- -- vim.api.nvim_create_autocmd({ "ModeChanged" }, {
  -- --   callback = function()
  -- --     local luasnip = require "luasnip"
  -- --     if luasnip.expand_or_jumpable() then
  -- --       -- ask maintainer for option to make this silent
  -- --       -- luasnip.unlink_current()
  -- --       vim.cmd [[silent! lua require("luasnip").unlink_current()]]
  -- --     end
  -- --   end,
  -- -- })

  -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  --   pattern = { "*.ts" },
  --   callback = function()
  --     vim.lsp.buf.format { async = true }
  --   end,
  -- })
}

---------------------------------------------------------------------------------------------------------------------------------
--Keymaps
---------------------------------------------------------------------------------------------------------------------------------
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

M.keymaps = {
  ------------------------------------------------ Remaps --------------------------------------------
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

  -- Telescope
  { "<C-b>", "<cmd>lua require('legendary').find()<CR>", description = "Search Keymaps", mode = { "n" }, opts },
  { "<C-p>", "<cmd>Telescope neoclip default<cr>", description = "Clipboard", mode = { "n" }, opts },
  { "<C-c>", "<cmd>Telescope commands<cr>", description = "Clipboard", mode = { "n" }, opts },

  -- Hide Search Results
  { "<Esc>", "<cmd>noh<CR>", description = "Hide Search Results", mode = { "n" }, opts },

  ------------------------------------------------ Debugger --------------------------------------------
  { "<F5>", ":lua require'dap'.continue()<CR>", description = "Dap Continue", mode = { "n" }, opts },
  { "<F3>", ":lua require'dap'.step_over()<CR>", description = "Dap Step Over", mode = { "n" }, opts },
  { "<F2>", ":lua require'dap'.step_into()<CR>", description = "Dap Step Into", mode = { "n" }, opts },
  { "<F12>", ":lua require'dap'.step_out()<CR>", description = "Dap Step Out", mode = { "n" }, opts },
  -- { "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", description = "", mode = { "n" }, opts },
  -- {
  -- 	"<leader>B",
  -- 	":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  -- 	description = "",
  -- 	mode = { "n" },
  -- 	opts,
  -- },
  -- {
  -- 	"<leader>lp",
  -- 	":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  -- 	description = "",
  -- 	mode = { "n" },
  -- 	opts,
  -- },
  -- { "<leader>dr", ":lua require'dap'.repl.open()<CR>", description = "", mode = { "n" }, opts },
  -- { "<leader>dt", ":lua require'dap-go'.debug_test()<CR>", description = "", mode = { "n" }, opts },

  -- utils.map('n', '<leader>dct', '<cmd>lua require"dap".continue()<CR>')
  -- utils.map('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>')
  -- utils.map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
  -- utils.map('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>')
  -- utils.map('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
  -- utils.map('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
  -- utils.map('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
  -- utils.map('v', '<leader>dhv',
  --           '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')
  --
  -- utils.map('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
  -- utils.map('n', '<leader>duf',
  --           "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")
  --
  -- utils.map('n', '<leader>dsbr',
  --           '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
  -- utils.map('n', '<leader>dsbm',
  --           '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
  -- utils.map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
  -- utils.map('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')
  -- -- telescope-dap
  -- utils.map('n', '<leader>dcc',
  --           '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
  -- utils.map('n', '<leader>dco',
  --           '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
  -- utils.map('n', '<leader>dlb',
  --           '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
  -- utils.map('n', '<leader>dv',
  --           '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
  -- utils.map('n', '<leader>df',
  --           '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

  ------------------------------------------------ Lsp --------------------------------------------
  {
    "fe",
    "<cmd>lua vim.diagnostic.open_float()<CR>",
    description = "Get Diagnostic Message",
    mode = { "n" },
    opts,
  },

  {
    "fn",
    "<cmd>lua vim.diagnostic.goto_prev()<CR>",
    description = "Previous Diagnostic",
    mode = { "n" },
    opts,
  },

  {
    "fm",
    "<cmd>lua vim.diagnostic.goto_next()<CR>",
    description = "Next Diagnostic",
    mode = { "n" },
    opts,
  },

  {
    "fk", --K
    "<cmd>lua vim.lsp.buf.hover()<CR>",
    description = "Get Diagnostic On Hover",
    mode = { "n" },
    opts,
  },

  {
    "fq",
    "<cmd>Trouble document_diagnostics<CR>", -- 	"<cmd>lua vim.diagnostic.setloclist()<CR>",
    description = "Get Quickfix List",
    mode = { "n" },
    opts,
  },

  {
    "fw",
    "<cmd>Trouble workspace_diagnostics<CR>", -- 	"<cmd>lua vim.diagnostic.setqflist()<CR>",
    description = "Get Quickfix List",
    mode = { "n" },
    opts,
  },

  {
    "fg", --gD
    "<cmd>lua vim.lsp.buf.declaration()<CR>",
    description = "Go To Declaration",
    mode = { "n" },
    opts,
  },

  {
    "fi", --gi
    "<cmd>Telescope lsp_implementations<CR>",
    description = "Go To Implementation",
    mode = { "n" },
    opts,
  },

  {
    "fr",
    "<cmd>Telescope lsp_references<CR>",
    description = "Get References",
    mode = { "n" },
    opts,
  },

  {
    "fd", --gd
    "<cmd>Telescope lsp_definitions<CR>",
    description = "Go To Definition",
    mode = { "n" },
    opts,
  },

  {
    "ft",
    "<cmd>Telescope lsp_type_definitions<CR>",
    description = "Get Type Definition",
    mode = { "n" },
    opts,
  },

  {
    "fx",
    "<cmd>lua vim.lsp.buf.rename()<CR>",
    description = "Rename Object",
    mode = { "n" },
    opts,
  },

  {
    "fa",
    "<cmd>lua vim.lsp.buf.code_action()<CR>",
    description = "Get Code Actions",
    mode = { "n" },
    opts,
  },

  {
    "fl",
    "<cmd>lua vim.lsp.codelens.run()<CR>",
    description = "Get CodeLens",
    mode = { "n" },
    opts,
  },

  {
    "fp",
    "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    description = "Get Parameters Signature Help",
    mode = { "n" },
    opts,
  },

  {
    "fs",
    "<cmd>SymbolsOutline<cr>",
    description = "Document Symbols",
    mode = { "n" },
    opts,
  },

  {
    "fh",
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    description = "Workspace Symbols",
    mode = { "n" },
    opts,
  },

  {
    "F",
    "<cmd>lua vim.lsp.buf.format({async = true})<CR>",
    description = "Format Document",
    mode = { "n" },
    opts,
  },

  {
    "wa",
    "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
    description = "Add Workspace Folder",
    mode = { "n" },
    opts,
  },

  {
    "wl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    description = "List Workspace Folders",
    mode = { "n" },
    opts,
  },

  {
    "wr",
    "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    description = "Remove Workspace Folder",
    mode = { "n" },
    opts,
  },
  ------------------------------------------------ Custom -----------------------------------------------
  -- Visual --
  -- Stay in indent mode
  -- keymap("v", "<", "<gv", opts)
  -- keymap("v", ">", ">gv", opts)

  -- Move text up and down
  -- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
  -- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
  -- keymap("v", "p", '"_dP', opts)
  -- keymap("v", "P", '"_dP', opts)

  -- Idk
  -- keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
  -- keymap("n", "<F1>", ":e ~/Notes/<cr>", opts)
  -- keymap("n", "<F3>", ":e .<cr>", opts)
  -- keymap("n", "<F4>", "<cmd>Telescope resume<cr>", opts)
  -- keymap("n", "<F5>", "<cmd>Telescope commands<CR>", opts)
  -- keymap(
  --   "n",
  --   "<F6>",
  --   [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  --   opts
  -- )
  -- keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
  -- keymap("n", "<F8>", "<cmd>TSPlaygroundToggle<cr>", opts)
  -- keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- keymap("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], opts)
  -- keymap("n", "<C-p>", "<cmd>Telescope projects<cr>", opts)
  -- keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<cr>", opts)
  -- -- keymap("n", "<C-s>", "<cmd>vsplit<cr>", opts)
  -- keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)
  -- keymap("n", "<c-n>", ":e ~/Notes/<cr>", opts)
  -- keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)

  -- Comment
  -- keymap("n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
  -- keymap("x", "<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)
}

---------------------------------------------------------------------------------------------------------------------------------
-- WhichKey
---------------------------------------------------------------------------------------------------------------------------------
M.whichkey_opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
M.whichkey_mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },

  b = {
    name = "buffers",
    b = { "<cmd> Telescope buffers<cr>", "Buffers Preview" },
    c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    w = { "<cmd>w!<CR>", "Save" },
    q = { '<cmd>lua require("arcane.utils.functions").smart_quit()<CR>', "Quit" },
  },
  B = {
    name = "Browse",
    i = { "<cmd>BrowseInputSearch<cr>", "Input Search" },
    b = { "<cmd>Browse<cr>", "Browse" },
    d = { "<cmd>BrowseDevdocsSearch<cr>", "Devdocs" },
    f = { "<cmd>BrowseDevdocsFiletypeSearch<cr>", "Devdocs Filetype" },
    m = { "<cmd>BrowseMdnSearch<cr>", "Mdn" },
  },

  d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
    O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
    l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
  },

  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

  f = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", "Get Capabilities" },
    C = {
      name = "Config",
      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
    },
    d = { "<cmd>Telescope lsp_definitions<CR>", "Go To Definition" },
    e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostic" },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
    g = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go To Declaration" },
    h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" },
    H = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
    i = { "<cmd>Telescope lsp_implementations<CR>", "Go To implementation" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Diagnostics" },
    m = {
      "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
      "Next Diagnostic",
    },
    n = {
      "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
      "Prev Diagnostic",
    },
    o = { "<cmd>SymbolsOutline<cr>", "Outline" },
    p = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    q = { "<cmd>Trouble document_diagnostics<CR>", "Document Diagnostics" },
    -- r = { "<cmd>Telescope lsp_references<CR>", "Go To References" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    t = { "<cmd>Telescope lsp_type_definitions<CR>", "Get Type Definition" },
    T = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
    u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
    v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    W = {
      name = "Workspace Folders",
      a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace Folder" },
      l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List Workspace Folders" },
      r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace Folder" },
    },
    x = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>GitBlameToggle<cr>", "Blame Toggle" },
    L = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame Line" },
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
    G = {
      name = "Gist",
      a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
      d = { "<cmd>Gist -d<cr>", "Delete" },
      f = { "<cmd>Gist -f<cr>", "Fork" },
      g = { "<cmd>Gist -b<cr>", "Create" },
      l = { "<cmd>Gist -l<cr>", "List" },
      p = { "<cmd>Gist -b -p<cr>", "Create Private" },
    },
  },

  o = {
    name = "Options",
    c = { '<cmd>lua vim.g.cmp_active=false<cr>', "Completion off" },
    C = { '<cmd>lua vim.g.cmp_active=true<cr>', "Completion on" },
    w = { '<cmd>lua require("user.functions").toggle_option("wrap")<cr>', "Wrap" },
    r = { '<cmd>lua require("user.functions").toggle_option("relativenumber")<cr>', "Relative" },
    l = { '<cmd>lua require("user.functions").toggle_option("cursorline")<cr>', "Cursorline" },
    s = { '<cmd>lua require("user.functions").toggle_option("spell")<cr>', "Spell" },
    t = { '<cmd>lua require("user.functions").toggle_tabline()<cr>', "Tabline" },
  },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  r = {
    name = "Replace",
    r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
  },

  m = {
    name = "Session",
    c = { "<cmd>SessionManager load_curruent_dir_session<cr>", "Find Delete" },
    f = { "<cmd>SessionManager load_session<cr>", "Find" },
    s = { "<cmd>SessionManager save_current_session<cr>", "Save" },
    l = { "<cmd>SessionManager load_last_session<cr>", "Load Last Session" },
    x = { "<cmd>SessionManager delete_session<cr>", "Delete" },
  },

  n = {
    name = "Surround",
    ["."] = { "<cmd>lua require('surround').repeat_last()<cr>", "Repeat" },
    a = { "<cmd>lua require('surround').surround_add(true)<cr>", "Add" },
    d = { "<cmd>lua require('surround').surround_delete()<cr>", "Delete" },
    r = { "<cmd>lua require('surround').surround_replace()<cr>", "Replace" },
    q = { "<cmd>lua require('surround').toggle_quotes()<cr>", "Quotes" },
    b = { "<cmd>lua require('surround').toggle_brackets()<cr>", "Brackets" },
  },

  s = {
    name = "Search",
    b = { "<cmd>Legendary<cr>", "Keymaps" },
    B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    e = { "<cmd> Telescope file_browser<cr>", "File Explorer" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    H = { "<cmd>Telescope highlights<cr>", "Highlights" },
    i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    n = { "<cmd>lua require('telescope').extensions.notify.notify(require('telescope.themes').get_ivy({layout_config={ preview_width=0.8, }}))<cr>",
      "Notifications" },
    o = { "<cmd>TodoTrouble<cr>", "Get Todos" },
    p = { "<cmd>Telescope neoclip default<cr>", "Clipboard" },
    P = { "<cmd>Telescope projects<cr>", "Projects" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    s = { "<cmd>Telescope grep_string<cr>", "Find String" },
    u = { "<cmd>Telescope ultisnips<cr>", "UtilSnip Search" },
  },

  S = {
    name = "SnipRun",
    c = { "<cmd>SnipClose<cr>", "Close" },
    f = { "<cmd>%SnipRun<cr>", "Run File" },
    i = { "<cmd>SnipInfo<cr>", "Info" },
    m = { "<cmd>SnipReplMemoryClean<cr>", "Mem Clean" },
    r = { "<cmd>SnipReset<cr>", "Reset" },
    t = { "<cmd>SnipRunToggle<cr>", "Toggle" },
    x = { "<cmd>SnipTerminate<cr>", "Terminate" },
  },

  t = {
    name = "Terminal",
    ["1"] = { ":1ToggleTerm<cr>", "1" },
    ["2"] = { ":2ToggleTerm<cr>", "2" },
    ["3"] = { ":3ToggleTerm<cr>", "3" },
    ["4"] = { ":4ToggleTerm<cr>", "4" },
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
  T = {
    name = "Treesitter",
    h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
    p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
    r = { "<cmd>TSToggle rainbow<cr>", "Rainbow" },
  },

  ["z"] = { "<cmd>ZenMode<cr>", "Zen" },

  ["/"] = { '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', "Comment" },

}

M.whichkey_m_opts = {
  mode = "n", -- NORMAL mode
  prefix = "m",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
M.whichkey_m_mappings = {
  a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
  c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
  b = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
  m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
  ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
  [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
  l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
  j = { "<cmd>silent BookmarkNext<cr>", "Next" },
  s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
  k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
  S = { "<cmd>silent BookmarkShowAll<cr>", "Prev" },
  x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
  [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
}

M.whichkey_v_opts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
M.whichkey_v_mappings = {
  ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Comment" },
  s = { "<esc><cmd>'<,'>SnipRun<cr>", "Run range" },
}

return M
