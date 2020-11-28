"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
    "hi LineNr ctermbg=NONE guibg=NONE
endif

call plug#begin('~/.config/nvim/site')
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Jorengarenar/vim-MvVis'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/completion-treesitter'
"Plug 'kristijanhusak/defx-git'
Plug 'jiangmiao/auto-pairs'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'equalsraf/neovim-gui-shim'
Plug 'mhartington/oceanic-next'
Plug 'Shougo/echodoc.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'wellle/targets.vim'
"Plug 'kassio/neoterm'
Plug '907th/vim-auto-save'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'romgrk/barbar.nvim'
Plug 'romgrk/doom-one.vim'
Plug 'tjdevries/colorbuddy.vim'
Plug 'Th3Whit3Wolf/onebuddy', {'branch': 'main'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine', { 'rtp': 'after' }
Plug 'yuttie/comfortable-motion.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"Plug 'arcticicestudio/nord-vim'
"Plug 'vim-scripts/confirm-quit'
Plug 'fholgado/minibufexpl.vim'
Plug 'airblade/vim-gitgutter'
"Plug 'epheien/termdbg'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/suda.vim'
Plug 'voldikss/vim-floaterm'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
"Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'rbgrouleff/bclose.vim'
"Plug 'francoiscabrol/ranger.vim'
"Plug 'skywind3000/vim-terminal-help'
"Plug 'tamlok/detorte'
Plug 'mhinz/vim-startify'
"Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-abolish'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug '/nix/store/r3khvq4jp84rrzh8ika4xwgwnkvw0sfj-fzf-0.20.0/share/vim-plugins/fzf'
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'luochen1990/rainbow'
"Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
"Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
"Plug 'kjwon15/vim-transparent'
"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'voldikss/LeaderF-floaterm'
call plug#end()

autocmd BufEnter * lua require'completion'.on_attach()
lua <<EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)
require'lspconfig'.ccls.setup{}
require'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
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
EOF


let g:auto_save = 1
"let g:neoterm_default_mod='botright'
let g:neoterm_autojump=1
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = "virtual"

let g:miniBufExplorerAutoStart = 0
hi Comment cterm=italic
let g:nvcode_hide_endofbuffer=1
let g:nvcode_terminal_italics=1
let g:nvcode_termcolors=256
"let g:indentLine_char = '|'
let g:indentLine_enabled = 1
let g:floaterm_height=0.9
let g:floaterm_width=0.9
let g:floaterm_winblend=0
"let g:ranger_replace_netrw=1 "open ranger when vim open a directory
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
"let g:onedark_termcolors=256
let g:airline#extensions#tabline#enabled=1
let g:miniBufExplVSplit=30
let g:miniBufExplBRSplit = 1

let g:airline#extensions#whitespace#enabled = 1
let g:airline_left_sep=''
let g:airline_left_alt_sep=' '
let g:airline_right_sep=''
let g:airline_right_alt_sep=' '
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep='  '
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
let g:airline#extensions#nvimlsp#enabled = 1
let airline#extensions#nvimlsp#error_symbol = 'E:'
let airline#extensions#nvimlsp#warning_symbol = 'W:'

let g:rainbow_active = 1
let g:rainbow_conf = {
    \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \	'operators': '_,_',
    \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \	'separately': {
    \		'*': {},
    \		'tex': {
    \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \		},
    \		'lisp': {
    \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \		},
    \		'vim': {
    \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \		},
    \		'html': {
    \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \		},
    \		'css': 0,
    \	}
    \}

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'i:instance:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type',
        \ 'i' : 'instance'
    \ },
    \ 'scope2kind' : {
        \ 'module'   : 'm',
        \ 'class'    : 'c',
        \ 'data'     : 'd',
        \ 'type'     : 't',
        \ 'instance' : 'i'
    \ }
\ }

"let g:comfortable_motion_scroll_down_key = "j"
"let g:comfortable_motion_scroll_up_key = "k"
let g:tagbar_ctags_bin = 'ctags'   "tagbar以来ctags插件
let g:tagbar_left = 0              "让tagbar在页面左侧显示，默认右边
let g:tagbar_width = 30            "设置tagbar的宽度为30列，默认40
let g:tagbar_autofocus = 1         "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
let g:tagbar_sort = 0
let g:clipboard = {
      \   'name': 'ssh-sync',
      \   'copy': {
      \      '+': ['ssh', 'bjhl@192.168.56.1', 'pbcopy'],
      \      '*': ['ssh', 'bjhl@192.168.56.1', 'pbcopy'],
      \    },
      \   'paste': {
      \      '+': ['ssh', 'bjhl@192.168.56.1', 'pbpaste'],
      \      '*': ['ssh', 'bjhl@192.168.56.1', 'pbpaste'],
      \    },
      \   'cache_enabled': 1,
      \ }


