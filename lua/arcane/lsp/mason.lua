local l_status_ok, lua_dev = pcall(require, "neodev")
if not l_status_ok then
  return
end

local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
  return
end

---@diagnostic disable-next-line: redundant-parameter
mason.setup ({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
})

mason_lspconfig.setup {
  ensure_installed = {
    -- "html",
    -- "emmet_ls",
    -- "cssls",
    -- "cssmodules_ls",
    -- "tsserver",

    -- "gopls",
    -- "jdtls",
    -- "clangd",

    -- "lua_language_server",
    -- "pyright",
    -- "bashls",

    -- "jsonls",
    -- "yamlls",
  },
  automatic_installation = true,
}

mason_null_ls.setup {
  ensure_installed = { "stylua", "prettier", "eslint_d" },
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end


for _, server in pairs(mason_lspconfig.get_installed_servers()) do
  local default_opts = {}
  local server_opts = {}
  local server_custom_opts, has_custom_opts = prequire("arcane.lsp.settings." .. server, false)

  default_opts = {
    on_attach = require("arcane.lsp.handlers").on_attach,
    capabilities = require("arcane.lsp.handlers").capabilities,
  }

  if has_custom_opts then
    server_opts = vim.tbl_deep_extend("force", server_custom_opts, default_opts)
  end

  if server == "sumneko_lua" then
    lua_dev.setup()
  end

  lspconfig[server].setup(server_opts)
  ::continue::
end
