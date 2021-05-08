require("lsp-ale-diagnostic")
require'lspconfig'.clangd.setup{
    flags = {
        allow_incremental_sync = true
    },
    init_options = {
        clangdFileStatus = true
    },
    on_attach = function(client)
      -- [[ other on_attach code ]]
      require 'illuminate'.on_attach(client)
    end,
}
require'lspconfig'.pyls.setup{}
require'lspconfig'.hls.setup{}
