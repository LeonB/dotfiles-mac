-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})

-- default keymaps: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#default_keymapsopts

-- LSP Actions
--     K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
--     gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
--     gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
--     gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
--     go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
--     gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
--     gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
--     <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
--     <F3>: Format code in current buffer. See :help vim.lsp.buf.format().
--     <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
--     gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
--     [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
--     ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().

local lsp = require('lsp-zero').preset({
    manage_nvim_cmp = {
        -- set_extra_mappings = true
    }
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr }) -- add lsp-zero defaults

    local opts = { buffer = bufnr }
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
    end, opts)

    vim.keymap.set('n', '<space>gr', function()
        vim.lsp.buf.rename()
    end, opts)
end)

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- -- setup default servers
-- for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
-- 	require('lspconfig')[server].setup({
-- 		capabilities = capabilities,
-- 	})
-- end

require('lspconfig').ccls.setup({
    init_options = {
        -- compilationDatabaseDirectory = "build",
        index = {
            threads = 0,
        },
        clang = {
            excludeArgs = { "-frounding-math" },
        },
    }
})

require('lspconfig').pylsp.setup({
    capabilities = capabilities,
    settings = {
        pylsp = {
            -- configurationSources = { "pycodestyle" },
            plugins = {
                -- pycodestyle = { enabled = false },
                -- autopep8 = { enabled = false },
                -- yapf = { enabled = false },
                -- flake8 = { enabled = true },
                -- black = { enabled = false },
                rope_autoimport = { enabled = true },
                isort = { enabled = false, profile = "black" },
            },
        },
    },
})

require('lspconfig').rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        completion = {
            callable = {
                snippets = "add_parentheses"
            }
        }
    }
})

-- enable lua
require('lspconfig').lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            completion = {
                callSnippet = 'Replace'
            },
            workspace = {
                checkThirdParty = false,
            },
        },
    },
})

require('lspconfig').tsserver.setup({
    capabilities = capabilities,
    settings = {
        completions = {
            -- enable function signature snippet completion
            completeFunctionCalls = true
        }
    }
})

require('lspconfig').gopls.setup {
    capabilities = capabilities,
    settings = {
        gopls = {
            -- experimentalPostfixCompletions = true,
            usePlaceholders = true,
        },
    },
}

require('lspconfig').jqls.setup({
    capabilities = capabilities,
    cmd = { '/Users/leon/Workspaces/go/src/github.com/LeonB/jq-lsp/jq-lsp' },
    -- autostart = false,
    root_dir = require('lspconfig').util.find_git_ancestor(),
    settings = {
        jqls = {
            search_paths = {
            },
        },
    },
})

require('lspconfig').ruby_lsp.setup {
    capabilities = capabilities,
    init_options = {
        formatter = "auto"
    },
}

lsp.setup()

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
