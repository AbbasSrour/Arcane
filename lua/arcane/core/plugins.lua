local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

local plugins = {
  -----------------------------------------------------------------------------------------------------------------
  -- Core Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Plugin Mangager have lazy manage itself
  { "folke/lazy.nvim" },

  -- Impatient Speed up loading Lua modules in Neovim to improve startup time.
  { "lewis6991/impatient.nvim" },

  -- FileType Easily speed up your neovim startup time!
  { "nathom/filetype.nvim" },

  -- Plenary All the lua functions I don't want to write twice.
  { "nvim-lua/plenary.nvim" },

  -- Session Mangment
  { "Shatur/neovim-session-manager", event = "VimEnter" },

  -----------------------------------------------------------------------------------------------------------------
  -- UI Plugins:
  -----------------------------------------------------------------------------------------------------------------
  -- Alpha Dashboard
  {
    'goolord/alpha-nvim',
    event = "VimEnter",
  },

}

reload("lazy").setup(plugins, opts)