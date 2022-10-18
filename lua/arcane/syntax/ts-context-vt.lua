local status_ok, vrcontext = pcall(require, "nvim_context_vt")
if not status_ok then
  return
end

vrcontext.setup({
	prefix = "🕊️ ",
	-- prefix = "",

	disable_ft = { "markdown" },
	disable_virtual_lines = false,
	disable_virtual_lines_ft = { "yaml" },
	min_rows = 1,
	min_rows_ft = {},
})
