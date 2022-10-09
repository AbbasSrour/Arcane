local hex_status_ok, Hexokinase = pcall(require, "Hexokinase")
if not hex_status_ok then
  return
end

Hexokinase.setup({
  _optInPatterns = "full_hex,rgb,rgba,hsl,hsla,colour_names";
})
