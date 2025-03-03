return {
    {
        "nvim-treesitter",
        event = "DeferredUIEnter",
        load = function(name)
            vim.cmd.packadd(name)
        end,
        after = function(_)
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end
    }
}
