require('plugins')
require('config.input')
require('themes.catppuccin')
require('config.nvim-tree')
require('config.null-ls')
require('config.prettier')
require('config.telescope')
require('config.nvterm')
require('config.mason')
require('config.which-key')
require('config.lualine')
require('config.completions')
require('config.lsp_config')
require('config.treesitter')
require('config.buffer')
require('config.image')
require('config.cursorline')
require('config.scroll')
require('config.comment-auto')
require('config.autosession')
require('config.formatsave')
require('config.indent')
vim.api.nvim_set_option("clipboard", "unnamed")

vim.api.nvim_create_autocmd('ColorScheme', {
	callback = function()
		local highlights = {
			'Normal',
			'LineNr',
			'Folded',
			'NonText',
			'SpecialKey',
			'VertSplit',
			'SignColumn',
			'EndOfBuffer',
			'TablineFill', -- this is specific to how I like my tabline to look like
		}
		for _, name in pairs(highlights) do vim.cmd.highlight(name .. ' guibg=none ctermbg=none') end
	end,
})
