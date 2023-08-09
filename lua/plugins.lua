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
require("lazy").setup({
    { 'Bekaboo/deadcolumn.nvim' },
--      { 'Bekaboo/dropbar.nvim' },
-- {
  -- 'glepnir/dashboard-nvim',
  -- event = 'VimEnter',
  -- config = function()
  --   require('dashboard').setup {
      -- config
    -- }
  -- end,
  -- dependencies = { {'nvim-tree/nvim-web-devicons'}}
-- },
"jghauser/mkdir.nvim",
{
  'stevearc/dressing.nvim',
  opts = {},
},
'f-person/git-blame.nvim',
{
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
},
"karb94/neoscroll.nvim",
"alec-gibson/nvim-tetris",
  "MaximilianLloyd/ascii.nvim",
	"MunifTanjim/nui.nvim",
	"yamatsum/nvim-cursorline",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  'm00qek/baleia.nvim',
  'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
  'samodostal/image.nvim',
    'nvim-lua/plenary.nvim',
'edluffy/hologram.nvim',
'Xuyuanp/scrollbar.nvim',

{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
},

'neovim/nvim-lspconfig',
'rmagatti/auto-session',
'jose-elias-alvarez/null-ls.nvim',
'MunifTanjim/prettier.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-lua/plenary.nvim',
"notken12/base46-colors",
"NvChad/nvterm",
"lewis6991/gitsigns.nvim",
{
    "NvChad/ui",
    branch = "v2.0",
    lazy = false,
  },
"williamboman/mason.nvim",
"williamboman/mason-lspconfig.nvim",
"glepnir/lspsaga.nvim",
"hrsh7th/nvim-cmp",
"nvim-treesitter/nvim-treesitter",
"hrsh7th/cmp-nvim-lsp",
  'nvim-lualine/lualine.nvim',
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
},
"lukas-reineke/indent-blankline.nvim",
"rafamadriz/friendly-snippets",
{
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
},
'akinsho/bufferline.nvim',

})
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy: Manage plugins' })
