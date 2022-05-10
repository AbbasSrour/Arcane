local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end
local utils = require("user.utils.notifications")

-- local MyServers = {
-- }
-- for server_name, _ in pairs(MyServers) do
-- 	local lsp_installer_servers = require("nvim-lsp-installer.servers")
-- 	local server_available, server = lsp_installer_servers.get_server(server_name)
-- 	if server_available then
-- 		if not server:is_installed() then
-- 			utils.info("Installing " .. server.name)
-- 			server:install()
-- 		end
-- 	else
-- 		utils.error(server)
-- 	end
-- end

lsp_installer.setup({
	ensure_installed = {
		"html",
		"pyright",
		"sumneko_lua",
		"tsserver",
		"cssls",
		"emmet_ls",
		"clangd",
		"jdtls",
	},
})

local on_attach = require("user.plugins.lsp.handlers").on_attach
local capabilities = require("user.plugins.lsp.handlers").capabilities
local sumneko_opts = require("user.plugins.lsp.settings.sumneko_lua")

for _, server in ipairs(lsp_installer.get_installed_servers()) do
	require("lspconfig")[server.name].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	})
end
