local M = {}

-- Lsp Setup
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	-- local config = {
	-- 	virtual_text = false,
	-- 	update_in_insert = true,
	-- 	underline = true,
	-- 	severity_sort = true,
	-- 	float = {
	-- 		focusable = false,
	-- 		style = "minimal",
	-- 		border = "rounded",
	-- 		source = "always",
	-- 		header = "",
	-- 		prefix = "",
	-- 	},
	-- }

	-- vim.diagnostic.config(config)

	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = false,
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})

	-- Get The Progress Of LSP
	-- if vim.b.self_core_lsp_client_attached and #vim.tbl_keys(vim.lsp.buf_get_clients()) >= 1 then
	-- 	local lsp_client_name_first = vim.lsp.get_client_by_id(
	-- 		tonumber(vim.inspect(vim.tbl_keys(vim.lsp.buf_get_clients())):match("%d+"))
	-- 	).name:match("[%l%p]+")
	--
	-- 	if lsp_client_name_first ~= nil then
	-- 		local lsp_progress_messages = vim.lsp.util.get_progress_messages()[1]
	--
	-- 		if lsp_progress_messages then
	-- 			local lsp_progress_messages_ms = vim.loop.hrtime() / 1000000
	-- 			local lsp_progress_messages_percentage = lsp_progress_messages.percentage or 0
	-- 			local lsp_progress_messages_spinners = {
	-- 				"",
	-- 				"",
	-- 				"",
	-- 			}
	-- 			local lsp_progress_messages_frame = math.floor(lsp_progress_messages_ms / 120)
	-- 				% #lsp_progress_messages_spinners
	--
	-- 			if lsp_progress_messages_percentage <= 70 then
	-- 				return lsp_progress_messages_spinners[lsp_progress_messages_frame + 1] .. " "
	-- 			elseif lsp_progress_messages_percentage >= 70 then
	-- 				return " "
	-- 			end
	-- 		end
	-- 	end
	-- end
end

--------------------------------------------------------------------------------------------------------------------------------------
-- Configuring lsp servers
--------------------------------------------------------------------------------------------------------------------------------------

-- add highlighting to functions and variables
local function lsp_highlight_document(client)
	if client.resolved_capabilities.document_highlight then
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

-- Configure what capabilities the laguage server will have and adding to them (to be used in the installer file)
M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_highlight_document(client)
end

-- Adding Cmp lsp to the client capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
