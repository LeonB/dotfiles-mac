require('telescope').setup({
    defaults = {
        layout_strategy = "bottom_pane",
        layout_config = {
            bottom_pane = {}
            -- other layout configuration here
        },
        -- other defaults configuration here
    },

    pickers = {
        buffers = {
            -- ignore_current_buffer = true,
            sort_lastused = true,
        },
    },

    -- other configuration values here
    extensions = {
        recent_files = {
            -- This extension's options, see below.
            only_cwd = true,
        }
    }
})

require("telescope").load_extension("recent_files")

local ivy = require('telescope.themes').get_ivy()
-- ivy.initial_mode = "normal"

vim.api.nvim_create_user_command('MRU', function()
    require('telescope').extensions.recent_files.pick(ivy)
end, {})

vim.keymap.set({ "n" }, "<leader>be", function()
    require('telescope.builtin').buffers(
        vim.tbl_extend('force', ivy, { initial_mode = "normal" })
    )
end)

vim.keymap.set({ "n", "v", "i" }, "<C-p>", function()
    require('telescope.builtin').find_files(
        ivy
    -- vim.tbl_extend('force', ivy, { initial_mode = "insert" })
    )
end)
