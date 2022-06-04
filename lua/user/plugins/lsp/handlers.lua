local M = {}

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

-- local lspconfig = require("lspconfig")
local icons = require("user.utils.kind")

--------------------------------------------------------------------------------------------------------------------------------------
-- Lsp Setup
--------------------------------------------------------------------------------------------------------------------------------------
M.setup = function()
	-- Set Sign Icons
	local signs = {
		{ name = "DiagnosticSignError", text = icons.lsp.error },
		{ name = "DiagnosticSignWarn", text = icons.lsp.warn },
		{ name = "DiagnosticSignHint", text = icons.lsp.hint },
		{ name = "DiagnosticSignInfo", text = icons.lsp.info },
	}
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	-- Set Completion Icons
	function M.setup()
		local kinds = vim.lsp.protocol.CompletionItemKind
		for i, kind in ipairs(kinds) do
			kinds[i] = M.icons[kind] or kind
		end
	end

	-- Configure diagnostics
	vim.diagnostic.config({
		update_in_insert = true,
		underline = false,
		severity_sort = true,
		signs = true,
		virtual_text = {
			source = "always",
			prefix = icons.lsp.virtual .. " ",
		},
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	})

	-- configure dignostic windows
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
-- Show Diagnostics Automatically On hover
local function show_diagnostics_automatically()
	local opts = {
		focusable = false,
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		border = "rounded",
		source = "always",
		prefix = " ",
	}
	-- vim.o.updatetime = 300
	vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, opts)]])
end

-- Add LightBulb For Code Actions
local function show_lightbulb()
	vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
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
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

--------------------------------------------------------------------------------------------------------------------------------------
-- Configuring lsp servers
--------------------------------------------------------------------------------------------------------------------------------------
-- Configure what capabilities the laguage server will have and adding to them (to be used in the installer file)
---@diagnostic disable-next-line: unused-local
M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end
	if client.name == "emmet_ls" then
		client.server_capabilities.document_formatting = false
	end
	if client.name == "html" then
		client.server_capabilities.document_formatting = false
	end
	if client.name == "jdtls" then
		client.server_capabilities.document_formatting = false
	end
	if client.name == "sumneko_lua" then
		client.server_capabilities.document_formatting = false
	end

	-- show_diagnostics_automatically()
	show_lightbulb()
	lsp_highlight_document(client)
	get_noti(client)
	Format_On_Save(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

return M