local packer = require("packer")
local use = packer.use
vim.api.nvim_command('set rtp+=/usr/local/opt/fzf')

packer.startup(
    function()
        use { 'godlygeek/tabular' }
        use { 'kassio/neoterm' }
        use { 'nanotee/zoxide.vim' }
        use {
            'sindrets/diffview.nvim',
            config = function()
                local cb = require'diffview.config'.diffview_callback

                require'diffview'.setup {
                  diff_binaries = false,    -- Show diffs for binaries
                  file_panel = {
                    width = 35,
                    use_icons = true        -- Requires nvim-web-devicons
                  },
                  key_bindings = {
                    disable_defaults = false,                   -- Disable the default key bindings
                    -- The `view` bindings are active in the diff buffers, only when the current
                    -- tabpage is a Diffview.
                    view = {
                      ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file 
                      ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
                      ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
                      ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
                    },
                    file_panel = {
                      ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
                      ["<down>"]        = cb("next_entry"),
                      ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
                      ["<up>"]          = cb("prev_entry"),
                      ["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
                      ["o"]             = cb("select_entry"),
                      ["<2-LeftMouse>"] = cb("select_entry"),
                      ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
                      ["S"]             = cb("stage_all"),          -- Stage all entries.
                      ["U"]             = cb("unstage_all"),        -- Unstage all entries.
                      ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
                      ["<tab>"]         = cb("select_next_entry"),
                      ["<s-tab>"]       = cb("select_prev_entry"),
                      ["<leader>e"]     = cb("focus_files"),
                      ["<leader>b"]     = cb("toggle_files"),
                    }
                  }
                }
            end
        }
        use {'junegunn/fzf.vim'}
        use {
            'vim-scripts/gtags.vim',
            lock = true,
            config = function()
                vim.api.nvim_set_var('Gtags_Close_When_Single', 1)
                vim.api.nvim_set_var('Gtags_No_Auto_Jump', 1)
                vim.api.nvim_set_var('Gtags_Auto_Update', 1)
            end
        }
        use {"wbthomason/packer.nvim"}
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
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                  "bash",
                  "lua",
                  "json",
                  "cpp",
                  "python"
                },
                highlight = {
                    enable = true,
                    use_languagetree = true
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
          end
        }
        use {
            "nvim-treesitter/nvim-treesitter-textobjects",
            config = function()
            end,
            requires = {"nvim-treesitter/nvim-treesitter"}
        }
        -- use {
        --     'Shougo/echodoc.vim',
        --     config = function()
        --         vim.api.nvim_set_var('echodoc_enable_at_startup', 1)
        --         -- vim.api.nvim_set_var('echodoc#type', 'virtual')
        --     end
        -- }
        use {"nvim-lua/plenary.nvim"}
        use {"nvim-lua/popup.nvim"}
        use {"tweekmonster/startuptime.vim"}

        use {
            "lukas-reineke/indent-blankline.nvim",
            branch = 'lua',
            config = function()
                vim.api.nvim_set_var('indent_blankline_filetype_exclude', {"help", "terminal"})
                vim.api.nvim_set_var('indent_blankline_buftype_exclude', {"terminal"})
                vim.api.nvim_set_var('indent_blankline_show_trailing_blankline_indent', false)
                vim.api.nvim_set_var('indent_blankline_show_first_indent_level', false)
                vim.api.nvim_set_var('indent_blankline_strict_tabs', true)
                vim.api.nvim_set_var('indent_blankline_enabled', true)
                vim.api.nvim_set_var('indent_blankline_enabled', true)
                vim.api.nvim_command('set colorcolumn=99999')
            end
        }
        use {
            'skywind3000/asyncrun.vim',
            config = function()
                vim.api.nvim_set_var('asyncrun_open', 10)
                vim.api.nvim_set_var('asyncrun_auto', "make")
                vim.api.nvim_exec([[
                    command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
                ]], false)
            end
        }
        use {
            'derekwyatt/vim-fswitch',
            config = function()
                vim.api.nvim_set_keymap('n', '<space>h', ':FSHere<CR>:setlocal buflisted<CR>', { noremap = true, silent = true })
                vim.api.nvim_exec([[
                  augroup mycppfiles
                      autocmd!
                      autocmd BufEnter *.h let b:fswitchdst  = 'cpp,cc,c'
                      autocmd BufEnter *.cc let b:fswitchdst  = 'h'
                  augroup END
                ]], false)
            end
        }
        use {
            't9md/vim-choosewin',
            config = function()
                -- vim.api.nvim_set_var('choosewin_blink_on_land', 0)
                -- vim.api.nvim_set_var('choosewin_color_label', { ['gui'] = { '#98c379', '#282c34' } })
                -- vim.api.nvim_set_var('choosewin_color_label_label', { ['gui'] = { '#98c379', '#282c34' } })
                -- vim.api.nvim_set_var('choosewin_color_other', { ['gui'] = { '#3e4452', '#abb2bf' } })
                vim.api.nvim_set_keymap('n', '<space>w', ':ChooseWin<CR>', { noremap = true, silent = true })
            end
        }
        -- use {
        --     'wellle/context.vim',
        --     config = function()
        --         vim.api.nvim_set_var('context_nvim_no_redraw', 1)
        --     end
        -- }
        use {
            'brooth/far.vim',
            config = function()
                vim.api.nvim_set_var('far#source', 'rg')
            end
        }
        use {'vim-airline/vim-airline-themes'}
        use {
            'vim-airline/vim-airline',
            config = function()
                vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
                vim.api.nvim_set_var('airline#extensions#tabline#buffer_nr_show', 1)
                vim.api.nvim_set_var('airline#extensions#tabline#formatter', 'unique_tail')
                vim.api.nvim_set_var('airline#extensions#whitespace#enabled', 0)
                vim.api.nvim_set_var('airline#extensions#obsession#enabled', 1)
                vim.api.nvim_set_var('airline#extensions#obsession#indicator_text', '$')
                vim.api.nvim_set_var('airline_left_sep', '')
                vim.api.nvim_set_var('airline_left_alt_sep', ' ')
                vim.api.nvim_set_var('airline_right_sep', '')
                vim.api.nvim_set_var('airline_right_alt_sep', ' ')
                vim.api.nvim_set_var('airline#extensions#tabline#left_sep', '')
                vim.api.nvim_set_var('airline#extensions#tabline#left_alt_sep', '  ')
                vim.api.nvim_set_var('airline#extensions#tabline#ignore_bufadd_pat', 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler')
                vim.api.nvim_set_var('airline_stl_path_style', 'short')
            end,
            requires = {'vim-airline/vim-airline-themes'}
        }
        use {
            'ayu-theme/ayu-vim'
        }
        use {
            'sheerun/vim-polyglot',
            cond = function()
                return false
            end
        }
        use {
            'Shougo/deoplete.nvim',
            run = ':UpdateRemotePlugins',
            config = function()
                vim.api.nvim_set_var('deoplete#enable_at_startup', 1)
                -- vim.api.nvim_command('autocmd InsertEnter * call deoplete#enable()')
                vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { noremap = true, expr = true })
                vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { noremap = true, expr = true })
            end
        }
        use {'tbodt/deoplete-tabnine', run = './install.sh'}
        use {'tpope/vim-fugitive'}
        use {
            'TimUntersberger/neogit',
            config = function()
                local neogit = require('neogit')
                neogit.setup {
                    integrations = {
                        -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs you can use `sindrets/diffview.nvim`.
                        -- The diffview integration enables the diff popup, which is a wrapper around `sindrets/diffview.nvim`.
                        diffview = true
                    }
                }
                vim.api.nvim_set_keymap('n', '<space>g', ':Neogit<CR>', { noremap = true, silent = true })
            end,
            requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' }
        }
        use {'tpope/vim-unimpaired'}
        use {
            'RRethy/vim-illuminate',
            config = function()
                vim.api.nvim_set_var('Illuminate_ftwhitelist', { 'python', 'sh', 'cpp', 'c', 'bash', 'zsh', 'vim' })
                vim.api.nvim_command('hi illuminatedWord guibg=#3e4556')
            end
        }
        -- use {'jiangmiao/auto-pairs'}
        use {'vim-scripts/DrawIt'}
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
        use {'wellle/targets.vim'}
        use {
            '907th/vim-auto-save',
            config = function()
                vim.api.nvim_set_var('auto_save', 1)
                vim.api.nvim_set_var('auto_save_silent', 1)
            end
        }
        use {
            'mg979/vim-visual-multi',
            branch = 'master',
            config = function()
                vim.api.nvim_set_var('VM_theme', 'nord')
                vim.api.nvim_set_var('VM_maps', {
                    ["Select All"] = '<leader>a',
                    ["Visual All"] = '<leader>a',
                    ["Align"] = '<leader>A',
                    ["Add Cursor Up"] = '<S-Up>',
                    ["Add Cursor Down"] = '<S-Down>'
                })
                vim.api.nvim_set_var('VM_mouse_mappings', 1)
                vim.api.nvim_set_var('VM_silent_exit', 1)
            end
        }
        use {'tpope/vim-commentary'}
        use {
            'airblade/vim-gitgutter',
            config = function()
                vim.api.nvim_set_var('gitgutter_sign_added', "│")
                vim.api.nvim_set_var('gitgutter_sign_removed', "│")
                vim.api.nvim_set_var('gitgutter_sign_modified', "│")
                vim.api.nvim_set_var('gitgutter_sign_modified_removed', "│")
                vim.api.nvim_set_var('gitgutter_highlight_linenrs', 0)
                vim.api.nvim_command('hi link GitGutterAddLineNr          GitGutterAdd')
                vim.api.nvim_command('hi link GitGutterChangeLineNr       GitGutterChange')
                vim.api.nvim_command('hi link GitGutterDeleteLineNr       GitGutterDelete')
                vim.api.nvim_command('hi link GitGutterChangeDeleteLineNr GitGutterChangeDelete')
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
            cond = function()
                return false
            end,
            config = function()
                vim.api.nvim_set_var('onedark_hide_endofbuffer', 1)
                vim.api.nvim_set_var('onedark_terminal_italics', 1)
            end
        }
        use {
            'morhetz/gruvbox'
        }
        use {
            'rbgrouleff/bclose.vim',
            config = function()
                vim.api.nvim_set_var('bclose_no_plugin_maps', true)
                vim.api.nvim_set_keymap('n', '<space>x', ':Bclose!<CR>', { noremap = true, silent = true })
            end
        }
        use {
            'mhinz/vim-startify',
            config = function()
                vim.api.nvim_set_var('startify_change_to_dir', 0)
            end
        }
        use 'tpope/vim-surround'
        use {
            'Yggdroot/LeaderF',
            run = ':LeaderfInstallCExtension',
            config = function()
                vim.api.nvim_set_var('Lf_WindowHeight', 10)
                vim.api.nvim_set_var('Lf_StlSeparator', { ['left'] = "", ['right'] = "" })
                vim.api.nvim_set_var('Lf_StlColorscheme', 'one')
                vim.api.nvim_set_var('Lf_GtagsAutoGenerate', 1)
                vim.api.nvim_set_var('Lf_Gtagsconf', '/usr/local/share/gtags/gtags.conf')
                vim.api.nvim_set_var('Lf_Gtagslabel', 'native-pygments')

                vim.api.nvim_set_keymap('n', '<space>f', ':Leaderf file<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>m', ':Leaderf mru<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>o', ':Leaderf gtags --current-buffer<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>t', ':Leaderf gtags --all<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>l', ':Leaderf line<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>b', ':Leaderf buffer<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<leader>q', ':Leaderf quickfix<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<leader>l', ':Leaderf loclist<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', '<space>r', ':Leaderf rg<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', 'gd', ':Leaderf gtags --by-context --auto-jump<CR>', { noremap = true, silent = true })
                vim.api.nvim_set_keymap('n', 'gr', ':<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>', { noremap = true, silent = true })
            end
        }
        use {
            'luochen1990/rainbow',
            cond = function()
                return false
            end,
            config = function()
                vim.api.nvim_set_var('rainbow_active', 1)
                vim.api.nvim_set_var('rainbow_conf', {
                    ctermfgs = { "lightblue", "lightyellow", "lightcyan", "lightmagenta" },
                    guifgs = { "royalblue3", "darkorange3", "seagreen3", "firebrick" },
                    operators = "_,_",
                    parentheses = { "start=/(/ end=/)/ fold", "start=/\\[/ end=/\\]/ fold", "start=/{/ end=/}/ fold" },
                    separately = {
                        ["*"] = {
                            [true] = 6
                        },
                        css = 0,
                        html = {
                            parentheses = { "start=/\\v\\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\\z([-_:a-zA-Z0-9]+)(\\s+[-_:a-zA-Z0-9]+(\\=(\"[^\"]*\"|'[^']*'|[^ '\"><=`]*))?)*\\>/ end=#</\\z1># fold" }
                        },
                        lisp = {
                            guifgs = { "royalblue3", "darkorange3", "seagreen3", "firebrick", "darkorchid3" }
                        },
                        tex = {
                            parentheses = { "start=/(/ end=/)/", "start=/\\[/ end=/\\]/" }
                        },
                        vim = {
                            parentheses = { "start=/(/ end=/)/", "start=/\\[/ end=/\\]/", "start=/{/ end=/}/ fold", "start=/(/ end=/)/ containedin=vimFuncBody", "start=/\\[/ end=/\\]/ containedin=vimFuncBody", "start=/{/ end=/}/ fold containedin=vimFuncBody" }
                        }
                    }
                })
            end
        }
        use {'easymotion/vim-easymotion'}
        use {
            'kevinhwang91/nvim-bqf',
            config = function()
                require('bqf').setup({
                    auto_resize_height = false,
                })
            end
        }
        -- use {
        --     'mhinz/vim-grepper',
        --     config = function()
        --         vim.api.nvim_exec([[
        --             aug Grepper
        --                 au!
        --                 au User Grepper call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': histget('/')}}}) | botright copen
        --             aug END
        --         ]], false)
        --         vim.api.nvim_set_var('grepper', {
        --             ['open'] = 0,
        --             ['quickfix'] = 1,
        --             ['searchreg'] = 1,
        --             ['highlight'] = 0,
        --             ['tools'] = {'rg', 'git', 'grep'},
        --          })
        --         vim.api.nvim_set_keymap('n', 'gs', ':set opfunc=GrepperOperator<cr>g@', { noremap = true, silent = true })
        --         vim.api.nvim_set_keymap('x', 'gs', ':<c-u>call GrepperOperator(visualmode())<cr>', { noremap = true, silent = true })
        --     end
        -- }

    end,
    {
        display = {
            border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
        }
    }
)

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end


