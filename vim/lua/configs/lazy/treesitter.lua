return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "rust",
                "python",
                "go",
                "lua",
                "javascript",
                "typescript",
                "tsx",
                "dockerfile",
                "markdown",
                "toml",
                "json",
                "yaml",
                "make",
                "vim",
                "vimdoc",
                "query",
            },

            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
