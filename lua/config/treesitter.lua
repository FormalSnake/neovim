require("nvim-treesitter").setup({
	ensure_installed = { "c", "lua", "rust", "ruby", "vim", "typescript", "typescriptreact" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		use_languagetree = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
	},

	indent = { enable = true },
})
