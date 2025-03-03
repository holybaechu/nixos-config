require("lze").register_handlers(require('lzextras').lsp)
require("lze").load({
    { import = "holybaechu.plugins.colors" },
    { import = "holybaechu.plugins.lsp" },
    { import = "holybaechu.plugins.completion" },
    { import = "holybaechu.plugins.treesitter" },
    { import = "holybaechu.plugins.discord" },
    { import = "holybaechu.plugins.codeium" },
})
