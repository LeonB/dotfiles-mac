-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()
-- r

cmp.setup({
    completion = {
        autocomplete = false,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = 'nvim_lua' },
        { name = 'codeium' }
        -- Copilot Source
        -- { name = "copilot", group_index = 2 },
        --     -- Other Sources
        --     { name = "nvim_lsp", group_index = 2 },
        --     -- { name = "path", group_index = 2 },
        --     -- { name = "luasnip", group_index = 2 },
    },
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        -- ['<Tab>'] = cmp_action.luasnip_supertab(),
        -- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {
            { name = 'path' }
        },
        {
            { name = 'cmdline' }
        }
    )
})
