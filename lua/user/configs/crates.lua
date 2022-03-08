require("crates").setup({
	smart_insert = true,
	insert_closing_quote = true,
	avoid_prerelease = true,
	autoload = true,
	autoupdate = true,
	loading_indicator = true,
	date_format = "%Y-%m-%d",
	disable_invalid_feature_diagnostic = false,
	text = {
		loading = "   Loading",
		version = "   %s",
		prerelease = "   %s",
		yanked = "   %s",
		nomatch = "   No match",
		upgrade = "   %s",
		error = "   Error fetching crate",
	},
	highlight = {
		loading = "CratesNvimLoading",
		version = "CratesNvimVersion",
		prerelease = "CratesNvimPreRelease",
		yanked = "CratesNvimYanked",
		nomatch = "CratesNvimNoMatch",
		upgrade = "CratesNvimUpgrade",
		error = "CratesNvimError",
	},
	popup = {
		autofocus = false,
		copy_register = '"',
		style = "minimal",
		border = "none",
		version_date = false,
		max_height = 30,
		min_width = 20,
		text = {
			title = "  %s ",
			version = "   %s ",
			prerelease = "  %s ",
			yanked = "  %s ",
			date = " %s ",
			feature = "   %s ",
			enabled = "  %s ",
			transitive = "  %s ",
		},
		highlight = {
			title = "CratesNvimPopupTitle",
			version = "CratesNvimPopupVersion",
			prerelease = "CratesNvimPopupPreRelease",
			yanked = "CratesNvimPopupYanked",
			feature = "CratesNvimPopupFeature",
			enabled = "CratesNvimPopupEnabled",
			transitive = "CratesNvimPopupTransitive",
		},
		keys = {
			hide = { "q", "<esc>" },
			select = { "<cr>" },
			select_alt = { "s" },
			copy_version = { "yy" },
			toggle_feature = { "<cr>" },
			goto_feature = { "gd", "K" },
			jump_forward_feature = { "<c-i>" },
			jump_back_feature = { "<c-o>" },
		},
	},
	cmp = {
		insert_closing_quote = true,
		text = {
			prerelease = "  pre-release ",
			yanked = "  yanked ",
		},
	},
})

-- Integrating crates in init.lua
-- vim.api.nvim_set_keymap('n', 'K', ':lua show_documentation()', { noremap = true, silent = true })
-- function show_documentation()
--     local filetype = vim.bo.filetype
--     if vim.tbl_contains({ 'vim','help' }, filetype) then
--         vim.cmd('h '..vim.fn.expand('<cword>'))
--     elseif vim.tbl_contains({ 'man' }, filetype) then
--         vim.cmd('Man '..vim.fn.expand('<cword>'))
--     elseif vim.fn.expand('%:t') == 'Cargo.toml' then
--         require('crates').show_popup()
--     else
--         vim.lsp.buf.hover()
--     end
-- end

-- Keymaps
-- nnoremap <silent> <leader>ct :lua require('crates').toggle()<cr>
-- nnoremap <silent> <leader>cr :lua require('crates').reload()<cr>
--
-- nnoremap <silent> <leader>cv :lua require('crates').show_versions_popup()<cr>
-- nnoremap <silent> <leader>cf :lua require('crates').show_features_popup()<cr>
--
-- nnoremap <silent> <leader>cu :lua require('crates').update_crate()<cr>
-- vnoremap <silent> <leader>cu :lua require('crates').update_crates()<cr>
-- nnoremap <silent> <leader>ca :lua require('crates').update_all_crates()<cr>
-- nnoremap <silent> <leader>cU :lua require('crates').upgrade_crate()<cr>
-- vnoremap <silent> <leader>cU :lua require('crates').upgrade_crates()<cr>
-- nnoremap <silent> <leader>cA :lua require('crates').upgrade_all_crates()<cr>

-- Functions fro which key for example:
-- -- Setup config and auto commands.
-- require('crates').setup(cfg: Config)
--
-- -- Disable UI elements (virtual text and diagnostics).
-- require('crates').hide()
-- -- Enable UI elements (virtual text and diagnostics).
-- require('crates').show()
-- -- Enable or disable UI elements (virtual text and diagnostics).
-- require('crates').toggle()
-- -- Update data. Optionally specify which `buf` to update.
-- require('crates').update(buf: integer|nil)
-- -- Reload data (clears cache). Optionally specify which `buf` to reload.
-- require('crates').reload(buf: integer|nil)
--
-- -- Upgrade the crate on the current line.
-- -- If the `alt` flag is passed as true, the opposite of the `smart_insert` config
-- -- option will be used to insert the version.
-- require('crates').upgrade_crate(alt: boolean|nil)
-- -- Upgrade the crates on the lines visually selected.
-- -- See `crates.upgrade_crate()`.
-- require('crates').upgrade_crates(alt: boolean|nil)
-- -- Upgrade all crates in the buffer.
-- -- See `crates.upgrade_crate()`.
-- require('crates').upgrade_all_crates(alt: boolean|nil)
--
-- -- Update the crate on the current line.
-- -- See `crates.upgrade_crate()`.
-- require('crates').update_crate(alt: boolean|nil)
-- -- Update the crates on the lines visually selected.
-- -- See `crates.upgrade_crate()`.
-- require('crates').update_crates(alt: boolean|nil)
-- -- Update all crates in the buffer.
-- -- See `crates.upgrade_crate()`.
-- require('crates').update_all_crates(alt: boolean|nil)
--
-- -- Show/hide popup with all versions, all features or details about one feature.
-- -- If `popup.autofocus` is disabled calling this again will focus the popup.
-- require('crates').show_popup()
-- -- Same as `crates.show_popup()` but always show versions.
-- require('crates').show_versions_popup()
-- -- Same as `crates.show_popup()` but always show features or features details.
-- require('crates').show_features_popup()
-- -- Focus the popup (jump into the floating window).
-- -- Optionally specify the line to jump to, inside the popup.
-- require('crates').focus_popup(line: integer|nil)
-- -- Hide the popup.
-- require('crates').hide_popup()
