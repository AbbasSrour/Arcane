local status_ok, tsht = pcall(require, "tsht")
if not status_ok then
  return
end

tsht.config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
