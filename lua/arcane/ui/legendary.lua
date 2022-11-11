local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
  return
end

legendary.setup({
  include_builtin = false,
  select_prompt = "⚡ Search Keymaps ⚡",

  which_key={
    auto_register = true
  },
  keymaps = require("arcane.core.keymaps").keymaps,
  commands = require("arcane.core.keymaps").commands,
  autocmds = require("arcane.core.keymaps").autocmds,
})
