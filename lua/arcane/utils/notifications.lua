local M = {}

function M.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.log(msg, hl, name)
  name = name or "Neovim"
  hl = hl or "Todo"
  vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

function M.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name })
end

function M.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

function M.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end

return M

-- Get The Progress Of LSP
-- if vim.b.self_core_lsp_client_attached and #vim.tbl_keys(vim.lsp.buf_get_clients()) >= 1 then
-- 	local lsp_client_name_first = vim.lsp.get_client_by_id(
-- 		tonumber(vim.inspect(vim.tbl_keys(vim.lsp.buf_get_clients())):match("%d+"))
-- 	).name:match("[%l%p]+")
--
-- 	if lsp_client_name_first ~= nil then
-- 		local lsp_progress_messages = vim.lsp.util.get_progress_messages()[1]
--
-- 		if lsp_progress_messages then
-- 			local lsp_progress_messages_ms = vim.loop.hrtime() / 1000000
-- 			local lsp_progress_messages_percentage = lsp_progress_messages.percentage or 0
-- 			local lsp_progress_messages_spinners = {
-- 				"",
-- 				"",
-- 				"",
-- 			}
-- 			local lsp_progress_messages_frame = math.floor(lsp_progress_messages_ms / 120)
-- 				% #lsp_progress_messages_spinners
--
-- 			if lsp_progress_messages_percentage <= 70 then
-- 				return lsp_progress_messages_spinners[lsp_progress_messages_frame + 1] .. " "
-- 			elseif lsp_progress_messages_percentage >= 70 then
-- 				return " "
-- 			end
-- 		end
-- 	end
-- end
