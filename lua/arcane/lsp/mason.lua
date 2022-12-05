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

mason.setup {
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
}

mason_lspconfig.setup {
  ensure_installed = {
    "html",
    "emmet_ls",
    "cssls",
    "cssmodules_ls",
    "tsserver",

    "gopls",
    "jdtls",
    "clangd",

    "sumneko_lua",
    "pyright",
    "bashls",

    "jsonls",
    "yamlls",
  },
  automatic_installation = true,
}

mason_null_ls.setup {
  ensure_installed = { "stylua", "prettier", "eslint" },
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(mason_lspconfig.get_installed_servers()) do
  opts = {
    on_attach = require("arcane.lsp.handlers").on_attach,
    capabilities = require("arcane.lsp.handlers").capabilities,
  }

  local has_custom_opts, server_custom_opts = pcall(require, "arcane.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end

  if server == "sumneko_lua" then
    local l_status_ok, lua_dev = pcall(require, "neodev")
    if not l_status_ok then
      return
    end
    lua_dev.setup()
  end

  lspconfig[server].setup(opts)
  ::continue::
end
