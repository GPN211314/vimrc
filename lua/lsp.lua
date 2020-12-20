require("lsp-ale-diagnostic")
require'lspconfig'.clangd.setup{
    flags = {
        allow_incremental_sync = true
    }
}
require'lspconfig'.pyls.setup{}
require'lspconfig'.hls.setup{}

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = {
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}
