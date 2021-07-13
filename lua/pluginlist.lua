local packer = require("packer")
local use = packer.use
packer.startup(
    function()
        use { 'wbthomason/packer.nvim' }
        use { 'dstein64/vim-startuptime' }
        use { 'tpope/vim-commentary' }
        use { 'tpope/vim-surround' }
        use { 'tpope/vim-fugitive' }
        use { 'wellle/targets.vim' }
        use { 'antoinemadec/FixCursorHold.nvim' }
        use { 'lifepillar/vim-gruvbox8' }
        use { "kyazdani42/nvim-web-devicons" }
        use { 'nvim-lua/popup.nvim' }
        use { 'nvim-lua/plenary.nvim' }
        use { 'm-pilia/vim-ccls' }
        use { 'stevearc/stickybuf.nvim' }
        use {
            'godlygeek/tabular',
            enent = 'CmdlineEnter *'
        }
        use {
            'romgrk/barbar.nvim',
            config = function()
                vim.g.bufferline = { auto_hide = true }
                vim.api.nvim_set_keymap('n', '[b', ':BufferPrevious<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', ']b', ':BufferNext<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>x', ':BufferClose<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', 'gb', ':BufferPick<CR>', { noremap = true, silent = true })
            end
        }
        use {
            "folke/trouble.nvim",
            event = 'User LspDiagnosticsChanged',
            config = function()
                require("trouble").setup {}
            end
        }
        use {
            'glepnir/galaxyline.nvim',
            branch = 'main',
            config = function() require('statusline') end,
        }
        use {
            'neovim/nvim-lspconfig',
            config = function() require('lsp') end,
            -- requires = { 'simrat39/symbols-outline.nvim' }
            requires = { 'stevearc/aerial.nvim' }

        }
        use {
            'junegunn/fzf.vim',
            config = function() require('fzf') end,
            requires = {
                { 'junegunn/fzf', run = 'vim.fn["fzf#install"]()' },
                { 'nanotee/zoxide.vim' },
                { 'gfanto/fzf-lsp.nvim' }
            }
        }
        use {
            "nvim-treesitter/nvim-treesitter",
            config = function() require('treesitter') end,
            requires = {
                { 'nvim-treesitter/nvim-treesitter-refactor' },
                -- { 'nvim-treesitter/nvim-treesitter-textobjects' },
                { 'romgrk/nvim-treesitter-context' },
                -- { 'andymass/vim-matchup' },
            }
        }
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                vim.g.indent_blankline_filetype_exclude               = {"help"       , "terminal", "dashboard"}
                vim.g.indent_blankline_buftype_exclude                = {"terminal"}
                vim.g.indent_blankline_show_trailing_blankline_indent = false
                vim.g.indent_blankline_show_first_indent_level        = false
                vim.g.indent_blankline_strict_tabs                    = true
                vim.g.indent_blankline_enabled                        = true
                vim.opt.colorcolumn = '99999'
            end
        }
        use {
            'skywind3000/asynctasks.vim',
            config = function()
                vim.api.nvim_set_keymap('n', '<leader>b', ':AsyncTask file-build<CR>', { noremap = true, silent = true })
            end
        }
        use {
            'skywind3000/asyncrun.vim',
            config = function()
                vim.g.asyncrun_open = 15
                vim.g.asyncrun_auto = "make"
            end
        }
        use {
            'derekwyatt/vim-fswitch',
            config = function()
                vim.api.nvim_set_keymap('n', '<space>h', ':FSHere<CR>:setlocal buflisted<CR>', { noremap = true, silent = true })
                vim.cmd([[
                  augroup mycppfiles
                      autocmd!
                      autocmd BufEnter *.h let b:fswitchdst  = 'cpp,cc,c'
                      autocmd BufEnter *.cc let b:fswitchdst  = 'h'
                  augroup END
                ]])
            end
        }
        use {
            't9md/vim-choosewin',
            config = function()
                vim.api.nvim_set_keymap('n', '<space>w', ':ChooseWin<CR>', { noremap = true, silent = true })
            end
        }
        use {
            'brooth/far.vim',
            enent = 'CmdlineEnter *',
            config = function()
                vim.g['far#source'] = 'rg'
            end
        }
        use {
            'hrsh7th/nvim-compe',
            event = 'InsertEnter *',
            config = function()
                require('autocompletion')
            end
        }
        use {
            'windwp/nvim-autopairs',
            event = 'InsertCharPre *',
            config = function()
                require('nvim-autopairs').setup()
                require("nvim-autopairs.completion.compe").setup({
                  map_cr = true, --  map <CR> on insert mode
                  map_complete = true -- it will auto insert `(` after select function or method item
                })
            end
        }
        use {
            '907th/vim-auto-save',
            config = function()
                vim.g.auto_save = 1
                vim.g.auto_save_silent = 1
            end
        }
        use {
            'airblade/vim-gitgutter',
            config = function()
                vim.g.gitgutter_highlight_linenrs = 0
            end
        }
        use {
            'lambdalisue/suda.vim',
            config = function()
                vim.api.nvim_set_keymap('c', 'w!!', 'w suda://%', { noremap = true, silent = true })
            end
        }
        use {
            'easymotion/vim-easymotion',
            config = function()
                vim.g.EasyMotion_move_highlight = 0
                vim.g.EasyMotion_enter_jump_first = 1

                vim.api.nvim_set_keymap('n', '<C-n>', ':<C-u>call EasyMotion#NextPrevious(0,0)<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('x', '<C-n>', ':<C-u>call EasyMotion#NextPrevious(1,0)<CR>', { noremap = true, silent = true })

                vim.api.nvim_set_keymap('n', '<C-p>', ':<C-u>call EasyMotion#NextPrevious(0,1)<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('x', '<C-p>', ':<C-u>call EasyMotion#NextPrevious(1,1)<CR>', { noremap = true, silent = true })

                vim.api.nvim_set_keymap('n', '<space>e', ':<C-u>call EasyMotion#Repeat(0)<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('x', '<space>e', '<Esc>:<C-u>call EasyMotion#Repeat(1)<CR>', { noremap = true, silent = true })
            end
        }
        use {
            'kevinhwang91/nvim-bqf',
            config = function()
                require('bqf').setup({
                    auto_resize_height = false,
                })
            end
        }
        -- use { 'ayu-theme/ayu-vim' }
        -- use { 'tpope/vim-unimpaired'}
        -- use { 'tpope/vim-repeat' }
        -- use { 'Shougo/vinarise.vim' }
        -- use { 'jceb/vim-orgmode' }
        -- use { 'vim-scripts/DrawIt' }
        -- use { 'ludovicchabant/vim-gutentags' }
        -- use { 'folke/lsp-colors.nvim' }
        -- use {
        --     'projekt0n/github-nvim-theme',
        --     config = function()
        --         require('github-theme').setup()
        --     end
        -- }
        -- use {
        --     'kassio/neoterm',
        --     config = function()
        --         vim.g.neoterm_auto_repl_cmd = 0
        --         vim.g.neoterm_default_mod = 'botright'
        --         vim.g.neoterm_autojump = 1
        --         vim.g.neoterm_size = '15'
        --         vim.api.nvim_set_keymap('n', '<space>t', ':Ttoggle<CR>', { noremap = true, silent = true })
        --         vim.cmd [[au Filetype neoterm setlocal nobuflisted]]
        --     end
        -- }
        -- use {
        --     'vim-scripts/gtags.vim',
        --     lock = true,
        --     config = function()
        --         vim.g.Gtags_Close_When_Single = 1
        --         vim.g.Gtags_No_Auto_Jump = 1
        --         vim.g.Gtags_Auto_Update = 0
        --     end
        -- }
        -- use {
        --     'nvim-telescope/telescope.nvim',
        --     config = function() require('telescope-config') end,
        --     requires = {
        --         { 'jvgrootveld/telescope-zoxide' },
        --         { 'nvim-telescope/telescope-project.nvim' },
        --         { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        --     }
        -- }
        -- use {
        --     'vim-airline/vim-airline',
        --     config = function() require('airline') end,
        --     requires = {'vim-airline/vim-airline-themes'}
        -- }
        -- use {
        --     'joshdick/onedark.vim',
        --     config = function()
        --         -- vim.g.onedark_hide_endofbuffer = 1
        --         -- vim.g.onedark_terminal_italics = 1
        --     end
        -- }
        -- use {
        --     'rbgrouleff/bclose.vim',
        --     config = function()
        --         vim.g.bclose_no_plugin_maps = true
        --         vim.api.nvim_set_keymap('n', '<space>x', ':Bclose!<CR>', { noremap = true, silent = true })
        --     end
        -- }
        -- use {
        --     'glepnir/dashboard-nvim',
        --     config = function()
        --         vim.g.dashboard_default_executive ='telescope'
        --     end
        -- }
        -- use {
        --     'mhinz/vim-startify',
        --     event = 'VimEnter *',
        --     config = function()
        --         vim.g.startify_change_to_dir = 0
        --         vim.startify_enable_unsafe = 1
        --     end
        -- }
        -- use {
        --     'Shougo/deoplete.nvim',
        --     run = ':UpdateRemotePlugins',
        --     event = 'InsertEnter *',
        --     config = function()
        --         vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { noremap = true, expr = true })
        --         vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { noremap = true, expr = true })
        --         vim.cmd [[ autocmd Filetype TelescopePrompt,frecency call deoplete#custom#buffer_option('auto_complete', v:false) ]]
        --         vim.fn['deoplete#enable']()
        --     end,
        --     requires = { { 'tbodt/deoplete-tabnine', run = './install.sh' }, { 'deoplete-plugins/deoplete-lsp' } }
        -- }
        -- use {
        --     'mg979/vim-visual-multi',
        --     branch = 'master',
        --     config = function()
        --         vim.g.VM_theme = 'nord'
        --         vim.g.VM_maps = {
        --             ["Select All"] = '<leader>a',
        --             ["Visual All"] = '<leader>a',
        --             ["Find Under"] = '<C-_>',
        --             ["Find Subword Under"] = '<C-_>',
        --             ["Align"] = '<leader>A',
        --             ["Add Cursor Up"] = '<S-Up>',
        --             ["Add Cursor Down"] = '<S-Down>'
        --         }
        --         vim.g.VM_mouse_mappings = 1
        --         vim.g.VM_silent_exit = 1
        --     end
        -- }
        -- use {
        --     'lewis6991/gitsigns.nvim',
        --     config = function()
        --         vim.cmd [[
        --             hi! GitSignsAdd guifg=#b8bb26 guibg=#282828
        --             hi! GitSignsChange guifg=#8ec07c guibg=#282828
        --             hi! GitSignsDelete guifg=#fb4934 guibg=#282828
        --         ]]
        --         require('gitsigns').setup({
        --             signs = {
        --                 add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        --                 change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        --                 delete       = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        --                 topdelete    = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        --                 changedelete = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        --             },
        --         })
        --     end
        -- }
    end,
    {
        display = {
            open_fn = require('packer.util').float,
            border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
        }
    }
)
