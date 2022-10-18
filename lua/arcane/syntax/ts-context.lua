local status_ok, context = pcall(require, "treesitter-context")
if not status_ok then
  return
end

context.setup ({
  enable = true,
  throttle = true,
  max_lines = 1,
  patterns = {
    default = {
      "class",
      "function",
      "method",
      "for",
      "while",
      "if",
      "switch",
      "case",
    },
  },
  exact_patterns = {
  },
})

-- Commands
-- TSContextEnable, TSContextDisable and TSContextToggle.
--
-- Appearance
-- Use the highlight group TreesitterContext to change the colors of the context. Per default it links to NormalFloat.
