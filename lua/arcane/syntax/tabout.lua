local status_ok, tabout = pcall(require, "tabout")
if not status_ok then
  return
end

tabout.setup {
  enable_backwards = false,
  ignore_beginning = false,
  exclude = { "markdown" },
}
