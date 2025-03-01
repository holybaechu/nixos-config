return {
    {
        "cyberdream",
        load = function(plugin)
            require('cyberdream').setup({
                variant = "light"
            })

            vim.cmd.colorscheme("cyberdream")
        end,
    }
}
