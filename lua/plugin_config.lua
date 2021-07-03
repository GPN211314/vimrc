local packer = require("packer")
local use = packer.use
packer.startup(
    function()
        use { 'Shougo/vinarise.vim' }
        use { 'wbthomason/packer.nvim' }
        use { 'jceb/vim-orgmode' }
        use { 'preservim/nerdtree' }
        use { 'majutsushi/tagbar' }
        use { 'godlygeek/tabular' }
        use { 'nvim-lua/plenary.nvim' }
        use { 'nvim-lua/popup.nvim' }
        use { 'tweekmonster/startuptime.vim' }
        use { 'ayu-theme/ayu-vim' }
        use { 'tpope/vim-fugitive'}
        use { 'tpope/vim-unimpaired'}
        use { 'tpope/vim-repeat' }
        use { 'tpope/vim-commentary' }
        use { 'tpope/vim-surround' }
        use { 'wellle/targets.vim' }
        use { 'vim-scripts/DrawIt' }
        use { 'morhetz/gruvbox' }
        use { 'ludovicchabant/vim-gutentags' }
        use { 'antoinemadec/FixCursorHold.nvim' }
        use {
            'kassio/neoterm',
            config = function()
                vim.g.neoterm_auto_repl_cmd = 0
            end
        }
        use {
            'nanotee/zoxide.vim',
            vim.api.nvim_set_keymap('n', '<space>z', ':Zi<CR>', { noremap = true, silent = true })
        }
        use {
            'junegunn/fzf.vim',
            config = function()
                vim.env.FZF_DEFAULT_OPTS = '--layout=reverse-list'
                vim.g.fzf_preview_window = {'right:40%:hidden', 'ctrl-/'}
                vim.g.fzf_layout = { ['down'] = '25%' }

                vim.api.nvim_set_keymap('n', '<space>f', ':FZF<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>m', ':History<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>t', ':Tags<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>o', ':BTags<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>l', ':BLines<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>b', ':Buffers<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>r', ':Rg<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<leader>q', ':Quickfix<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<leader>l', ':Quickfix!<CR>', { noremap = true, silent = true })
            end
        }
        use {
            'vim-scripts/gtags.vim',
            lock = true,
            config = function()
                vim.g.Gtags_Close_When_Single = 1
                vim.g.Gtags_No_Auto_Jump = 1
                vim.g.Gtags_Auto_Update = 0
            end
        }
        use {
            'romgrk/nvim-treesitter-context',
            config = function()
                require'treesitter-context.config'.setup{
                    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                }
            end
        }
        use {
            "nvim-treesitter/nvim-treesitter",
            config = function()
                require('treesitter')
            end
        }
        use { "nvim-treesitter/nvim-treesitter-textobjects" }
        use {
            "lukas-reineke/indent-blankline.nvim",
            branch = 'lua',
            config = function()
                vim.g.indent_blankline_filetype_exclude               = {"help"       , "terminal"}
                vim.g.indent_blankline_buftype_exclude                = {"terminal"}
                vim.g.indent_blankline_show_trailing_blankline_indent = false
                vim.g.indent_blankline_show_first_indent_level        = false
                vim.g.indent_blankline_strict_tabs                    = true
                vim.g.indent_blankline_enabled                        = true
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
                vim.g.asyncrun_open = 10
                vim.g.asyncrun_auto = "make"
                vim.cmd 'command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>'
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
            config = function()
                vim.g['far#source'] = 'rg'
            end
        }
        use {
            'vim-airline/vim-airline',
            config = function()
                require('airline')
            end,
            requires = {'vim-airline/vim-airline-themes'}
        }
        use {
            'Shougo/deoplete.nvim',
            run = ':UpdateRemotePlugins',
            event = 'InsertEnter *',
            config = function()
                vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { noremap = true, expr = true })
                vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { noremap = true, expr = true })
                vim.fn['deoplete#enable']()
            end
        }
        use {
            'tbodt/deoplete-tabnine',
            run = './install.sh'
        }
        use {
            'RRethy/vim-illuminate',
            config = function()
                vim.g.Illuminate_ftwhitelist = { 'python', 'sh', 'cpp', 'c', 'bash', 'zsh', 'vim' }
                vim.cmd 'hi illuminatedWord guibg=#3e4556'
            end
        }
        use {
            'windwp/nvim-autopairs',
            config = function()
                require('nvim-autopairs').setup()
                local remap = vim.api.nvim_set_keymap
                local npairs = require('nvim-autopairs')

                -- skip it, if you use another global object
                _G.MUtils= {}

                MUtils.completion_confirm=function()
                  if vim.fn.pumvisible() ~= 0  then
                      return npairs.esc("<cr>")
                  else
                    return npairs.autopairs_cr()
                  end
                end
                remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
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
            'mg979/vim-visual-multi',
            branch = 'master',
            config = function()
                vim.g.VM_theme = 'nord'
                vim.g.VM_maps = {
                    ["Select All"] = '<leader>a',
                    ["Visual All"] = '<leader>a',
                    ["Find Under"] = '<C-_>',
                    ["Find Subword Under"] = '<C-_>',
                    ["Align"] = '<leader>A',
                    ["Add Cursor Up"] = '<S-Up>',
                    ["Add Cursor Down"] = '<S-Down>'
                }
                vim.g.VM_mouse_mappings = 1
                vim.g.VM_silent_exit = 1
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
            'joshdick/onedark.vim',
            config = function()
                -- vim.g.onedark_hide_endofbuffer = 1
                -- vim.g.onedark_terminal_italics = 1
            end
        }
        use {
            'rbgrouleff/bclose.vim',
            config = function()
                vim.g.bclose_no_plugin_maps = true
                vim.api.nvim_set_keymap('n', '<space>x', ':Bclose!<CR>', { noremap = true, silent = true })
            end
        }
        use {
            'mhinz/vim-startify',
            config = function()
                vim.g.startify_change_to_dir = 0
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
        use {
            'mhinz/vim-grepper',
            config = function()
                vim.cmd([[
                    aug Grepper
                        au!
                        au User Grepper call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': histget('/')}}}) | botright copen
                    aug END
                ]])
                vim.g.grepper = {
                    ['open'] = 0,
                    ['quickfix'] = 1,
                    ['searchreg'] = 1,
                    ['highlight'] = 0,
                    ['tools'] = {'rg', 'git', 'grep'},
                 }
                vim.api.nvim_set_keymap('n', 'gs', ':set opfunc=GrepperOperator<cr>g@', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('x', 'gs', ':<c-u>call GrepperOperator(visualmode())<cr>', { noremap = true, silent = true })
            end
        }

    end,
    {
        display = {
            border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
        }
    }
)