vim.api.nvim_command('set termguicolors')
vim.api.nvim_command('syntax on')
vim.api.nvim_command('set updatetime=100')
vim.api.nvim_command('set incsearch')
vim.api.nvim_command('set scrolloff=10')
vim.api.nvim_command('set noshowmode')
vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set autoindent')
vim.api.nvim_command('set smartcase')
vim.api.nvim_command('set signcolumn=yes')
vim.api.nvim_command('set inccommand=nosplit')
vim.api.nvim_command('set nohlsearch')
vim.api.nvim_command('set mouse=a')
vim.api.nvim_command('set linebreak')
vim.api.nvim_command('set ignorecase')
vim.api.nvim_command('set smartcase')
vim.api.nvim_command('set smartindent')
vim.api.nvim_command('set breakindent')
vim.api.nvim_command('set breakindentopt=sbr,shift:4')
vim.api.nvim_command('set clipboard=unnamedplus')
vim.api.nvim_command('set cscopeprg=gtags-cscope')
vim.api.nvim_command('set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-,a-')
vim.api.nvim_command('set guifont=FiraCode\\ Nerd\\ Font\\ Mono:h14')
vim.api.nvim_command('set showbreak=↪')
vim.api.nvim_command('set cursorline')
vim.api.nvim_command('set completeopt=menuone,noinsert,noselect')
vim.api.nvim_command('set relativenumber')
vim.api.nvim_command('set number')

