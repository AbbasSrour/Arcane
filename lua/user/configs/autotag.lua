local types = {
	"html",
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	"svelte",
	"vue",
	"tsx",
	"jsx",
	"rescript",
	"xml",
	"php",
	"markdown",
	"glimmer",
	"handlebars",
	"hbs",
}
local tags = {
	"area",
	"base",
	"br",
	"col",
	"command",
	"embed",
	"hr",
	"img",
	"slot",
	"input",
	"keygen",
	"link",
	"meta",
	"param",
	"source",
	"track",
	"wbr",
	"menuitem",
}

require("nvim-treesitter.configs").setup({
	autotag = {
		enable = true,
		filetypes = types,
		skip_tags = tags,
	},
})

-- Note: Why the fuck is this here? 
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 	underline = true,
-- 	virtual_text = {
-- 		spacing = 5,
-- 		severity_limit = "Warning",
-- 	},
-- 	update_in_insert = true,
-- })
