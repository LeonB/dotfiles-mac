-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#imports
-- gimports (import go modules)
vim.keymap.set('n', '<leader>gi', function()
    -- send source.organizeImports to lsp server?
    vim.lsp.buf.code_action({
        context = {
            only = {
                'source.organizeImports'
            }
        },
        apply = true
    })
end)

local function go_organize_imports_sync(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end
end

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function()
        go_organize_imports_sync(1000)
    end
})
