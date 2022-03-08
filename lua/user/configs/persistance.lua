require("persistence").setup({
	dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"),
	options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
})
