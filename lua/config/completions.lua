local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
local field_arrangement = {
	atom = { "kind", "abbr", "menu" },
	atom_colored = { "kind", "abbr", "menu" },
}

local formatting_style = {
	-- default fields order i.e completion word + item.kind + item.kind icons
	fields = { "abbr", "kind", "menu" },
	format = require('tailwindcss-colorizer-cmp').formatter,

}

local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end
cmp.setup({
	completion = {
		completeopt = "menu,menuone",
	},
	window = {
		completion = {
			side_padding = 2,
			winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
			scrollbar = false,
		},
		documentation = {
			winhighlight = "Normal:CmpDoc",
		},
	},
	formatting = formatting_style,
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-o>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	}),
})
