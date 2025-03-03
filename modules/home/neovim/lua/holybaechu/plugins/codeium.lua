
return {
    {
        "codeium.nvim",
        cmd = { "Codeium" },
        event = "InsertEnter",
        after = function(_)
            require("codeium").setup({
                bin_path = nixCats.extra("codeium_lsp")
            })
        end
    }
}
