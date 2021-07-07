require'telescope'.load_extension('zoxide')
require'telescope'.load_extension('project')
require"telescope".load_extension("frecency")
require('telescope').load_extension('fzf')
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local pickers = require('telescope.pickers')
local utils = require('telescope.utils')
local conf = require('telescope.config').values

_G.my_lsp_document_symbols = function(opts)
  local params = vim.lsp.util.make_position_params()
  local results_lsp, err = vim.lsp.buf_request_sync(0, "textDocument/documentSymbol", params, opts.timeout or 10000)
  if err then
    vim.api.nvim_err_writeln("Error when finding document symbols: " .. err)
    return
  end

  if not results_lsp or vim.tbl_isempty(results_lsp) then
    print("No results from textDocument/documentSymbol")
    return
  end

  local locations = {}
  for _, server_results in pairs(results_lsp) do
    vim.list_extend(locations, vim.lsp.util.symbols_to_items(server_results.result, 0) or {})
  end

  locations = utils.filter_symbols(locations, opts)
  if locations == nil then
    -- error message already printed in `utils.filter_symbols`
    return
  end

  if vim.tbl_isempty(locations) then
    return
  end

  opts.ignore_filename = opts.ignore_filename or true
  pickers.new(opts, {
    prompt_title = 'LSP Document Symbols',
    finder    = finders.new_table {
      results = locations,
      entry_maker = opts.entry_maker or make_entry.gen_from_lsp_symbols(opts)
    },
    previewer = conf.qflist_previewer(opts),
    sorter = conf.prefilter_sorter{
      tag = "symbol_type",
      sorter = conf.generic_sorter(opts)
    }
  }):find()
end

require('telescope').setup({
    extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
        }
    },
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = 'top',
            height = 0.5,
            width = 0.8
        },
        border = true,
    }
})

vim.api.nvim_set_keymap("n", "<space>z", ":Telescope zoxide list<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>f", ":Telescope find_files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>m", ":Telescope frecency<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>p", ":Telescope project<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>b", ":Telescope buffers<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>r", ":Telescope live_grep<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>a", ":Telescope lsp_code_actions<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>o", ":lua my_lsp_document_symbols({symbol_width=70, symbol_type_width=12, timeout=1000})<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>s", ":Telescope lsp_dynamic_workspace_symbols<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>g", ":Telescope lsp_document_diagnostics<CR>", {noremap = true, silent = true})


vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope file_browser<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>q", ":Telescope quickfix<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>l", ":Telescope loclist<CR>", {noremap = true, silent = true})