-- vim.api.nvim_set_var('loaded_netrwPlugin', 1)
-- vim.api.nvim_set_var('clipboard', {
--     ['name'] = 'ssh-sync',
--     ['copy'] = {
--         ['+'] = { 'ssh', 'bjhl@host.docker.internal', 'pbcopy' },
--         ['*'] = { 'ssh', 'bjhl@host.docker.internal', 'pbcopy' },
--     },
--     ['paste'] = {
--         ['+'] = { 'ssh', 'bjhl@host.docker.internal', 'pbpaste' },
--         ['*'] = { 'ssh', 'bjhl@host.docker.internal', 'pbpaste' },
--     },
--     ['cache_enabled'] = 1,
-- })

vim.api.nvim_set_var('airline_theme', 'gruvbox')
vim.api.nvim_command('colorscheme gruvbox')
vim.api.nvim_command('hi EndOfBuffer guifg=bg')
vim.api.nvim_command('hi SignColumn guibg=bg')
-- vim.api.nvim_command('cabbrev ls !ls')
-- vim.api.nvim_command('cabbrev tree !tree')
-- vim.api.nvim_command('hi Visual guifg=#F07178')

-- vim.api.nvim_set_keymap('n', '<space>p', '<Plug>MarkdownPreviewToggle', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<space>u', ':UndotreeToggle<CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<leader>r', ':AsyncTask file-run<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>b', ':AsyncTask file-build<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>d', ':!sdcv <cword><CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', [[:<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'k'<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', [[:<C-U>execute 'normal!' (v:count > 1 ? "m'" . v:count : '') . 'j'<CR>]], { noremap = true, silent = true })

vim.api.nvim_exec([[
    autocmd BufEnter term://* setlocal nonumber
    autocmd InsertEnter * set nocursorline
    autocmd InsertLeave * set cursorline

    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
]], false)
