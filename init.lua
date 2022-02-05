require "configs"
require "plugins"
require "options"
require "keymaps"
require "colorscheme"

vim.api.nvim_set_option('number', true)
vim.api.nvim_set_option('relativenumber', true)
vim.api.nvim_set_option('autoindent', true)
vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)
vim.api.nvim_set_option('smarttab', true)
vim.api.nvim_set_option('softtabstop', 4)
vim.api.nvim_set_option('mouse', 'a')
vim.api.nvim_set_option('clipboard', vim.api.nvim_get_option('clipboard') .. 'unnamedplus')
vim.api.nvim_set_option('pastetoggle', '<F2>')
