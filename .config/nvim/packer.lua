local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
        '/site/pack/packer/start/packer.nvim'
        vim.notify(install_path, vim.log.levels.INFO)
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Automatically re-compile packer whenever you save packer.lua
local Packer = vim.api.nvim_create_augroup("packer_config", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        dofile(vim.fn.expand "%:p")
        require('packer').compile()
    end,
    group = Packer,
    pattern = "packer.lua",
})

vim.api.nvim_create_autocmd("User", {
    pattern = "PackerCompileDone",
    callback = function()
        vim.notify("Compile Done", vim.log.levels.INFO)
    end,
    group = Packer,
})

-- local packer_compiled_ok, _ = pcall(require, "plugin/packer_compiled")
-- if not packer_compiled_ok then
--   vim.api.nvim_err_writeln(
--     "Please Run :PackerCompile\n\n"
--     .. "There's a message that will show up on the cmdline, once it's done compiling\n"
--     .. "Then restart neovim once it's done"
--   )
-- end

-- :PackerSnapshot packer.lock
require('packer').init({
    snapshot_path = vim.fn.stdpath("config")
})

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- SESSION MANAGEMENT

    -- Intelligently reopen files at your last edit position in Vim
    use({ 'farmergreg/vim-lastplace' })

    -- Make Vim handle line and column numbers in file names with a minimum of fuss
    use({ 'kopischke/vim-fetch' })

    -- Delete buffers and close files in Vim without closing your windows or
    -- messing up your layout
    use({
        'moll/vim-bbye',
        config = function()
            vim.keymap.set("n", "<leader>bd", ':Bdelete<CR>')
        end
    })

    -- use {
    --     "ViViDboarder/wombat.nvim",
    --     requires = "rktjmp/lush.nvim",
    --     config = function()
    --         -- rename theme
    --         vim.g.colors_name = "zzzzzzz"
    --
    --         local lush = require('lush')
    --         local wombat = require('lush_theme.wombat_lush')
    --         local c = require("lush_theme.wombat_lush_colors").colors
    --
    --         -- we can apply modifications ontop of the existing colorscheme
    --         local spec = lush.extends({ wombat }).with(function()
    --             return {
    --                 -- Use the existing Comment group in wombat, but adjust the gui attribute
    --                 Identifier { fg = c.White },
    --             }
    --         end)
    --
    --         lush(spec)
    --     end
    -- }

    -- Retro groove color scheme for Vim
    use({
        'morhetz/gruvbox',
        config = function()
            vim.cmd('colorscheme gruvbox')
        end
    })

    -- use({
    --     'itchyny/lightline.vim',
    -- })

    use({
        'vim-airline/vim-airline',
    })

    -- A fancy, configurable, notification manager for NeoVim
    use({
        'rcarriga/nvim-notify',
        config = function()
            -- set as default notification function
            vim.notify = require("notify")
        end
    })

    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            vim.cmd('runtime! config/nvim-treesitter.lua')
        end
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    use({ 'nvim-treesitter/playground' })

    use({
        'LeonB/vim-textobj-url',
        requires = 'kana/vim-textobj-user',
    })

    use({
        'folke/neodev.nvim'
    })

    -- use({'github/copilot.vim'})

    -- use({
    --     'zbirenbaum/copilot.lua',
    --     config = function()
    --         vim.cmd('runtime! config/copilot.lua')
    --     end
    -- })
    --
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' }, -- autocomplete neovim api
            { 'Exafunction/codeium.nvim' },
            -- {
            --     "zbirenbaum/copilot-cmp",
            --     after = { "copilot.lua" },
            --     config = function()
            --         require("copilot_cmp").setup()
            --     end
            -- },                      -- load copilot_cmp
            { 'L3MON4D3/LuaSnip' }, -- Required
        },
        config = function()
            vim.cmd('runtime! config/cmp.lua')
        end
    }

    use {
        "Exafunction/codeium.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            vim.cmd('runtime! config/codeium.lua')
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        after = { "neodev.nvim" },
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        },
        config = function()
            vim.cmd('runtime! config/lsp.lua')
        end
    }

    -- use {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({
    --             suggestion = { enabled = false },
    --             panel = { enabled = false },
    --         })
    --     end,
    -- }

    -- use {
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function ()
    --         require("copilot_cmp").setup()
    --     end
    -- }

    -- TEXT OBJECTS

    -- quoting/parenthesizing made simple
    use({
        'tpope/vim-surround',
        requires = "tpope/vim-repeat",
    })

    -- commentary.vim: comment stuff out
    -- use({ 'tpope/vim-commentary' })

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- NAVIGATION

    -- use {
    --     'stevearc/oil.nvim',
    --     config = function()
    --         -- require('oil').setup()
    --         vim.cmd('runtime! config/oil.lua')
    --     end
    -- }

    -- use {
    --     'nvim-tree/nvim-tree.lua',
    --     requires = {
    --         'nvim-tree/nvim-web-devicons', -- optional
    --     },
    --     config = function()
    --         -- require('oil').setup()
    --         vim.cmd('runtime! config/nvim-tree.lua')
    --     end
    -- }

    -- Unite and create user interfaces
    -- use({
    --     'Shougo/unite.vim'
    -- })

    -- use({
    --     'nvim-tree/nvim-web-devicons'
    -- })

    -- -- Powerful file explorer implemented by Vim script
    -- use({
    --     'Shougo/vimfiler',
    --     after = 'unite.vim',
    --     requires = 'unite.vim/unite.vim',
    --     config = function()
    --         vim.cmd('runtime! config/vimfiler.vim')
    --     end
    -- })

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        -- commit = "77d9f484b88fd380386b46ed9206e5374d69d9d8",
        -- tag = "3.14",
        config = function()
            vim.cmd('runtime! config/neo-tree.lua')
        end
    }

    -- use {
    --     "Shougo/ddu-ui-filer",
    --     requires = {
    --         "vim-denops/denops.vim",
    --         "Shougo/ddu-source-file_rec",
    --         "Shougo/ddu-column-filename",
    --         "Shougo/ddu-source-file",
    --         "Shougo/ddu-source-file_rec",
    --         "Shougo/ddu.vim",
    --         "ryota2357/ddu-column-icon_filename"
    --     },
    --     config = function()
    --         vim.cmd('runtime! config/ddu.vim')
    --     end
    -- }

    -- -- MRU plugin includes unite.vim MRU sources
    -- use({
    --     'Shougo/neomru.vim',
    --     after = 'unite.vim',
    --     requires = 'unit.vim/unite.vim',
    --     config = function()
    --         vim.cmd('runtime! config/unite.vim')
    --     end
    -- })

    use({
        'mbbill/undotree',
        config = function()
            vim.cmd('runtime! config/undotree.lua')
        end
    })

    -- use({
    --     'codethread/qmk.nvim',
    --     config = function()
    --         vim.cmd('runtime! config/qmk.lua')
    --     end
    -- })

    use({
        'godlygeek/tabular',
    })

    use {
        -- 'nvim-telescope/telescope.nvim', tag = '0.1.8',
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'smartpde/telescope-recent-files' },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            },
        },
        config = function()
            vim.cmd('runtime! config/telescope.lua')
        end
    }

    -- use {
    --     "nvim-telescope/telescope-file-browser.nvim",
    --     requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    -- }

    use({
        'bitc/vim-bad-whitespace',
    })

    use({
        'johmsalas/text-case.nvim',
        config = function()
            vim.cmd('runtime! config/textcase.vim')
        end
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
