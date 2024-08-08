-- load plugins
vim.cmd('runtime! packer.lua')

-- load neovim core config
vim.cmd('runtime sets.lua')

-- load custom keymaps
vim.cmd('runtime keymaps.lua')

-- vim.lsp.set_log_level 'debug'
