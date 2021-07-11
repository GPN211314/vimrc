local entry_display = require('telescope.pickers.entry_display')

local treesitter_type_highlight = {
  ["associated"] = "TSConstant",
  ["constant"]   = "TSConstant",
  ["field"]      = "TSField",
  ["function"]   = "TSFunction",
  ["method"]     = "TSMethod",
  ["parameter"]  = "TSParameter",
  ["property"]   = "TSProperty",
  ["struct"]     = "Struct",
  ["var"]        = "TSVariableBuiltin",
}

_G.gen_from_treesitter = function(opts)
  opts = opts or {}

  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()

  local display_items = {
    { width = 70 },
    { width = 12 },
    { remaining = true },
  }

  if opts.show_line then
    table.insert(display_items, 2, { width = 6 })
  end

  local displayer = entry_display.create {
    separator = " ",
    items = display_items,
  }

  local type_highlight = opts.symbol_highlights or treesitter_type_highlight

  local make_display = function(entry)
    local msg = vim.api.nvim_buf_get_lines(
      bufnr,
      entry.lnum,
      entry.lnum,
      false
      )[1] or ''
    msg = vim.trim(msg)

    local display_columns = {
      entry.text,
      {entry.kind, type_highlight[entry.kind], type_highlight[entry.kind]},
      msg
    }
    if opts.show_line then
      table.insert(display_columns, 2, {entry.lnum .. ":" .. entry.col, "TelescopeResultsLineNr"})
    end

    return displayer(display_columns)
  end

  return function(entry)
    local ts_utils = require('nvim-treesitter.ts_utils')
    local start_row, start_col, end_row, _ = ts_utils.get_node_range(entry.node)
    local node_text = ts_utils.get_node_text(entry.node)[1]
    return {
      valid = true,

      value = entry.node,
      kind = entry.kind,
      ordinal = node_text .. " " .. (entry.kind or "unknown"),
      display = make_display,

      node_text = node_text,

      filename = vim.api.nvim_buf_get_name(bufnr),
      -- need to add one since the previewer substacts one
      lnum = start_row + 1,
      col = start_col,
      text = node_text,
      start = start_row,
      finish = end_row
    }
  end
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

require('telescope').load_extension('fzf')
-- require'telescope'.load_extension('zoxide')
-- require'telescope'.load_extension('project')

vim.api.nvim_set_keymap("n", "<space>z", ":lua require'telescope'.extensions.zoxide.list{}<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>f", ":Telescope find_files previewer=false<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>m", ":Telescope oldfiles previewer=false<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>p", ":lua require'telescope'.extensions.project.project{}<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>b", ":Telescope buffers previewer=false<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>r", ":Telescope live_grep<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>a", ":Telescope lsp_code_actions<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>o", ":lua require'telescope.builtin'.treesitter({entry_maker = gen_from_treesitter(opts)})<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>s", ":Telescope lsp_dynamic_workspace_symbols<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<space>g", ":Telescope lsp_document_diagnostics<CR>", {noremap = true, silent = true})


vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope file_browser previewer=false<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>q", ":Telescope quickfix<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>l", ":Telescope loclist<CR>", {noremap = true, silent = true})
