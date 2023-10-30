require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspsaga').setup({
	code_action_icon = "",
	code_action_prompt = {
		enable = false,
	},
	symbol_in_winbar = {
		in_custom = false,
		enable = false,
		separator = ' ',
		show_file = true,
		file_formatter = ""
	},
	ui = {
		code_action = ''
	}
})

vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
--vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
vim.keymap.set('n', '<leader>dr', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>df', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')

require("lspconfig").lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.stdpath "config" .. "/lua"] = true,
				},
			},
		},
	}
}

require("lspconfig").solargraph.setup {
	capabilities = capabilities,
}

require("lspconfig").csharp_ls.setup {
	capabilities = capabilities,
}


-- require("lspconfig").tsserver.setup {
-- 	capabilities = capabilities,
-- }

require 'lspconfig'.astro.setup {
	capabilities = capabilities,
}

require("lspconfig").pyright.setup {
	capabilities = capabilities,
}

require("lspconfig").tailwindcss.setup {
	capabilities = capabilities,
}

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = ""
	}
	vim.lsp.buf.execute_command(params)
end

-- require("lspconfig").tsserver.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	commands = {
-- 		OrganizeImports = {
-- 			organize_imports,
-- 			description = "Organize Imports"
-- 		}
-- 	}
-- }
