local map = vim.keymap.set

function nmap(shortcut, command, opts)
  map('n', shortcut, command, opts)
end

function imap(shortcut, command, opts)
  map('i', shortcut, command, opts)
end

nmap('<leader>bn', ':b#<CR>', { desc = "Jump to previous buffer" })

-- Copy relative filename to clipboard
nmap('<leader>cs', ':let @+=expand("%")<CR>', { desc = "Copy relative filename to clipboard" })
-- Copy absolute filename to clipboard
nmap('<leader>cl', ':let @+=expand("%:p")<CR>', { desc = "Copy absolute filename to clipboard" })

-- Map ctrl-s to save
nmap('<c-s>', ':w<cr>', { desc = "Save file" })
imap('<c-s>', '<esc>:w<cr>', { desc = "Save file" })

imap('<C-Space>', '<c-x><c-o>', { desc = "Map omnifunc to <C-o>" })
imap('<S-Del>', '<Del>', { desc = "Map Shift-Delete insert mode to do only delete" })

-- always center search result
nmap("n", "nzzzv", { desc = "always center search result" })
nmap("N", "Nzzzv", { desc = "always center search result" })

-- Close floats, and clear highlights with <Esc>
-- https://www.reddit.com/r/neovim/comments/1335pfc/is_there_any_generic_simple_way_to_close_floating/ji918lo/
nmap('<Esc>', function()
    -- clear_floats
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative == "win" then
            vim.api.nvim_win_close(win, false)
        end
    end
end, { desc = "Close floats, clear highlights" })

-- -- Reset text when closing completion popup menu with <Esc>
-- imap('<Esc>', function()
--     if (vim.fn.pumvisible() ~= 0) then
--         -- pum is visible
--         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-e>', true, false, true), 'n', true)
--         return
--     end
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
-- end, { desc = "Reset text when closing completion popup menu with <Esc>" })

-- -- fix issue with omnifunc completion + backspace
-- -- https://github.com/neovim/nvim-lspconfig/issues/2666
-- imap('<BS>', function()
--     if (vim.fn.pumvisible() ~= 0) then
--         -- pum is visible
--         -- trigger omnifunc again
--         vim.lsp.omnifunc()
--     end

--     -- send original key
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<BS>', true, false, true), 'n', true)
-- end, { desc = "fix issue with omnifunc completion + backspace" })

-- If something is selected in the completion popup
-- or ctrl-e is used: close the preview buffer
-- autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
-- autocmd InsertLeave * if pumvisible() ==0|pclose|endif
