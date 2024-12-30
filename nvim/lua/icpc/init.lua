
require("icpc.settings")
require("icpc.lazy")
require("icpc.remap")

vim.cmd("let base16colorspace=256")

require("oil").setup()
require("mason").setup()
require("mason-lspconfig").setup()

require('lspconfig').clangd.setup {
    init_options = {
        compilationDatabasePath = "/usr/local/include/",
    }
}
require("lspconfig").pyright.setup {}
require("lspconfig").rust_analyzer.setup {}
require("ibl").setup()
