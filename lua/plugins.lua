
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', 
  },
}
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end
}
use('neovim/nvim-lspconfig')
use('jose-elias-alvarez/null-ls.nvim')
use('MunifTanjim/prettier.nvim')
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  requires = { {'nvim-lua/plenary.nvim'} }
}
use "notken12/base46-colors"
use "NvChad/nvterm"
use "lewis6991/gitsigns.nvim"
use "NvChad/ui"
use "williamboman/mason.nvim"
use "williamboman/mason-lspconfig.nvim"
use "glepnir/lspsaga.nvim"
use "hrsh7th/nvim-cmp"
use "nvim-treesitter/nvim-treesitter"
use "hrsh7th/cmp-nvim-lsp"
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
use "lukas-reineke/indent-blankline.nvim"
use "rafamadriz/friendly-snippets"
use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
})

end)
