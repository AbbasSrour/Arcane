local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	debug = false,
	sources = {
		formatting.google_java_format, -- Reformats Java source code according to Google Java Style.
		formatting.stylua, -- A fast and opinionated Lua formatter written in Rust. Highly recommended!
		formatting.prettier,
		formatting.shfmt, -- A shell parser, formatter, and interpreter with bash support.
	},
})
