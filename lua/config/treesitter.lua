require("nvim-treesitter").setup({
	ensure_installed = { "c", "lua", "rust", "ruby", "vim", "typescript", "typescriptreact" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },
})
