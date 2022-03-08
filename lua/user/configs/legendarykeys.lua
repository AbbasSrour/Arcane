local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
	return
end

legendary.setup({
	include_builtin = false,
	select_prompt = "⚡ Search Keymaps ⚡",

	keymaps = require("user.core.keymaps").keymaps,
	commands = require("user.core.keymaps").commands,
	autocmds = require("user.core.keymaps").autocmds,
	auto_register_which_key = true,
})

local whichkey_mappings = require("user.core.keymaps").WhichkeyMappings
local whichkey_opts = require("user.core.keymaps").WhichkeyOpts
require("which-key").register(whichkey_mappings, whichkey_opts)
