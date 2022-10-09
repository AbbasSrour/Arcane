local status_ok, lightbulb = pcall(require, "nvim-lightbulb")
if not status_ok then
  return
end

local kind = require("arcane.utils.kind")

lightbulb.setup({
  ignore = {},
  sign = {
    enabled = false,
    priority = 10,
  },
  float = {
    enabled = false,
    text = kind.lsp.code_action .. " ",
    win_opts = {},
  },
  virtual_text = {
    enabled = true,
    text = kind.lsp.code_action .. " ",
    hl_mode = "combine",
  },
  status_text = {
    enabled = false,
    text = kind.lsp.code_action .. " ",
    text_unavailable = "No Code Actions",
  },
})
