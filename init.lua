require('plugins')
vim.cmd.colorscheme "onedark"
require('config.input')
require('config.nvim-tree')
-- require('config.null-ls')
require('config.prettier')
require('config.telescope')
require('config.nvterm')
require('config.mason')
require('config.which-key')
require("config.inclineconf")
require('config.lualine')
require('config.cmpconf')
-- require('config.completions')
require('config.lsp_config')
require('config.treesitter')
-- require('config.buffer')
require('config.image')
-- require('config.cursorline')
-- require('config.scroll')
require('config.comment-auto')
require('config.autosession')
require('config.formatsave')
require('config.indent')
require('config.tailwind')
require('config.cmdline')
-- require('config.cellular')
-- require('config.lsplines')
require('config.noiceconf')
require('config.todo')
require('config.outline')
require('config.colorizer')
require('config.fidgetlsp')
require('config.context')
require('config.illuminate')
require('config.notifyl')
require('config.typescript')
require('config.bulb')
require('config.custom.discipline')
-- require("config.dashboard")



vim.api.nvim_set_option("clipboard", "unnamed")
if vim.g.neovide then
	vim.o.guifont = "JetBrainsMonoNL Nerd Font:h14"
end
if vim.loader then
	vim.loader.enable()
end
vim.wo.number = true
vim.wo.relativenumber = true
