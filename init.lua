require 'core.keymaps'
require 'core.options'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.mason',
  require 'plugins.alpha',
  require 'plugins.autocomplete',
  require 'plugins.autoformat',
  require 'plugins.colorscheme',
  require 'plugins.comment-vim',
  require 'plugins.debug',
  require 'plugins.gitsigns',
  require 'plugins.lazygit',
  require 'plugins.lint',
  require 'plugins.lsp',
  require 'plugins.misc',
  require 'plugins.neotree',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.vim_tmux_navigator',
}
