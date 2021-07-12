vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable=false

require'treesitter-context.config'.setup{ enable = true }
require("nvim-treesitter.configs").setup {
    ensure_installed = {
      "bash",
      "lua",
      "json",
      "cpp",
      "python"
    },
    matchup = {
        enable = true,              -- mandatory, false will disable the whole extension
        disable = {},               -- optional, list of language that will be disabled
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "<leader>r",
            },
        },
        navigation = { enable = false, },
    },
    textobjects = {
        select = {
            enable = true,
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
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
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",

                -- Or you can define your own textobjects like this
                ["iF"] = {
                  python = "(function_definition) @function",
                  cpp = "(function_definition) @function",
                  c = "(function_definition) @function",
                  java = "(method_declaration) @function",
                },
            },
        },
    },
}
