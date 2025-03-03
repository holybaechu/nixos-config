return {
    {
        "cord.nvim",
        event = "DeferredUIEnter",
        after = function(_)
            require("cord").setup()
        end
    }
}
