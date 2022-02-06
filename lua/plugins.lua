local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Packer
  use "wbthomason/packer.nvim"

  -- Neovim library
  use "nvim-lua/plenary.nvim"

  -- Popup plugin
  use "nvim-lua/popup.nvim"

  -- Fuzzy finder
  use"nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
  }

  -- Lsp
  use"neovim/nvim-lspconfig"

  -- Lsp installer
  use"williamboman/nvim-lsp-installer"

  -- Cmp
  use"hrsh7th/cmp-nvim-lsp"
  use"hrsh7th/cmp-buffer"
  use"hrsh7th/cmp-path"
  use"hrsh7th/cmp-cmdline"
  use"hrsh7th/nvim-cmp"

  -- Snippets
  use"L3MON4D3/LuaSnip"
  use"rafamadriz/friendly-snippets"

  -- luasnip completion source for nvim-cmp
  use"saadparwaiz1/cmp_luasnip"

  -- Colorscheme
  use"Mofiqul/vscode.nvim"

  -- Fast motions plugins
  use"phaazon/hop.nvim"

  -- Use any combination of buttons to escape from insert mode
  use"max397574/better-escape.nvim"

  -- File Manager
  use {
	"ms-jpq/chadtree",
	branch = "chad",
	run = "python3 -m chadtree deps"
  }

  -- Statusline
  use {
	    'nvim-lualine/lualine.nvim',
		 requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Neovium lsp status
  use"nvim-lua/lsp-status.nvim"


  -- Git signs
  use {
  	"lewis6991/gitsigns.nvim",
  	requires = {
    	"nvim-lua/plenary.nvim"
  	},
	tag = 'release' -- To use the latest release
}

  -- Comment stuff
  use"numToStr/Comment.nvim"

  -- Comment context
  use"JoosepAlviste/nvim-ts-context-commentstring"

  -- Autopairs
  use"windwp/nvim-autopairs"

  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
