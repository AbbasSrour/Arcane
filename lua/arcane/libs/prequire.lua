_G.prequire = function(package, notify)
  local status, lib = pcall(require, package)
  if status then
    return lib
  else
    if notify then
      vim.notify("Failed to require '" .. package .. "' from " .. debug.getinfo(2).source, vim.diagnostic.severity.INFO)
    end
    return nil
  end
end
