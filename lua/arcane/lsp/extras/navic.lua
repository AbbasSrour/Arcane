local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local icons = require('arcane.utils.kind')

navic.setup({
  icons = {
    File = icons.symbols_outline.File,
    Module = icons.symbols_outline.Module,
    Namespace = icons.symbols_outline.Namespace,
    Package = icons.symbols_outline.Package,
    Class = icons.symbols_outline.Class,
    Method = icons.symbols_outline.Method,
    Property = icons.symbols_outline.Property,
    Field = icons.symbols_outline.Field,
    Constructor = icons.symbols_outline.Constructor,
    Enum = icons.symbols_outline.Enum,
    Interface = icons.symbols_outline.Interface,
    Function = icons.symbols_outline.Function,
    Variable = icons.symbols_outline.Variable,
    Constant = icons.symbols_outline.Constant,
    String = icons.symbols_outline.String,
    Number = icons.symbols_outline.Number,
    Boolean = icons.symbols_outline.Boolean,
    Array = icons.symbols_outline.Array,
    Object = icons.symbols_outline.Object,
    Key = icons.symbols_outline.Key,
    Null = icons.symbols_outline.Null,
    EnumMember = icons.symbols_outline.EnumMember,
    Struct = icons.symbols_outline.Struct,
    Event = icons.symbols_outline.Event,
    Operator = icons.symbols_outline.Operator,
    TypeParameter = icons.symbols_outline.TypeParameter
  },
  highlight = true,
  separator = " " .. icons.misc.ChevronRight .. " ",
})
