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
	-- The best theme ever
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require('themes.catppuccin')
	-- 	end
	-- },

	"nvim-treesitter/nvim-treesitter-context",
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag"
		}

	},

	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
		end
	},

	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
		-- stylua: ignore
		keys = {
			{
				"<C-a>",
				function() return require("dial.map").inc_normal() end,
				expr = true,
				desc =
				"Increment"
			},
			{
				"<C-x>",
				function() return require("dial.map").dec_normal() end,
				expr = true,
				desc =
				"Decrement"
			},
		},
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},
	{ 'rmagatti/auto-session', },
	-- {
	-- 	'jedrzejboczar/possession.nvim',
	-- 	dependencies = { 'nvim-lua/plenary.nvim' },
	-- },
	-- {
	-- 	"gennaro-tedesco/nvim-possession",
	-- 	dependencies = {
	-- 		"ibhagwan/fzf-lua",
	-- 	},
	-- 	config = true,
	-- 	init = function()
	-- 		local possession = require("nvim-possession")
	-- 		vim.keymap.set("n", "<leader>sl", function()
	-- 			possession.list()
	-- 		end)
	-- 		vim.keymap.set("n", "<leader>sn", function()
	-- 			possession.new()
	-- 		end)
	-- 		vim.keymap.set("n", "<leader>su", function()
	-- 			possession.update()
	-- 		end)
	-- 		vim.keymap.set("n", "<leader>sd", function()
	-- 			possession.delete()
	-- 		end)
	-- 	end,
	-- },
	{ 'kosayoda/nvim-lightbulb' },
	{
		'mrcjkb/rustaceanvim',
		version = '^3', -- Recommended
		ft = { 'rust' },
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	"RRethy/vim-illuminate",
	{
		"FormalSnake/base46-colors",

		priority = 1000,
	},
	"b0o/incline.nvim",
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
	-- Shows you all of the functions, etc. in your file
	'simrat39/symbols-outline.nvim',
	-- Adds the notifications and stuff
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
		},
	},
	-- { 'echasnovski/mini.nvim',    version = '*', },
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = true,
			}
		end,
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
	-- {
	-- 	"startup-nvim/startup.nvim",
	-- 	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	-- },
	-- Color picker
	'uga-rosa/ccc.nvim',
	-- This generates gitignores
	'wintermute-cell/gitignore.nvim',
	-- This makes the errors in your code point to the characters using lines, but it does get messy sometimes
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	-- Inline colors, like red
	"nvChad/nvim-colorizer.lua",
	-- Same thing as before, but can display hsl(296, 25, 50%)
	'brenoprata10/nvim-highlight-colors',
	-- Formats on save
	"elentok/format-on-save.nvim",
	-- Adds indicators to see what function you're in
	{ "lukas-reineke/indent-blankline.nvim" },
	-- This allows for us to show images in neovim using any terminal emulator!!
	"MaximilianLloyd/ascii.nvim",
	-- UI library required for the fancy UI ones
	"MunifTanjim/nui.nvim",
	-- This adds colors to tailwind syntax highlighting
	"roobert/tailwindcss-colorizer-cmp.nvim",
	-- Highlights words under your cursor, and also the same words accross the file
	-- "yamatsum/nvim-cursorline",
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
	-- 'rmagatti/auto-session',
	-- prettier
	'MunifTanjim/prettier.nvim',
	-- Allows you to fuzzyfind files and buffers, etc.
	'nvim-telescope/telescope.nvim',
	-- Makes the theme work with the custom telescope layout
	-- "notken12/base46-colors",
	-- Built in terminal if you are too lazy to use tmux panes
	"NvChad/nvterm",
	-- Git features
	-- "lewis6991/gitsigns.nvim",
	-- LSP installer
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	-- Improves lsp idk
	"glepnir/lspsaga.nvim",
	-- Shows the fancy autocomplete window O.O
	"hrsh7th/nvim-cmp",
	-- your code gets colors O.O
	{ "nvim-treesitter/nvim-treesitter",    build = ":TSUpdate" },
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

	-- Lua snippets
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},
	-- Basically tabs
	-- 'akinsho/bufferline.nvim',

})

vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy: Manage plugins' })
-- vim.cmd.colorscheme "catppuccin"
