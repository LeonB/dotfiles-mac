require("codeium").setup({
    virtual_text = {
        enabled = true,
        map_keys = true,
        key_bindings = {
            -- Accept the current completion.
            accept = "<Tab>",
            -- Accept the next word.
            accept_word = false,
            -- Accept the next line.
            accept_line = false,
            -- Clear the virtual text.
            clear = false,
            -- Cycle to the next completion.
            -- Cycle to the next completion.
            next = "<C-]>",
            -- Cycle to the previous completion.
            prev = "<C-]>",
        }
    },
})
