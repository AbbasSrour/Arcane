M = {}

M.server_capabilities = function()
  local active_clients = vim.lsp.get_active_clients()
  local active_client_map = {}

  for index, value in ipairs(active_clients) do
    active_client_map[value.name] = index
  end

  vim.ui.select(vim.tbl_keys(active_client_map), {
    prompt = "Select client:",
    format_item = function(item)
      return "capabilites for: " .. item
    end,
  }, function(choice)
    print(vim.inspect(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities.executeCommandProvider))
    vim.pretty_print(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities)
  end)
end

reload("arcane.lsp.mason")
require("arcane.lsp.handlers").setup()
reload("arcane.lsp.null-ls")
reload('arcane.lsp.extras.fidget')
reload('arcane.lsp.extras.illuminate')
reload('arcane.lsp.extras.lightbulb')
reload("arcane.lsp.extras.lsp-signature")
reload('arcane.lsp.extras.lsp-inlayhints')
reload('arcane.lsp.extras.navic')
reload('arcane.lsp.extras.symbols-outline')
reload('arcane.lsp.extras.lsp_lines')

return M
