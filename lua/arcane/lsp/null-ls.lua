local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup {
  debug = false,
  sources = {
    -- Clangd
    formatting.google_java_format, -- Reformats Java source code according to Google Java Style.
    -- Python
    formatting.black.with { extra_args = { "--fast" } },
    --Lua
    formatting.stylua, -- A fast and opinionated Lua formatter written in Rust. Highly recommended!
    -- JavaScript
    -- diagnostics.eslint_d,
    -- formatting.eslint_d,
    -- code_actions.eslint_d,
    -- completion.eslint_d,
    formatting.prettier.with {
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    -- Shell
    formatting.shfmt, -- A shell parser, formatter, and interpreter with bash support.
    -- Misc
    diagnostics.shellcheck,
  },
}
