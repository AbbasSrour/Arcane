local status_ok, session = pcall(require, "session_manager")
if not status_ok then
	return
end

local config = require('session_manager.config')
session.setup({
	-- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
	autoload_mode = config.AutoloadMode.Disabled,
})
