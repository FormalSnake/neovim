vim.opt.termguicolors = true
require("bufferline").setup { options = {
	view = "multiwindow",
	numbers = "buffer_id",
	number_style = "superscript", -- buffer_id at index 1, ordinal at index 2
	mappings = true,
	buffer_close_icon = '',
	modified_icon = '●',
	close_icon = '',
	left_trunc_marker = '',
	right_trunc_marker = '',
	max_name_length = 18,
	max_prefix_length = 15, -- prefix used when a buffer is deduplicated
	tab_size = 18,
	diagnostics = "nvim_lsp",
	underline_thickness = 6,
	underline_position = -4,
	diagnostics_indicator = function(count, level, diagnostics_dict)
		return "(" .. count .. ")"
	end,
	hover = {
		enabled = true,
		delay = 100,
		reveal = { 'close' },
	},
	indicator = {
		style = 'underline',
	},
	offsets = {
		{
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			separator = true,
		}
	}
} }
