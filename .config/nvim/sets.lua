-- enable 'hybrid' line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- no line wrapping
vim.opt.wrap = false

-- "Sync vim clipboard with system clipboard
vim.opt.clipboard = 'unnamedplus'

-- searches are case insensitive...
vim.opt.ignorecase = true
-- ... unless they contain at least one capital letter
vim.opt.smartcase = true

-- replace globally by default
vim.opt.gdefault = true

-- highlight when yanked
-- https://neovim.io/doc/user/lua.html#lua-highlight
 vim.cmd("autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=100}")

-- store undotree between sessions
vim.opt.undofile = true

-- disable automatic line wrapping
vim.opt.formatoptions:remove({"t"})

-- Directories for swp files: use local directory and don't store in working
-- directory. This makes working on sshfs faster
-- uses the whole path for tmp files to avoid collisions
vim.opt.undodir = vim.fn.stdpath('config') .. '/.undo'
vim.opt.backupdir = vim.fn.stdpath('config') .. '/.backup'
vim.opt.directory = vim.fn.stdpath('config') .. '/.swap'

-- show special characters
vim.opt.list = true
-- what special keys should look like
vim.opt.listchars = "tab:› ,trail:·,extends:>,precedes:<"

-- always use unix line endings
-- also makes sure you see ^M in files with windows line endings
vim.opt.ffs = "unix"

-- don't show separate signcolumn with lsp diagnostic warnings
vim.opt.signcolumn = "number"

-- disable omnicomplete definition preview
vim.opt.completeopt:append { "preview" }

-- disable omnicomplete automatic selection of first item
vim.opt.completeopt:append { "noselect" }

-- always keeps n lines below/above cursor in view
vim.opt.scrolloff = 0

-- show menu, even if there's only one option
vim.opt.completeopt:remove { "menu" }
vim.opt.completeopt:append { "menuone" }

-- Do not insert any text for a match until the user selects a match from the menu
vim.opt.completeopt:append { "noinsert" }

-- disable intro screen / splash screen
vim.opt.shortmess:append { I = true }

-- Hide the default mode text (e.g. -- INSERT -- below the statusline)
vim.opt.showmode = false

-- set leader key to space
vim.g.mapleader = ' '

-- use 24-bit colours
vim.opt.termguicolors = true

-- -- configure plugins
-- vim.cmd('runtime! plugin_config/*.lua')
-- vim.cmd('runtime! plugin_config/*.vim')

-- -- Add eol to files that don't have it
-- vim.cmd('au BufWritePre * if !&bin | set eol | endif')

-- vim.g.neovide_scroll_animation_length = 0
vim.g.neovide_cursor_animation_length = 0
