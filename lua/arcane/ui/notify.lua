local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

local icons = require("arcane.utils.kind")

notify.setup({
  stages = "fade_in_slide_out",
  on_open = nil,
  background_colour = "#000000",
  on_close = nil,
  render = "default",
  timeout = 175,
  background_colour = "Normal",
  minimum_width = 10,
  max_width = 100,
  icons = {
    ERROR = icons.lsp.error,
    WARN = icons.lsp.warn,
    INFO = icons.lsp.info,
    DEBUG = icons.lsp.debug,
    TRACE = icons.lsp.trace,
  },
})