let g:airline_theme='onedark'
"let g:airline_theme='oceanicnext'
"colorscheme nvcode

let g:_background=0

function! s:toggle_background()
  if(g:_background==0)
    let g:_background=1
    let g:detorte_theme_mode='light'
    let g:airline_theme='solarized'
    colorscheme detorte
    hi NonText guifg=orange
    hi EndOfBuffer guifg=bg
  else
    let g:_background=0
    let g:airline_theme='onedark'
    colorscheme onedark
    hi NonText guifg=gray
    hi EndOfBuffer guifg=bg
  endif
endfunction

syntax on



set guifont=FiraCode\ Nerd\ Font\ Mono:h14
set relativenumber
set noshowmode
"set nohlsearch
"hi CursorColumn guibg=SlateBlue
set number
set tabstop=4
"set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set signcolumn=yes
set inccommand=nosplit
set mouse=a
set clipboard=unnamedplus
"set nowrap
set wrap
set linebreak
set breakindent
set breakindentopt=sbr,shift:4
set showbreak=↪


set timeout timeoutlen=1000 ttimeoutlen=100
set matchtime=2
"set updatecount=400
set updatetime=300
set helplang=cn
set ignorecase smartcase
set smartindent
set sm
set autoread
set autowrite
set expandtab
set showcmd
set cmdheight=1
set showmatch
set nobackup
set nowritebackup
set hidden
set encoding=utf-8
set shortmess+=c
set cursorline
"hi Search guibg=#4b5263 guifg=NONE
"hi Search guibg=DarkCyan guifg=white

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * hi NonText guifg=gray
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Defx | endif
autocmd VimEnter * silent! autocmd! FileExplorer
autocmd VimEnter * if (argc() == 1 && isdirectory(argv(0)) && !exists("s:std_in")) | Startify | endif
autocmd Filetype json :IndentLinesDisable

cmap w!! w suda://%
"map <C-p> :Clap command_history<CR>
map <leader>b :Clap buffers<CR>
map <space>b :MBEToggle<CR>:MBEFocus<CR>
map <space>g :Clap grep<CR>
map <space>f :Leaderf self<CR>
map <space>x :Bclose<CR>
"map z <Plug>(easymotion-prefix)
"nnoremap gj :call EasyMotion#JK(0,0)<CR>
"nnoremap gk :call EasyMotion#JK(0,1)<CR>
"nnoremap <space>b :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>
map <leader>t :call <SID>toggle_background()<CR>
tnoremap <silent> <leader>x <C-\><C-n>:call <SID>close_floaterm()<CR>
nnoremap <silent> <leader>x :call <SID>close_floaterm()<CR>
function! s:close_floaterm()
    if(len(floaterm#buflist#gather())==1)
        FloatermKill
    else
        FloatermKill
        FloatermToggle
    endif
endfunction
let g:floaterm_keymap_new = '<C-x>'
"let g:floaterm_keymap_kill = '<leader>x'
let g:floaterm_keymap_toggle = '<C-p>'
let g:floaterm_keymap_next = '<C-l>'
let g:floaterm_keymap_first = '<C-j>'
let g:floaterm_keymap_last = '<C-k>'
let g:floaterm_keymap_prev = '<C-h>'
map <space>d :Defx<CR>
map <space>v :CocCommand explorer<CR>
map <space>r :FloatermNew ranger<CR>
"tnoremap <ESC> <c-\><c-n>

"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
"" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

"" Highlight the symbol and its references when holding the cursor.
"if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    "autocmd CursorHold * silent call CocActionAsync('highlight')
"endif

"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>fm  <Plug>(coc-format-selected)
"nmap <leader>fm  <Plug>(coc-format-selected)

"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
""set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



"Defx Keymapping
"=============================================================================
" defx.vim --- defx configuration
" Copyright (c) 2016-2019 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

let s:direction = 'leftabove'

function! s:setcolum() abort
    return 'mark:indent:indent:icons:filename:type'
endfunction

function! s:defx_my_settings() abort
  " ... configure defx as per :help defx-examples ...
endfunction

function! s:open_defx_if_directory()
  " This throws an error if the buffer name contains unusual characters like
  " [[buffergator]]. Desired behavior in those scenarios is to consider the
  " buffer not to be a directory.
  try
    let l:full_path = expand(expand('%:p'))
  catch
    return
  endtry

  " If the path is a directory, delete the (useless) buffer and open defx for
  " that directory instead.
  if isdirectory(l:full_path)
    execute "Defx `expand('%:p')` | bd " . expand('%:r')
  endif
endfunction

augroup defx_config
  autocmd!
  autocmd FileType defx call s:defx_my_settings()

  " It seems like BufReadPost should work for this, but for some reason, I can't
  " get it to fire. BufEnter seems to be more reliable.
  autocmd BufEnter * call s:open_defx_if_directory()
augroup END

call defx#custom#option('_', {
      \ 'columns': s:setcolum(),
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': s:direction,
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

call defx#custom#column('mark', {
      \ 'readonly_icon': '',
      \ 'selected_icon': '',
      \ })

