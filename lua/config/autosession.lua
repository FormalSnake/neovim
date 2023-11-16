require("auto-session").setup({
	log_level = "error",
	auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	-- cwd_change_handling = {
	-- 	restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
	-- 	pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
	-- 	post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
	-- 		require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
	-- 	end,
	-- },
})
require('auto-session').setup {
	pre_save_cmds = { "NvimTreeClose" },
	save_extra_cmds = {
		"NvimTreeOpen"
	},
	post_restore_cmds = {
		"NvimTreeOpen"
	}
}
-- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
-- 	pattern = 'NvimTree*',
-- 	callback = function()
-- 		local view = require('nvim-tree.view')
-- 		local is_visible = view.is_visible()
--
-- 		local api = require('nvim-tree.api')
-- 		if not is_visible then
-- 			api.tree.open()
-- 		end
-- 	end,
-- })
-- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- require('possession').setup {
-- 	commands = {
-- 		save = 'SSave',
-- 		load = 'SLoad',
-- 		delete = 'SDelete',
-- 		list = 'SList',
-- 	},
-- 	autosave = {
-- 		current = true,
-- 		tmp = true,
-- 		on_load = true,
-- 		on_quit = true,
-- 	},
-- }
-- require("nvim-possession").setup()

-- vim.cmd(":SLoad")
