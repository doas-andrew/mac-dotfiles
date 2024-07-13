return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-context" },
            { "nvim-treesitter/nvim-treesitter-textobjects" },
        },
        config = {
            -- A list of parser names, or "all"
            ensure_installed = {
                "help", "comment",
                "lua", "luadoc", "luap",
                "python", "ruby", "javascript",
                "go", "zig",
            },
            highlight = {
                enable = true,

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                --  disable = { "lua" },

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                --  additional_vim_regex_highlighting = false,
            },
        },
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "html",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
            "vue",
            "tsx",
            "jsx",
            "rescript",
            "xml",
            "php",
            "markdown",
            "astro",
            "glimmer",
            "handlebars",
            "hbs",
        },
    },
}
