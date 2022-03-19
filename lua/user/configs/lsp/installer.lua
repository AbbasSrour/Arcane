local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end
local utils = require("user.utils.notifications")

-- Automatic Installion of Some Servers
local MyServers = {
	html = {},
	pyright = {},
	sumneko_lua = {},
	tsserver = {},
	cssls = {},
	emmet_ls = {},
	clangd = {},
	jdtls = {},
}
for server_name, _ in pairs(MyServers) do
	local lsp_installer_servers = require("nvim-lsp-installer.servers")
	local server_available, server = lsp_installer_servers.get_server(server_name)
	if server_available then
		if not server:is_installed() then
			utils.info("Installing " .. server.name)
			server:install()
		end
	else
		utils.error(server)
	end
end

-- Server Setup, servers get opts from the handlers files and can be augmented with opts from the json files
function Server_Setup(server)
	local opts = {
		on_attach = require("user.configs.lsp.handlers").on_attach,
		capabilities = require("user.configs.lsp.handlers").capabilities,
	}
	if server.name == "jsonls" then
		local jsonls_opts = require("user.configs.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end
	if server.name == "sumneko_lua" then
		local sumneko_opts = require("user.configs.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end
	-- utils.info("Setting Up " .. server.name)
	server:setup(opts)
end

lsp_installer.on_server_ready(function(server)
	Server_Setup(server)
end)
