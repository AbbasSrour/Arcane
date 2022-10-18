local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

--------------------------------------------------------------------------------------------------------------------------------------
-- Lsp Setup
--------------------------------------------------------------------------------------------------------------------------------------
M.setup = function()
  local icons = require "arcane.utils.kind"
  local signs = {
    { name = "DiagnosticSignError", text = icons.lsp.error },
    { name = "DiagnosticSignWarn", text = icons.lsp.warn },
    { name = "DiagnosticSignHint", text = icons.lsp.hint },
    { name = "DiagnosticSignInfo", text = icons.lsp.info },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local function format(diagnostic)
    local icon = "🦊"
    local message = ""
    if diagnostic.severity == vim.diagnostic.severity.ERROR then
      icon = "🐻"
    end

    if diagnostic.severity == vim.diagnostic.severity.WARN then
      icon = "🦊"
    end

    if diagnostic.severity == vim.diagnostic.severity.HINT then
      icon = "🦉"
    end

    if diagnostic.severity == vim.diagnostic.severity.INFO then
      icon = "🐭"
    end

    if diagnostic.message == nil then
      message = ""
    else
      -- local message = string.format('%s [%s][%s] %s', icon, diagnostic.code, diagnostic.source, diagnostic.message)
      message = string.format("%s %s: %s", icon, diagnostic.source:sub(1, -1), diagnostic.message:sub(1, -2))
    end
    return message
  end

  local config = {
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    signs = {
      active = signs,
    },
    virtual_lines = true,
    virtual_text = {
      spacding = 7,
      update_in_insert = false,
      severity_sort = true,
      prefix = "",
      source = false,
      format = format,
    },
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "if_many", -- Or "always"
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

--------------------------------------------------------------------------------------------------------------------------------------
-- Functionalities
--------------------------------------------------------------------------------------------------------------------------------------
-- Bread Crumbs
local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end
  navic.attach(client, bufnr)
end

-- Show Diagnostics Automatically On hover
local function show_diagnostics_automatically()
  local opts = {
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = "rounded",
    source = false,
    prefix = " ",
  }
  -- vim.o.updatetime = 300
  vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, opts)]]
end

-- Add LightBulb For Code Actions
local function show_lightbulb()
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
end

-- add highlighting to functions and variables
local function lsp_highlight_document(client)
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

-- Get Notification
local function get_noti(client)
  if vim.g.logging_level == "debug" then
    local msg = string.format("Language server %s started!", client.name)
    vim.notify(msg, "info", { title = "LSP" })
  end
end

-- Format On Save
local function Format_On_Save(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end
end

local inline_hints = function(client, bufnr)
  require("lsp-inlayhints").on_attach(client, bufnr)
end

function M.enable_format_on_save()
  vim.cmd [[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.format({ async = false }) 
    augroup end
  ]]
  vim.notify "Enabled format on save"
end

function M.disable_format_on_save()
  M.remove_augroup "format_on_save"
  vim.notify "Disabled format on save"
end

function M.toggle_format_on_save()
  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

vim.cmd [[ command! LspToggleAutoFormat execute 'lua require("user.lsp.handlers").toggle_format_on_save()' ]]

--------------------------------------------------------------------------------------------------------------------------------------
-- Configuring lsp servers
--------------------------------------------------------------------------------------------------------------------------------------
M.on_attach = function(client, bufnr)
  -- lsp_keymaps(bufnr)
  attach_navic(client, bufnr)

  if client.name == "tsserver" then
    inline_hints(client, bufnr)
  end

  if client.name == "jdt.ls" then
    vim.lsp.codelens.refresh()
    if JAVA_DAP_ACTIVE then
      require("jdtls").setup_dap { hotcodereplace = "auto" }
      require("jdtls.dap").setup_dap_main_class_configs()
    end
  end

  -- if client.name == "tsserver" then -- gonna use prettier instead
  --   client.server_capabilities.document_formatting = false
  -- end
  -- if client.name == "emmet_ls" then -- gonna use prettier instead
  --   client.server_capabilities.document_formatting = false
  -- end
  -- if client.name == "html" then -- gonna use prettier instead
  --   client.server_capabilities.document_formatting = false
  -- end
  -- if client.name == "jdtls" then -- gonna use prettier google
  --   client.server_capabilities.document_formatting = false
  -- end
  -- if client.name == "sumneko_lua" then -- gonna use stylua
  --   client.server_capabilities.document_formatting = false
  -- end
  -- if client.name == "jsonls" then -- gonna use prettier
  --   client.server_capabilities.document_formatting = false
  -- end

  show_lightbulb()
  -- lsp_highlight_document(client)
  -- get_noti(client)
  -- show_diagnostics_automatically()
  -- Format_On_Save(client, bufnr)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

return M
