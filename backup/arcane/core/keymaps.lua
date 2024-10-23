local M = {}

---------------------------------------------------------------------------------------------------------------------------------
--Keymaps
---------------------------------------------------------------------------------------------------------------------------------
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

M.keymaps = {
  ------------------------------------------------ Remaps --------------------------------------------
  -- Better window navigation
  { "<C-h>",     "<C-w>h",                                   description = "Move Cursor To The Left Window",  mode = { "n" }, opts },
  { "<C-j>",     "<C-w>j",                                   description = "Move Cursor To The Window Above", mode = { "n" }, opts },
  { "<C-k>",     "<C-w>k",                                   description = "Move Cursor To The Window Below", mode = { "n" }, opts },
  { "<C-l>",     "<C-w>l",                                   description = "Move Cursor To The Right Window", mode = { "n" }, opts },

  -- Resize with arrows
  { "<C-Up>",    ":resize -2<CR>",                           description = "Resize Vertical Up",              mode = { "n" }, opts },
  { "<C-Down>",  ":resize +2<CR>",                           description = "Resize Vertical Down",            mode = { "n" }, opts },
  { "<C-Left>",  ":vertical resize -2<CR>",                  description = "Resize Hortizontal Left",         mode = { "n" }, opts },
  { "<C-Right>", ":vertical resize +2<CR>",                  description = "Move Horizontal Right",           mode = { "n" }, opts },

  -- Navigate buffers
  { "<S-l>",     ":bnext<CR>",                               description = "Next Buffer",                     mode = { "n" }, opts },
  { "<S-h>",     ":bprevious<CR>",                           description = "Previous Buffer",                 mode = { "n" }, opts },

  -- Move text up and down
  { "<A-j>",     "<Esc>:m .+1<CR>==gi",                      description = "Move Text Down Normal Mode",      mode = { "n" }, opts },
  { "<A-k>",     "<Esc>:m .-2<CR>==gi",                      description = "Move Text Up Normal Mode",        mode = { "n" }, opts },

  { "<A-j>",     ":m .+1<CR>==",                             description = "Move Text Down Visual Mode",      mode = { "v" }, opts },
  { "<A-k>",     ":m .-2<CR>==",                             description = "Move Text Up Visual Mode",        mode = { "v" }, opts },

  { "J",         ":move '>+1<CR>gv-gv",                      description = "Move Text Down Block Mode",       mode = { "x" }, opts },
  { "K",         ":move '<-2<CR>gv-gv",                      description = "Move Text Up Block Mode",         mode = { "x" }, opts },
  { "<A-j>",     ":move '>+1<CR>gv-gv",                      description = "Move Text Down Block Mode",       mode = { "x" }, opts },
  { "<A-k>",     ":move '<-2<CR>gv-gv",                      description = "Move Text Up Block Mode",         mode = { "x" }, opts },

  -- Paste
  { "p",         '"_dP',                                     description = "Paste Text",                      mode = { "v" }, opts },

  -- Press jk fast to escape
  { "jk",        "<ESC>",                                    description = "Press jk Fast To Escape",         mode = { "i" }, opts },

  -- Stay in indent mode
  { "<",         "<gv",                                      description = "Indent Right",                    mode = { "v" }, opts },
  { "jk",        "<ESC>",                                    description = "Indent Left",                     mode = { "v" }, opts },

  -- Better terminal navigation
  { "<C-h>",     "<C-\\><C-N><C-w>h",                        description = "Better Terminal Navigate Left",   mode = { "t" }, term_opts },
  { "<C-j>",     "<C-\\><C-N><C-w>j",                        description = "Better Terminal Navigate Down",   mode = { "t" }, term_opts },
  { "<C-k>",     "<C-\\><C-N><C-w>k",                        description = "Better Terminal Navigate Up",     mode = { "t" }, term_opts },
  { "<C-l>",     "<C-\\><C-N><C-w>l",                        description = "Better Terminal Navigate Right",  mode = { "t" }, term_opts },

  -- Telescope
  { "<C-b>",     "<cmd>lua require('legendary').find()<CR>", description = "Search Keymaps",                  mode = { "n" }, opts },
  { "<C-p>",     "<cmd>Telescope neoclip default<cr>",       description = "Clipboard",                       mode = { "n" }, opts },
  { "<C-c>",     "<cmd>Telescope commands<cr>",              description = "Clipboard",                       mode = { "n" }, opts },

  -- Hide Search Results
  { "<Esc>",     "<cmd>noh<CR>",                             description = "Hide Search Results",             mode = { "n" }, opts },

  ------------------------------------------------ Debugger --------------------------------------------
  { "<F5>",      ":lua require'dap'.continue()<CR>",         description = "Dap Continue",                    mode = { "n" }, opts },
  { "<F3>",      ":lua require'dap'.step_over()<CR>",        description = "Dap Step Over",                   mode = { "n" }, opts },
  { "<F2>",      ":lua require'dap'.step_into()<CR>",        description = "Dap Step Into",                   mode = { "n" }, opts },
  { "<F12>",     ":lua require'dap'.step_out()<CR>",         description = "Dap Step Out",                    mode = { "n" }, opts },
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

  ------------------------------------------------ Custom -----------------------------------------
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
  -- { "gcc", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', description = "Comment", mode='n',opts  }, -- FIX revert later
  -- { "gbc", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', description = "Comment", mode='n',opts  },
  -- {"n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>"},
  -- {"x", "<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>'}
}

---------------------------------------------------------------------------------------------------------------------------------
-- WhichKey
---------------------------------------------------------------------------------------------------------------------------------
M.whichkey_mappings = {
  { "<leader>/",   '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>',                                                                           desc = "Comment",                 nowait = true, remap = false },
  { "<leader>a",   "<cmd>Alpha<cr>",                                                                                                                          desc = "Alpha",                   nowait = true, remap = false },
  { "<leader>z",   "<cmd>ZenMode<cr>",                                                                                                                        desc = "Zen",                     nowait = true, remap = false },

  { "<leader>B",   group = "Browse",                                                                                                                          nowait = true,                    remap = false },
  { "<leader>Bb",  "<cmd>Browse<cr>",                                                                                                                         desc = "Browse",                  nowait = true, remap = false },
  { "<leader>Bd",  "<cmd>BrowseDevdocsSearch<cr>",                                                                                                            desc = "Devdocs",                 nowait = true, remap = false },
  { "<leader>Bf",  "<cmd>BrowseDevdocsFiletypeSearch<cr>",                                                                                                    desc = "Devdocs Filetype",        nowait = true, remap = false },
  { "<leader>Bi",  "<cmd>BrowseInputSearch<cr>",                                                                                                              desc = "Input Search",            nowait = true, remap = false },
  { "<leader>Bm",  "<cmd>BrowseMdnSearch<cr>",                                                                                                                desc = "Mdn",                     nowait = true, remap = false },

  { "<leader>S",   group = "SnipRun",                                                                                                                         nowait = true,                    remap = false },
  { "<leader>Sc",  "<cmd>SnipClose<cr>",                                                                                                                      desc = "Close",                   nowait = true, remap = false },
  { "<leader>Sf",  "<cmd>%SnipRun<cr>",                                                                                                                       desc = "Run File",                nowait = true, remap = false },
  { "<leader>Si",  "<cmd>SnipInfo<cr>",                                                                                                                       desc = "Info",                    nowait = true, remap = false },
  { "<leader>Sm",  "<cmd>SnipReplMemoryClean<cr>",                                                                                                            desc = "Mem Clean",               nowait = true, remap = false },
  { "<leader>Sr",  "<cmd>SnipReset<cr>",                                                                                                                      desc = "Reset",                   nowait = true, remap = false },
  { "<leader>St",  "<cmd>SnipRunToggle<cr>",                                                                                                                  desc = "Toggle",                  nowait = true, remap = false },
  { "<leader>Sx",  "<cmd>SnipTerminate<cr>",                                                                                                                  desc = "Terminate",               nowait = true, remap = false },

  { "<leader>T",   group = "Treesitter",                                                                                                                      nowait = true,                    remap = false },
  { "<leader>Th",  "<cmd>TSHighlightCapturesUnderCursor<cr>",                                                                                                 desc = "Highlight",               nowait = true, remap = false },
  { "<leader>Tp",  "<cmd>TSPlaygroundToggle<cr>",                                                                                                             desc = "Playground",              nowait = true, remap = false },
  { "<leader>Tr",  "<cmd>TSToggle rainbow<cr>",                                                                                                               desc = "Rainbow",                 nowait = true, remap = false },

  { "<leader>b",   group = "buffers",                                                                                                                         nowait = true,                    remap = false },
  { "<leader>bb",  "<cmd> Telescope buffers<cr>",                                                                                                             desc = "Buffers Preview",         nowait = true, remap = false },
  { "<leader>bc",  "<cmd>Bdelete!<CR>",                                                                                                                       desc = "Close Buffer",            nowait = true, remap = false },
  { "<leader>bq",  '<cmd>lua require("arcane.utils.functions").smart_quit()<CR>',                                                                             desc = "Quit",                    nowait = true, remap = false },
  { "<leader>bw",  "<cmd>w!<CR>",                                                                                                                             desc = "Save",                    nowait = true, remap = false },

  { "<leader>d",   group = "Debug",                                                                                                                           nowait = true,                    remap = false },
  { "<leader>dO",  "<cmd>lua require'dap'.step_out()<cr>",                                                                                                    desc = "Out",                     nowait = true, remap = false },
  { "<leader>db",  "<cmd>lua require'dap'.toggle_breakpoint()<cr>",                                                                                           desc = "Breakpoint",              nowait = true, remap = false },
  { "<leader>dc",  "<cmd>lua require'dap'.continue()<cr>",                                                                                                    desc = "Continue",                nowait = true, remap = false },
  { "<leader>di",  "<cmd>lua require'dap'.step_into()<cr>",                                                                                                   desc = "Into",                    nowait = true, remap = false },
  { "<leader>dl",  "<cmd>lua require'dap'.run_last()<cr>",                                                                                                    desc = "Last",                    nowait = true, remap = false },
  { "<leader>do",  "<cmd>lua require'dap'.step_over()<cr>",                                                                                                   desc = "Over",                    nowait = true, remap = false },
  { "<leader>dr",  "<cmd>lua require'dap'.repl.toggle()<cr>",                                                                                                 desc = "Repl",                    nowait = true, remap = false },
  { "<leader>du",  "<cmd>lua require'dapui'.toggle()<cr>",                                                                                                    desc = "UI",                      nowait = true, remap = false },
  { "<leader>dx",  "<cmd>lua require'dap'.terminate()<cr>",                                                                                                   desc = "Exit",                    nowait = true, remap = false },
  { "<leader>e",   "<cmd>NvimTreeToggle<cr>",                                                                                                                 desc = "Explorer",                nowait = true, remap = false },

  { "<leader>f",   group = "LSP",                                                                                                                             nowait = true,                    remap = false },
  { "<leader>fF",  "<cmd>LspToggleAutoFormat<cr>",                                                                                                            desc = "Toggle Autoformat",       nowait = true, remap = false },
  { "<leader>fH",  "<cmd>IlluminationToggle<cr>",                                                                                                             desc = "Toggle Doc HL",           nowait = true, remap = false },
  { "<leader>fS",  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",                                                                                        desc = "Workspace Symbols",       nowait = true, remap = false },
  { "<leader>fT",  '<cmd>lua require("arcane.functions").toggle_diagnostics()<cr>',                                                                           desc = "Toggle Diagnostics",      nowait = true, remap = false },
  { "<leader>fa",  "<cmd>lua vim.lsp.buf.code_action()<cr>",                                                                                                  desc = "Code Action",             nowait = true, remap = false },
  { "<leader>fd",  "<cmd>Telescope lsp_definitions<CR>",                                                                                                      desc = "Go To Definition",        nowait = true, remap = false },
  { "<leader>fe",  "<cmd>lua vim.diagnostic.open_float()<CR>",                                                                                                desc = "Line Diagnostic",         nowait = true, remap = false },
  { "<leader>ff",  "<cmd>lua vim.lsp.buf.format({ async = true })<cr>",                                                                                       desc = "Format",                  nowait = true, remap = false },
  { "<leader>fg",  "<cmd>lua vim.lsp.buf.declaration()<CR>",                                                                                                  desc = "Go To Declaration",       nowait = true, remap = false },
  { "<leader>fh",  "<cmd>lua require('lsp-inlayhints').toggle()<cr>",                                                                                         desc = "Toggle Hints",            nowait = true, remap = false },
  { "<leader>fi",  "<cmd>Telescope lsp_implementations<CR>",                                                                                                  desc = "Go To implementation",    nowait = true, remap = false },
  { "<leader>fk",  "<cmd>lua vim.lsp.buf.hover()<CR>",                                                                                                        desc = "Hover Diagnostics",       nowait = true, remap = false },
  { "<leader>fl",  "<cmd>lua vim.lsp.codelens.run()<cr>",                                                                                                     desc = "CodeLens Action",         nowait = true, remap = false },
  { "<leader>fm",  "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",                                                                                       desc = "Next Diagnostic",         nowait = true, remap = false },
  { "<leader>fn",  "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",                                                                                       desc = "Prev Diagnostic",         nowait = true, remap = false },
  { "<leader>fo",  "<cmd>SymbolsOutline<cr>",                                                                                                                 desc = "Outline",                 nowait = true, remap = false },
  { "<leader>fp",  "<cmd>lua vim.lsp.buf.signature_help()<CR>",                                                                                               desc = "Signature Help",          nowait = true, remap = false },
  { "<leader>fq",  "<cmd>Trouble document_diagnostics<CR>",                                                                                                   desc = "Document Diagnostics",    nowait = true, remap = false },
  { "<leader>fr",  "<cmd>Telescope lsp_references<CR>",                                                                                                       desc = "Go To References",        nowait = true, remap = false },
  { "<leader>fs",  "<cmd>Telescope lsp_document_symbols<cr>",                                                                                                 desc = "Document Symbols",        nowait = true, remap = false },
  { "<leader>ft",  "<cmd>Telescope lsp_type_definitions<CR>",                                                                                                 desc = "Get Type Definition",     nowait = true, remap = false },
  { "<leader>fu",  "<cmd>LuaSnipUnlinkCurrent<cr>",                                                                                                           desc = "Unlink Snippet",          nowait = true, remap = false },
  { "<leader>fv",  "<cmd>lua require('lsp_lines').toggle()<cr>",                                                                                              desc = "Virtual Text",            nowait = true, remap = false },
  { "<leader>fw",  "<cmd>Trouble workspace_diagnostics<cr>",                                                                                                  desc = "Workspace Diagnostics",   nowait = true, remap = false },
  { "<leader>fx",  "<cmd>lua vim.lsp.buf.rename()<cr>",                                                                                                       desc = "Rename",                  nowait = true, remap = false },
  { "<leader>fW",  group = "Workspace Folders",                                                                                                               nowait = true,                    remap = false },
  { "<leader>fWa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",                                                                                         desc = "Add Workspace Folder",    nowait = true, remap = false },
  { "<leader>fWl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",                                                                   desc = "List Workspace Folders",  nowait = true, remap = false },
  { "<leader>fWr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",                                                                                      desc = "Remove Workspace Folder", nowait = true, remap = false },

  { "<leader>g",   group = "Git",                                                                                                                             nowait = true,                    remap = false },
  { "<leader>gL",  "<cmd>lua require 'gitsigns'.blame_line()<cr>",                                                                                            desc = "Blame Line",              nowait = true, remap = false },
  { "<leader>gR",  "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",                                                                                          desc = "Reset Buffer",            nowait = true, remap = false },
  { "<leader>gb",  "<cmd>Telescope git_branches<cr>",                                                                                                         desc = "Checkout branch",         nowait = true, remap = false },
  { "<leader>gc",  "<cmd>Telescope git_commits<cr>",                                                                                                          desc = "Checkout commit",         nowait = true, remap = false },
  { "<leader>gd",  "<cmd>Gitsigns diffthis HEAD<cr>",                                                                                                         desc = "Diff",                    nowait = true, remap = false },
  { "<leader>gg",  "<cmd>lua _LAZYGIT_TOGGLE()<CR>",                                                                                                          desc = "Lazygit",                 nowait = true, remap = false },
  { "<leader>gj",  "<cmd>lua require 'gitsigns'.next_hunk()<cr>",                                                                                             desc = "Next Hunk",               nowait = true, remap = false },
  { "<leader>gk",  "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",                                                                                             desc = "Prev Hunk",               nowait = true, remap = false },
  { "<leader>gl",  "<cmd>GitBlameToggle<cr>",                                                                                                                 desc = "Blame Toggle",            nowait = true, remap = false },
  { "<leader>go",  "<cmd>Telescope git_status<cr>",                                                                                                           desc = "Open changed file",       nowait = true, remap = false },
  { "<leader>gp",  "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",                                                                                          desc = "Preview Hunk",            nowait = true, remap = false },
  { "<leader>gr",  "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",                                                                                            desc = "Reset Hunk",              nowait = true, remap = false },
  { "<leader>gs",  "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",                                                                                            desc = "Stage Hunk",              nowait = true, remap = false },
  { "<leader>gu",  "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",                                                                                       desc = "Undo Stage Hunk",         nowait = true, remap = false },
  { "<leader>gG",  group = "Gist",                                                                                                                            nowait = true,                    remap = false },
  { "<leader>gGa", "<cmd>Gist -b -a<cr>",                                                                                                                     desc = "Create Anon",             nowait = true, remap = false },
  { "<leader>gGd", "<cmd>Gist -d<cr>",                                                                                                                        desc = "Delete",                  nowait = true, remap = false },
  { "<leader>gGf", "<cmd>Gist -f<cr>",                                                                                                                        desc = "Fork",                    nowait = true, remap = false },
  { "<leader>gGg", "<cmd>Gist -b<cr>",                                                                                                                        desc = "Create",                  nowait = true, remap = false },
  { "<leader>gGl", "<cmd>Gist -l<cr>",                                                                                                                        desc = "List",                    nowait = true, remap = false },
  { "<leader>gGp", "<cmd>Gist -b -p<cr>",                                                                                                                     desc = "Create Private",          nowait = true, remap = false },
  { "<leader>lI",  "<cmd>LspInstallInfo<cr>",                                                                                                                 desc = "Installer Info",          nowait = true, remap = false },
  { "<leader>lc",  "<cmd>lua require('arcane.lsp').server_capabilities()<cr>",                                                                                desc = "Get Capabilities",        nowait = true, remap = false },
  { "<leader>li",  "<cmd>LspInfo<cr>",                                                                                                                        desc = "Info",                    nowait = true, remap = false },

  { "<leader>m",   group = "Session",                                                                                                                         nowait = true,                    remap = false },
  { "<leader>mc",  "<cmd>SessionManager load_curruent_dir_session<cr>",                                                                                       desc = "Find Delete",             nowait = true, remap = false },
  { "<leader>mf",  "<cmd>SessionManager load_session<cr>",                                                                                                    desc = "Find",                    nowait = true, remap = false },
  { "<leader>ml",  "<cmd>SessionManager load_last_session<cr>",                                                                                               desc = "Load Last Session",       nowait = true, remap = false },
  { "<leader>ms",  "<cmd>SessionManager save_current_session<cr>",                                                                                            desc = "Save",                    nowait = true, remap = false },
  { "<leader>mx",  "<cmd>SessionManager delete_session<cr>",                                                                                                  desc = "Delete",                  nowait = true, remap = false },

  { "<leader>n",   group = "Surround",                                                                                                                        nowait = true,                    remap = false },
  { "<leader>n.",  "<cmd>lua require('surround').repeat_last()<cr>",                                                                                          desc = "Repeat",                  nowait = true, remap = false },
  { "<leader>na",  "<cmd>lua require('surround').surround_add(true)<cr>",                                                                                     desc = "Add",                     nowait = true, remap = false },
  { "<leader>nb",  "<cmd>lua require('surround').toggle_brackets()<cr>",                                                                                      desc = "Brackets",                nowait = true, remap = false },
  { "<leader>nd",  "<cmd>lua require('surround').surround_delete()<cr>",                                                                                      desc = "Delete",                  nowait = true, remap = false },
  { "<leader>nq",  "<cmd>lua require('surround').toggle_quotes()<cr>",                                                                                        desc = "Quotes",                  nowait = true, remap = false },
  { "<leader>nr",  "<cmd>lua require('surround').surround_replace()<cr>",                                                                                     desc = "Replace",                 nowait = true, remap = false },

  { "<leader>o",   group = "Options",                                                                                                                         nowait = true,                    remap = false },
  { "<leader>oC",  "<cmd>lua vim.g.cmp_active=true<cr>",                                                                                                      desc = "Completion on",           nowait = true, remap = false },
  { "<leader>oc",  "<cmd>lua vim.g.cmp_active=false<cr>",                                                                                                     desc = "Completion off",          nowait = true, remap = false },
  { "<leader>ol",  '<cmd>lua require("arcane.functions").toggle_option("cursorline")<cr>',                                                                    desc = "Cursorline",              nowait = true, remap = false },
  { "<leader>or",  '<cmd>lua require("arcane.functions").toggle_option("relativenumber")<cr>',                                                                desc = "Relative",                nowait = true, remap = false },
  { "<leader>os",  '<cmd>lua require("arcane.functions").toggle_option("spell")<cr>',                                                                         desc = "Spell",                   nowait = true, remap = false },
  { "<leader>ot",  '<cmd>lua require("arcane.functions").toggle_tabline()<cr>',                                                                               desc = "Tabline",                 nowait = true, remap = false },
  { "<leader>ow",  '<cmd>lua require("arcane.functions").toggle_option("wrap")<cr>',                                                                          desc = "Wrap",                    nowait = true, remap = false },

  { "<leader>p",   group = "Packer",                                                                                                                          nowait = true,                    remap = false },
  { "<leader>pS",  "<cmd>PackerStatus<cr>",                                                                                                                   desc = "Status",                  nowait = true, remap = false },
  { "<leader>pc",  "<cmd>PackerCompile<cr>",                                                                                                                  desc = "Compile",                 nowait = true, remap = false },
  { "<leader>pi",  "<cmd>PackerInstall<cr>",                                                                                                                  desc = "Install",                 nowait = true, remap = false },
  { "<leader>ps",  "<cmd>PackerSync<cr>",                                                                                                                     desc = "Sync",                    nowait = true, remap = false },
  { "<leader>pu",  "<cmd>PackerUpdate<cr>",                                                                                                                   desc = "Update",                  nowait = true, remap = false },

  { "<leader>r",   group = "Replace",                                                                                                                         nowait = true,                    remap = false },
  { "<leader>rf",  "<cmd>lua require('spectre').open_file_search()<cr>",                                                                                      desc = "Replace Buffer",          nowait = true, remap = false },
  { "<leader>rr",  "<cmd>lua require('spectre').open()<cr>",                                                                                                  desc = "Replace",                 nowait = true, remap = false },
  { "<leader>rw",  "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",                                                                         desc = "Replace Word",            nowait = true, remap = false },

  { "<leader>s",   group = "Search",                                                                                                                          nowait = true,                    remap = false },
  { "<leader>sB",  "<cmd>Telescope git_branches<cr>",                                                                                                         desc = "Checkout branch",         nowait = true, remap = false },
  { "<leader>sC",  "<cmd>Telescope colorscheme<cr>",                                                                                                          desc = "Colorscheme",             nowait = true, remap = false },
  { "<leader>sH",  "<cmd>Telescope highlights<cr>",                                                                                                           desc = "Highlights",              nowait = true, remap = false },
  { "<leader>sP",  "<cmd>Telescope projects<cr>",                                                                                                             desc = "Projects",                nowait = true, remap = false },
  { "<leader>sR",  "<cmd>Telescope registers<cr>",                                                                                                            desc = "Registers",               nowait = true, remap = false },
  { "<leader>sb",  "<cmd>Legendary<cr>",                                                                                                                      desc = "Keymaps",                 nowait = true, remap = false },
  { "<leader>sc",  "<cmd>Telescope commands<cr>",                                                                                                             desc = "Commands",                nowait = true, remap = false },
  { "<leader>se",  "<cmd> Telescope file_browser<cr>",                                                                                                        desc = "File Explorer",           nowait = true, remap = false },
  { "<leader>sf",  "<cmd>Telescope find_files<cr>",                                                                                                           desc = "Find files",              nowait = true, remap = false },
  { "<leader>sh",  "<cmd>Telescope help_tags<cr>",                                                                                                            desc = "Help",                    nowait = true, remap = false },
  { "<leader>si",  "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>",                                                                  desc = "Media",                   nowait = true, remap = false },
  { "<leader>sk",  "<cmd>Telescope keymaps<cr>",                                                                                                              desc = "Keymaps",                 nowait = true, remap = false },
  { "<leader>sl",  "<cmd>Telescope resume<cr>",                                                                                                               desc = "Last Search",             nowait = true, remap = false },
  { "<leader>sm",  "<cmd>Telescope man_pages<cr>",                                                                                                            desc = "Man Pages",               nowait = true, remap = false },
  { "<leader>sn",  "<cmd>lua require('telescope').extensions.notify.notify(require('telescope.themes').get_ivy({layout_config={ preview_width=0.8, }}))<cr>", desc = "Notifications",           nowait = true, remap = false },
  { "<leader>so",  "<cmd>TodoTrouble<cr>",                                                                                                                    desc = "Get Todos",               nowait = true, remap = false },
  { "<leader>sp",  "<cmd>Telescope neoclip default<cr>",                                                                                                      desc = "Clipboard",               nowait = true, remap = false },
  { "<leader>sr",  "<cmd>Telescope oldfiles<cr>",                                                                                                             desc = "Recent File",             nowait = true, remap = false },
  { "<leader>ss",  "<cmd>Telescope grep_string<cr>",                                                                                                          desc = "Find String",             nowait = true, remap = false },
  { "<leader>st",  "<cmd>Telescope live_grep<cr>",                                                                                                            desc = "Find Text",               nowait = true, remap = false },
  { "<leader>su",  "<cmd>Telescope ultisnips<cr>",                                                                                                            desc = "UtilSnip Search",         nowait = true, remap = false },

  { "<leader>t",   group = "Terminal",                                                                                                                        nowait = true,                    remap = false },
  { "<leader>t1",  ":1ToggleTerm<cr>",                                                                                                                        desc = "1",                       nowait = true, remap = false },
  { "<leader>t2",  ":2ToggleTerm<cr>",                                                                                                                        desc = "2",                       nowait = true, remap = false },
  { "<leader>t3",  ":3ToggleTerm<cr>",                                                                                                                        desc = "3",                       nowait = true, remap = false },
  { "<leader>t4",  ":4ToggleTerm<cr>",                                                                                                                        desc = "4",                       nowait = true, remap = false },
  { "<leader>tf",  "<cmd>ToggleTerm direction=float<cr>",                                                                                                     desc = "Float",                   nowait = true, remap = false },
  { "<leader>th",  "<cmd>ToggleTerm size=10 direction=horizontal<cr>",                                                                                        desc = "Horizontal",              nowait = true, remap = false },
  { "<leader>tn",  "<cmd>lua _NODE_TOGGLE()<cr>",                                                                                                             desc = "Node",                    nowait = true, remap = false },
  { "<leader>tp",  "<cmd>lua _PYTHON_TOGGLE()<cr>",                                                                                                           desc = "Python",                  nowait = true, remap = false },
  { "<leader>tt",  "<cmd>lua _HTOP_TOGGLE()<cr>",                                                                                                             desc = "Htop",                    nowait = true, remap = false },
  { "<leader>tu",  "<cmd>lua _NCDU_TOGGLE()<cr>",                                                                                                             desc = "NCDU",                    nowait = true, remap = false },
  { "<leader>tv",  "<cmd>ToggleTerm size=80 direction=vertical<cr>",                                                                                          desc = "Vertical",                nowait = true, remap = false },
}

M.whichkey_m_mappings = {
  { "m,", '<cmd>lua require("harpoon.ui").nav_prev()<cr>',          desc = "Harpoon Prev", nowait = true, remap = false },
  { "m.", '<cmd>lua require("harpoon.ui").nav_next()<cr>',          desc = "Harpoon Next", nowait = true, remap = false },
  { "m;", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "Harpoon UI",   nowait = true, remap = false },
  { "mS", "<cmd>silent BookmarkShowAll<cr>",                        desc = "Prev",         nowait = true, remap = false },
  { "ma", "<cmd>silent BookmarkAnnotate<cr>",                       desc = "Annotate",     nowait = true, remap = false },
  { "mb", "<cmd>silent BookmarkToggle<cr>",                         desc = "Toggle",       nowait = true, remap = false },
  { "mc", "<cmd>silent BookmarkClear<cr>",                          desc = "Clear",        nowait = true, remap = false },
  { "mj", "<cmd>silent BookmarkNext<cr>",                           desc = "Next",         nowait = true, remap = false },
  { "mk", "<cmd>silent BookmarkPrev<cr>",                           desc = "Prev",         nowait = true, remap = false },
  { "ml", "<cmd>lua require('arcane.bfs').open()<cr>",              desc = "Buffers",      nowait = true, remap = false },
  { "mm", '<cmd>lua require("harpoon.mark").add_file()<cr>',        desc = "Harpoon",      nowait = true, remap = false },
  { "ms", "<cmd>Telescope harpoon marks<cr>",                       desc = "Search Files", nowait = true, remap = false },
  { "mx", "<cmd>BookmarkClearAll<cr>",                              desc = "Clear All",    nowait = true, remap = false },
}

M.whichkey_v_mappings = {
  { "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', desc = "Comment",   mode = "v", nowait = true, remap = false },
  { "<leader>s", "<esc><cmd>'<,'>SnipRun<cr>",                                                    desc = "Run range", mode = "v", nowait = true, remap = false },
}


return M
