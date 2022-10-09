local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
  return
end

legendary.setup({
  include_builtin = false,
  select_prompt = "⚡ Search Keymaps ⚡",

  keymaps = require("arcane.core.keymaps").keymaps,
  commands = require("arcane.core.keymaps").commands,
  autocmds = require("arcane.core.keymaps").autocmds,
  auto_register_which_key = true,
})