call defx#custom#column('icon', {
      \ 'directory_icon': '▶',
      \ 'opened_icon': '▼',
      \ 'root_icon': ' ',
      \ })

    call defx#custom#column('filename', {
          \ 'max_width': -90,
          \ })

augroup vfinit
  au!
  autocmd FileType defx call s:defx_init()
  " auto close last defx windows
  autocmd BufEnter * nested if
        \ (!has('vim_starting') && winnr('$') == 1
        \ && &filetype ==# 'defx') |
        \ call s:close_last_vimfiler_windows() | endif
augroup END

" in this function, we should check if shell terminal still exists,
" then close the terminal job before close vimfiler
function! s:close_last_vimfiler_windows() abort
  q
endfunction

function! s:defx_init()
  setl nonumber
  setl norelativenumber
  setl listchars=
  setl nofoldenable
  setl foldmethod=manual

  " disable this mappings
  nnoremap <silent><buffer> <3-LeftMouse> <Nop>
  nnoremap <silent><buffer> <4-LeftMouse> <Nop>
  nnoremap <silent><buffer> <LeftMouse> <LeftMouse><Home>

  silent! nunmap <buffer> <Space>
  silent! nunmap <buffer> <C-l>
  silent! nunmap <buffer> <C-j>
  silent! nunmap <buffer> E
  silent! nunmap <buffer> gr
  silent! nunmap <buffer> gf
  silent! nunmap <buffer> -
  silent! nunmap <buffer> s

  " nnoremap <silent><buffer><expr> st  vimfiler#do_action('tabswitch')
  " nnoremap <silent><buffer> yY  :<C-u>call <SID>copy_to_system_clipboard()<CR>
  nnoremap <silent><buffer><expr> '
        \ defx#do_action('toggle_select') . 'j'
  " TODO: we need an action to clear all selections
  nnoremap <silent><buffer><expr> V
        \ defx#do_action('toggle_select_all')
  " nmap <buffer> v       <Plug>(vimfiler_quick_look)
  " nmap <buffer> p       <Plug>(vimfiler_preview_file)
  " nmap <buffer> i       <Plug>(vimfiler_switch_to_history_directory)

  " Define mappings
  nnoremap <silent><buffer><expr> gx
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> h defx#do_action('call', 'DefxSmartH')
  nnoremap <silent><buffer><expr> <Left> defx#do_action('call', 'DefxSmartH')
  nnoremap <silent><buffer><expr> l defx#do_action('call', 'DefxSmartL')
  nnoremap <silent><buffer><expr> <Right> defx#do_action('call', 'DefxSmartL')
  nnoremap <silent><buffer><expr> o defx#do_action('call', 'DefxSmartL')
  nnoremap <silent><buffer> <BS> :call defx#call_action('cd', ['..'])<CR>
  nnoremap <silent><buffer><expr> <CR>
       \ defx#is_directory() ?
       \ defx#do_action('open_directory') : defx#do_action('call', 'DefxSmartL')
  nnoremap <silent><buffer><expr> <2-LeftMouse>
        \ defx#is_directory() ?
        \     (
        \     defx#is_opened_tree() ?
        \     defx#do_action('close_tree') :
        \     defx#do_action('open_tree')
        \     )
        \ : defx#do_action('call', 'DefxSmartL')
  nnoremap <silent><buffer><expr> sg
        \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> sv
        \ defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> st
        \ defx#do_action('drop', 'tabedit')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy defx#do_action('call', 'DefxYarkPath')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-r>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer> <Home> :call cursor(2, 1)<cr>
  nnoremap <silent><buffer> <End>  :call cursor(line('$'), 1)<cr>
  "nnoremap <silent><buffer><expr> <C-Home>
        "\ defx#do_action('cd', '.&cd /')
    nnoremap <silent><buffer><expr> > defx#do_action('resize',
    \ defx#get_context().winwidth + 10)
    nnoremap <silent><buffer><expr> < defx#do_action('resize',
    \ defx#get_context().winwidth - 10)
endf

" in this function we should vim-choosewin if possible
function! DefxSmartL(_)
  if defx#is_directory()
    call defx#call_action('open_tree')
    normal! j
  else
    let filepath = defx#get_candidate()['action__path']
    if tabpagewinnr(tabpagenr(), '$') >= 3    " if there are more than 2 normal windows
      if exists(':ChooseWin') == 2
        ChooseWin
      else
        let input = input('ChooseWin No./Cancel(n): ')
        if input ==# 'n' | return | endif
        if input == winnr() | return | endif
        exec input . 'wincmd w'
      endif
      exec 'e' filepath
    else
      exec 'wincmd w'
      exec 'e' filepath
    endif
  endif
endfunction

function! DefxSmartH(_)
  " if cursor line is first line, or in empty dir
  if line('.') ==# 1 || line('$') ==# 1
    return defx#call_action('cd', ['..'])
  endif

  " candidate is opend tree?
  if defx#is_opened_tree()
    return defx#call_action('close_tree')
  endif

  " parent is root?
  let s:candidate = defx#get_candidate()
  let s:parent = fnamemodify(s:candidate['action__path'], s:candidate['is_directory'] ? ':p:h:h' : ':p:h')
  let sep = '/'
  if s:trim_right(s:parent, sep) == s:trim_right(b:defx.paths[0], sep)
    return defx#call_action('cd', ['..'])
  endif

  " move to parent.
  call defx#call_action('search', s:parent)

  " if you want close_tree immediately, enable below line.
  call defx#call_action('close_tree')
endfunction

function! DefxYarkPath(_) abort
  let candidate = defx#get_candidate()
  let @+ = candidate['action__path']
  echo 'yanked: ' . @+
endfunction

function! s:trim_right(str, trim)
  return substitute(a:str, printf('%s$', a:trim), '', 'g')
endfunction

""FZF

"" 让输入上方，搜索列表在下方
"let $FZF_DEFAULT_OPTS = '--layout=reverse'

"" 打开 fzf 的方式选择 floating window
""let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
"" Terminal buffer options for fzf
"autocmd! FileType fzf
"autocmd  FileType fzf set noshowmode noruler nonu

"if has('nvim') && exists('&winblend') && &termguicolors
  "set winblend=20

  ""hi NormalFloat guibg=None
  ""if exists('g:fzf_colors.bg')
    ""call remove(g:fzf_colors, 'bg')
  ""endif

  ""if stridx($FZF_DEFAULT_OPTS, '--border') == -1
    ""let $FZF_DEFAULT_OPTS .= ' --border'
  ""endif

  "function! FloatingFZF()
    "let width = float2nr(&columns * 0.7)
    "let height = float2nr(&lines * 0.4)
    "let opts = { 'relative': 'editor',
               "\ 'row': 5,
               "\ 'col': (&columns - width) / 2,
               "\ 'width': width,
               "\ 'height': height }

    "let win=nvim_create_buf(v:false, v:true)
    "call nvim_open_win(win, v:true, opts)

    "call setwinvar(win,'&winhl','Normal:Pmenu')

    "setlocal
        "\ buftype=nofile
        "\ nobuflisted
        "\ bufhidden=hide
        "\ nonumber
        "\ norelativenumber
        "\ signcolumn=no

  "endfunction

  "let g:fzf_layout = { 'window': 'call FloatingFZF()' }
"endif

"nmap <F5> <Plug>VimspectorContinue
"let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector
let g:fzf_layout = { 'down': '25%' }
let g:clap_insert_mode_only=v:true
"hi FloatermBorder guifg=orange
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
hi NonText guifg=cyan
"hi EndOfBuffer guifg=bg

set autochdir
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>
nmap <space>t :Ttoggle<CR>

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gs    <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> [g    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> g9    <cmd>lua vim.lsp.buf.rename()<CR>
aug QFClose
  au!
  au WinLeave * if  &buftype == "quickfix"|ccl|LeaderfQuickFix|endif
aug END

let gitgutter_sign_added            = "\u00a0│"
let gitgutter_sign_removed          = "\u00a0│"
let gitgutter_sign_modified         = "\u00a0│"
let gitgutter_sign_modified_removed = "\u00a0│"

let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2"}
let g:Lf_WindowHeight = 0.3
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_PreviewResult = {'Function': 1, 'BufTag': 1 , 'QuickFix':1, 'LocList':1}
let g:Lf_PreviewCode = 1

noremap <space>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <space>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <space>s :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <space>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <space>ff :<C-U><C-R>=printf("Leaderf floaterm %s", "")<CR><CR>
noremap <space>o :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
noremap <space>a :<C-U><C-R>=printf("Leaderf quickfix %s", "")<CR><CR>
noremap <space>e <cmd>lua vim.lsp.diagnostic.set_loclist({open_loclist=false,severity_limit="Warning"})<CR>:<C-U><C-R>=printf("Leaderf loclist %s", "")<CR><CR>
noremap <space>rg :LeaderfRgInteractive<CR>

autocmd ColorScheme * hi! LspDiagnosticsDefaultWarning guifg=orange
        \    |hi! LspDiagnosticsDefaultError guifg=red
        \    |hi! LspDiagnosticsDefaultInformation guifg=darkcyan
        \    |hi! LspDiagnosticsDefaultHint guifg=green
        \
        \    |hi! LspDiagnosticsUnderlineWarning cterm=underline gui=underline
        \    |hi! LspDiagnosticsUnderlineError cterm=underline gui=underline
        \    |hi! LspDiagnosticsUnderlineInformation cterm=underline gui=underline
        \    |hi! LspDiagnosticsUnderlineHint cterm=underline gui=underline
        \
        \    |hi! LspDiagnosticsFloatingWarning guifg=orange
        \    |hi! LspDiagnosticsFloatingError guifg=red
        \    |hi! LspDiagnosticsFloatingInformation guifg=darkcyan
        \    |hi! LspDiagnosticsFloatingHint guifg=green

sign define LspDiagnosticsSignError text=E texthl=LspDiagnosticsSignError linehl= numhl=LspDiagnosticsSignError
sign define LspDiagnosticsSignWarning text=W texthl=LspDiagnosticsSignWarning linehl= numhl=LspDiagnosticsSignWarning
sign define LspDiagnosticsSignInformation text=I texthl=LspDiagnosticsSignInformation linehl= numhl=LspDiagnosticsSignInformation
sign define LspDiagnosticsSignHint text=H texthl=LspDiagnosticsSignHint linehl= numhl=LspDiagnosticsSignHint
autocmd CursorHold * lua  vim.lsp.diagnostic.show_line_diagnostics()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
let g:completion_trigger_keyword_length = 3 " default = 1
let g:completion_trigger_on_delete = 1
augroup CompletionTriggerCharacter
    autocmd!
    autocmd BufEnter * let g:completion_trigger_character = ['.']
    autocmd BufEnter *.c,*.cpp,*.cc,*.h,*hpp let g:completion_trigger_character = ['.', '::']
augroup end
let g:completion_matching_ignore_case = 0
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_auto_signature = 0
let g:completion_enable_auto_paren = 1
set pw=15
set ph=10
set pb=15
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = {
			\'default' : {
			\	'default' : [
			\		{'complete_items' : ['lsp', 'snippet', 'path']},
			\		{'mode' : 'file'}
			\	],
			\	'comment' : [],
			\	'string' : []
			\	},
			\'vim' : [
			\	{'complete_items': ['snippet']},
			\	{'mode' : 'cmd'}
			\	],
			\'python' : [
			\	{'complete_items': ['ts', 'path']}
			\	],
			\}

let g:VM_theme = 'nord'
let g:VM_maps = {}
let g:VM_maps["Select All"]        = '<leader>a'
let g:VM_maps["Visual All"]        = '<leader>a'
let g:VM_maps["Align"]             = '<leader>A'
let g:VM_maps["Add Cursor Down"]   = '<S-Down>'
let g:VM_maps["Add Cursor Up"]     = '<S-Up>'
let g:VM_mouse_mappings = 1

let g:AutoPairsShortcutToggle = ''
let g:UltiSnipsExpandTrigger="<C-Tab>"
colorscheme onedark
