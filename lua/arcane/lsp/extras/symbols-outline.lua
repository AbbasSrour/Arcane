local status_ok, symbols_outline = pcall(require, "symbols-outline")
if not status_ok then
  return
end

local icons = require("arcane.utils.kind")
local opts = {
  width = 40,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = { "<Esc>", "q" },
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = icons.symbols_outline.File, hl = "CmpItemKindFile" },
    Module = { icon = icons.symbols_outline.Module, hl = "CmpItemKindModule" },
    Namespace = { icon = icons.symbols_outline.Module, hl = "CmpItemKindModule" },
    Package = { icon = icons.symbols_outline.Module, hl = "CmpItemKindModule" },
    Class = { icon = icons.symbols_outline.Class, hl = "CmpItemKindClass" },
    Method = { icon = icons.symbols_outline.Method, hl = "CmpItemKindMethod" },
    Property = { icon = icons.symbols_outline.Property, hl = "CmpItemKindProperty" },
    Field = { icon = icons.symbols_outline.Field, hl = "CmpItemKindField" },
    Constructor = { icon = icons.symbols_outline.Constructor, hl = "CmpItemKindConstructor" },
    Enum = { icon = icons.symbols_outline.Enum, hl = "CmpItemKindEnum" },
    Interface = { icon = icons.symbols_outline.Interface, hl = "CmpItemKindInterface" },
    Function = { icon = icons.symbols_outline.Function, hl = "CmpItemKindFunction" },
    Variable = { icon = icons.symbols_outline.Variable, hl = "CmpItemKindVariable" },
    Constant = { icon = icons.symbols_outline.Constant, hl = "CmpItemKindConstant" },
    String = { icon = icons.symbols_outline.String, hl = "TSString" },
    Number = { icon = icons.symbols_outline.Number, hl = "TSNumber" },
    Boolean = { icon = icons.symbols_outline.Boolean, hl = "TSBoolean" },
    Array = { icon = icons.symbols_outline.Array, hl = "TSKeyword" },
    Object = { icon = icons.symbols_outline.Object, hl = "TSKeyword" },
    Key = { icon = icons.symbols_outline.Keyword, hl = "CmpItemKeyword" },
    Null = { icon = icons.symbols_outline.Null, hl = "TSKeyword" },
    EnumMember = { icon = icons.symbols_outline.EnumMember, hl = "CmpItemKindEnumMember" },
    Struct = { icon = icons.symbols_outline.Struct, hl = "CmpItemKindStruct" },
    Event = { icon = icons.symbols_outline.Event, hl = "CmpItemKindEvent" },
    Operator = { icon = icons.symbols_outline.Operator, hl = "CmpItemKindOperator" },
    TypeParameter = { icon = icons.symbols_outline.TypeParameter, hl = "CmpItemKindTypeParameter" },
  },
}

symbols_outline.setup(opts)
