local status_ok, signature = pcall(require, "lsp_signature")
if not status_ok then
  return
end

local icons = require("arcane.utils.kind")

local cfg = {
  doc_lines = 0,
  floating_window = false,
  floating_window_above_cur_line = false,
  hint_enable = true,
  hint_prefix = icons.lsp.signature .. " ",
  hint_scheme = "Comment",
  use_lspsaga = false,
  hi_parameter = "LspSignatureActiveParameter",
  max_height = 12,
  max_width = 120,
}

-- recommanded:
signature.setup(cfg)
signature.on_attach(cfg)
