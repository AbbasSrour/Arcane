local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "all", -- one of "all" or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing

  highlight = {
    enable = true,
    disable = { "markdown" },
    additional_vim_regex_highlighting = true,
    -- use_languagetree = true,
  },

  indent = { enable = true, disable = { "python", "css", "rust", "yaml" } },

  -- Plugins
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      typescript = "// %s",
      css = "/* %s */",
      scss = "/* %s */",
      html = "<!-- %s -->",
      svelte = "<!-- %s -->",
      vue = "<!-- %s -->",
      json = "",
    },
  },

  playground = {
    enable = true,
  },

  autopairs = {
    enable = true,
  },

  autotag = {
    enable = true,
    disable = { "xml", "markdown" },
  },
}
