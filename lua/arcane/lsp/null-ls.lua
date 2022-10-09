local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup({
  debug = false,
  sources = {
    formatting.google_java_format, -- Reformats Java source code according to Google Java Style.
    formatting.stylua, -- A fast and opinionated Lua formatter written in Rust. Highly recommended!
    formatting.shfmt, -- A shell parser, formatter, and interpreter with bash support.
    formatting.prettier.with {
      extra_filetypes = { "toml" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    formatting.shfmt,
    diagnostics.shellcheck,
  },
})

-- local unwrap = {
--   method = null_ls.methods.DIAGNOSTICS,
--   filetypes = { "rust" },
--   generator = {
--     fn = function(params)
--       local diagnostics = {}
--       -- sources have access to a params object
--       -- containing info about the current file and editor state
--       for i, line in ipairs(params.content) do
--         local col, end_col = line:find "unwrap()"
--         if col and end_col then
--           -- null-ls fills in undefined positions
--           -- and converts source diagnostics into the required format
--           table.insert(diagnostics, {
--             row = i,
--             col = col,
--             end_col = end_col,
--             source = "unwrap",
--             message = "hey " .. os.getenv("USER") .. ", don't forget to handle this",
--             severity = 2,
--           })
--         end
--       end
--       return diagnostics
--     end,
--   },
-- }

-- null_ls.register(unwrap)
