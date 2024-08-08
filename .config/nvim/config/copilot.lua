require("copilot").setup({
    -- as suggested by the author, disable the suggestions to work
    -- with copilot-cmp
    suggestion = { enabled = false },
    -- as suggested by the author, disable the panel to work with copilot-cmp
    panel = { enabled = false },
    filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = true,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },
})
