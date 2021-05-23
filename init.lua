local packer = require("packer")
local use = packer.use

packer.startup(
    function()
        use "wbthomason/packer.nvim"
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
              }
            }
          end
        }
        use "nvim-lua/plenary.nvim"
        use "nvim-lua/popup.nvim"
        use "tweekmonster/startuptime.vim"

        use {
          "lukas-reineke/indent-blankline.nvim",
          branch = "lua",
          config = function()
            vim.api.nvim_set_var('indent_blankline_filetype_exclude', {"help", "terminal"})
            vim.api.nvim_set_var('indent_blankline_buftype_exclude', {"terminal"})
            vim.api.nvim_set_var('indent_blankline_show_trailing_blankline_indent', false)
            vim.api.nvim_set_var('indent_blankline_show_first_indent_level', false)
            vim.api.nvim_set_var('indent_blankline_strict_tabs', true)
            vim.api.nvim_set_var('indent_blankline_enabled', true)
          end
        }
        use {
          'skywind3000/asyncrun.vim',
          config = function()
            vim.api.nvim_set_var('asyncrun_open', 10)
            vim.api.nvim_set_var('asyncrun_auto', "make")
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
            vim.api.nvim_set_var('choosewin_blink_on_land', 0)
            vim.api.nvim_set_var('choosewin_blink_on_land', 0)
            vim.api.nvim_set_var('choosewin_blink_on_land', 0)
            vim.api.nvim_set_var('choosewin_color_label', { ['gui'] = { '#98c379', '#282c34' } })
            vim.api.nvim_set_var('choosewin_color_label_label', { ['gui'] = { '#98c379', '#282c34' } })
            vim.api.nvim_set_var('choosewin_color_other', { ['gui'] = { '#3e4452', '#abb2bf' } })
            vim.api.nvim_set_keymap('n', '<space>w', ':ChooseWin<CR>', { noremap = true, silent = true })
          end
        }
        use {
          'wellle/context.vim',
          config = function()
            vim.api.nvim_set_var('context_nvim_no_redraw', 1)
          end
        }
        use {
          'brooth/far.vim',
          config = function()
            vim.api.nvim_set_var('far#source', 'rg')
          end
        }
        use 'vim-airline/vim-airline-themes'
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
                vim.api.nvim_set_var('airline_theme', 'onedark')
            end,
            requires = {'vim-airline/vim-airline-themes'}
        }
        -- use 'sheerun/vim-polyglot'
        use {
          'Shougo/deoplete.nvim',
          run = ':UpdateRemotePlugins',
          config = function()
            vim.api.nvim_set_var('deoplete#enable_at_startup', 0)
            vim.api.nvim_command('autocmd InsertEnter * call deoplete#enable()')
            vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { noremap = true, expr = true })
            vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { noremap = true, expr = true })
          end
        }
        use {'tbodt/deoplete-tabnine', run = './install.sh'}
        use 'tpope/vim-fugitive'
        use 'tpope/vim-unimpaired'
        use {
          'RRethy/vim-illuminate',
          config = function()
            vim.api.nvim_set_var('Illuminate_ftwhitelist', { 'python', 'sh', 'cpp', 'c', 'bash', 'zsh', 'vim' })
            vim.api.nvim_command('hi illuminatedWord guibg=#3e4556')
          end
        }
        -- use 'jiangmiao/auto-pairs'
        use {
          "windwp/nvim-autopairs",
          config = function()
            require("nvim-autopairs").setup()
          end
        }
        use 'wellle/targets.vim'
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
        use 'tpope/vim-commentary'
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
          config = function()
            vim.api.nvim_set_var('onedark_hide_endofbuffer', 1)
            vim.api.nvim_set_var('onedark_terminal_italics', 1)
          end
        }
        use {
          'rbgrouleff/bclose.vim',
          config = function()
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
                }
            )
          end
        }
        use 'easymotion/vim-easymotion'

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


vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('syntax', 'on')
vim.api.nvim_set_option('incsearch', true)
vim.api.nvim_set_option('scrolloff', 10)
vim.api.nvim_set_option('showmode', false)
vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)
vim.api.nvim_set_option('expandtab', true)
vim.api.nvim_set_option('autoindent', true)
vim.api.nvim_set_option('signcolumn', 'yes')
vim.api.nvim_set_option('inccommand', 'nosplit')
vim.api.nvim_set_option('hlsearch', false)
vim.api.nvim_set_option('mouse', 'a')
vim.api.nvim_set_option('linebreak', true)
vim.api.nvim_set_option('breakindent', true)
vim.api.nvim_set_option('breakindentopt', 'sbr,shift:4')
vim.api.nvim_set_option('clipboard', 'unnamedplus')
vim.api.nvim_set_option('cscopeprg', 'gtags-cscope')
vim.api.nvim_set_option('cscopequickfix', 's-,c-,d-,i-,t-,e-,g-,f-,a-')
vim.api.nvim_set_option('guifont', 'FiraCode Nerd Font Mono:h14')
vim.api.nvim_set_option('showbreak', '↪')
vim.api.nvim_set_option('cursorline', true)
vim.api.nvim_set_option('completeopt', 'menuone,noinsert,noselect')
vim.api.nvim_set_option('relativenumber', true)
vim.api.nvim_set_option('number', true)

vim.api.nvim_set_var('loaded_netrwPlugin', 1)

vim.api.nvim_command('colorscheme onedark')

vim.api.nvim_command('cabbrev ls !ls')
vim.api.nvim_command('cabbrev tree !tree')

vim.api.nvim_command('hi NonText guifg=cyan')
vim.api.nvim_command('hi EndOfBuffer guifg=bg')
vim.api.nvim_command('hi Visual guibg=#C678DD guifg=bg')

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
]], false)
