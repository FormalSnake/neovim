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
	-- limits line width
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
	-- Creates missing files on save
	"jghauser/mkdir.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	-- Makes the UI pretty :)
	{
		'stevearc/dressing.nvim',
		opts = {},
	},
	-- Inline git blame to see who made the line
	'f-person/git-blame.nvim',
	-- Allows you to comment current lines using a shortcut
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	-- This adds fun physics to your code if you are bored :D
	'eandrju/cellular-automaton.nvim',
	-- Shows you all of the functions, etc. in your file
	'simrat39/symbols-outline.nvim',
	-- Adds the notifications and stuff
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},
	-- Allows you to make the background translucent
	'xiyaowong/transparent.nvim',
	-- This adds a scrollbar (doesn't work)
	-- 'petertriho/nvim-scrollbar',
	-- This adds LSP progress indicators
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
	-- NOTE: There is highlighting O.O
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },

	},
	-- Better search
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		-- stylua: ignore
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function() require("flash").jump() end,
				desc =
				"Flash"
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function() require("flash").treesitter() end,
				desc =
				"Flash Treesitter"
			},
			{
				"r",
				mode = "o",
				function() require("flash").remote() end,
				desc =
				"Remote Flash"
			},
			{
				"R",
				mode = { "o", "x" },
				function() require("flash").treesitter_search() end,
				desc =
				"Treesitter Search"
			},
			{
				"<c-s>",
				mode = { "c" },
				function() require("flash").toggle() end,
				desc =
				"Toggle Flash Search"
			},
		},
	},
	-- Color picker
	'uga-rosa/ccc.nvim',
	-- This generates gitignores
	'wintermute-cell/gitignore.nvim',
	-- This allows you to center the current buffer to reduce stress on your neck
	{ "shortcuts/no-neck-pain.nvim", version = "*" },
	-- This makes the errors in your code point to the characters using lines, but it does get messy sometimes
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- Inline colors, like red
	"nvChad/nvim-colorizer.lua",
	-- Same thing as before, but can display hsl(296, 25, 50%)
	'brenoprata10/nvim-highlight-colors',
	-- Formats on save
	"elentok/format-on-save.nvim",
	-- Adds indicators to see what function you're in
	{ "lukas-reineke/indent-blankline.nvim" },
	-- Tetris ;)
	"alec-gibson/nvim-tetris",
	-- This allows for us to show images in neovim using any terminal emulator!!
	"MaximilianLloyd/ascii.nvim",
	-- UI library required for the fancy UI ones
	"MunifTanjim/nui.nvim",
	-- This adds colors to tailwind syntax highlighting
	"roobert/tailwindcss-colorizer-cmp.nvim",
	-- Highlights words under your cursor, and also the same words accross the file
	"yamatsum/nvim-cursorline",
	-- The best theme ever
	{ "catppuccin/nvim",                    name = "catppuccin", priority = 1000 },
	-- IDK, plugins require it
	'm00qek/baleia.nvim',
	-- Sidebar file explorer, mostly for aesthetics
	'nvim-tree/nvim-tree.lua',
	-- This provides icons for the file managers, etc.
	'nvim-tree/nvim-web-devicons',
	-- The frontend for the ascii.nvim
	'samodostal/image.nvim',
	-- Lua function wrapper
	'nvim-lua/plenary.nvim',
	-- Shows the git diff in another buffer
	'sindrets/diffview.nvim',
	-- Shows you all warning and errors in your file
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
		}

	},
	-- 'Xuyuanp/scrollbar.nvim',
	-- Shows which keybinds there are and to what they correspond
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	-- Lets you configure the lsp
	'neovim/nvim-lspconfig',
	-- Sessions like in vscode
	'rmagatti/auto-session',
	-- prettier
	'MunifTanjim/prettier.nvim',
	-- Allows you to fuzzyfind files and buffers, etc.
	'nvim-telescope/telescope.nvim',
	-- Makes the theme work with the custom telescope layout
	"notken12/base46-colors",
	-- Built in terminal if you are too lazy to use tmux panes
	"NvChad/nvterm",
	-- Git features
	"lewis6991/gitsigns.nvim",
	-- LSP installer
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	-- Improves lsp idk
	"glepnir/lspsaga.nvim",
	-- Shows the fancy autocomplete window O.O
	"hrsh7th/nvim-cmp",
	-- your code gets colors O.O
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- CMP with LSP integration
	"hrsh7th/cmp-nvim-lsp",
	-- The bar at the bottom of your neovim, mostly for aesthetics
	'nvim-lualine/lualine.nvim',
	-- This autocompletes things like () and {}
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	-- Some snippets, did not get this to work tho
	"rafamadriz/friendly-snippets",
	-- Lua snippets
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},
	-- Basically tabs
	'akinsho/bufferline.nvim',

})
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy: Manage plugins' })
