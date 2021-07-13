vim.env.FZF_DEFAULT_OPTS = '--layout=reverse-list --no-info'
vim.g.fzf_preview_window = {'right:50%:hidden', 'ctrl-/'}
vim.g.fzf_layout = { ['down'] = '25%' }
vim.g.fzf_colors =  {
    ['fg'] =      { 'fg', 'Normal' },
    ['bg'] =      { 'bg', 'Normal' },
    ['hl'] =      { 'fg', 'Comment' },
    ['fg+'] =     { 'fg', 'Search', 'CursorColumn', 'Normal' },
    ['bg+'] =     { 'bg', 'Search', 'CursorColumn' },
    ['hl+'] =     { 'fg', 'Statement' },
    ['info'] =    { 'fg', 'PreProc' },
    ['border'] =  { 'fg', 'Ignore' },
    ['prompt'] =  { 'fg', 'Conditional' },
    ['pointer'] = { 'fg', 'Exception' },
    ['marker'] =  { 'fg', 'Keyword' },
    ['spinner'] = { 'fg', 'Label' },
    ['header'] =  { 'fg', 'Comment' }
}

vim.cmd 'autocmd FileType fzf setlocal nornu nonu'
vim.api.nvim_set_keymap('n', '<space>f', ':FZF<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>z', ':Zi<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>m', ':History<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>b', ':Buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>r', ':Rg<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>g', ':Diagnostics<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>a', ':CodeActions<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', ':References<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd', ':Definitions<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>q', ':Quickfix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':Quickfix!<CR>', { noremap = true, silent = true })
require'fzf_lsp'.setup()

local function prepare_match(entry, kind)
  local entries = {}
  local utils = require('nvim-treesitter.ts_utils')

  if entry.node and kind == "function" then
      local text = utils.get_node_text(entry.node)[1]
      local lnum, col
      lnum, col, _, _ = utils.get_node_range(entry.node)
      local line = tostring(lnum + 1) .. " " .. tostring(col + 1) .. " " .. text
      table.insert(entries, line)
  end

  return entries
end

local function fzf_wrap(name, opts)
  name = name or ""
  opts = opts or {}

  local sink_fn = opts["sink*"] or opts["sink"]
  if sink_fn ~= nil then
    opts["sink"] = nil; opts["sink*"] = 0
  end
  local wrapped = vim.fn["fzf#wrap"](name, opts)
  wrapped["sink*"] = sink_fn

  return wrapped
end

local function locations_from_lines(lines)
  local extract_location = (function (l)
    local lnum, col, text
    lnum, col, text = l:match("([%d]+)%s([%d]+)%s(.*)")

    return {
      lnum = lnum,
      col = col,
    }
  end)

  local locations = {}
  for _, l in ipairs(lines) do
    table.insert(locations, extract_location(l))
  end

  return locations
end

local function common_sink(lines)
    local locations = locations_from_lines(lines)

    for _, loc in ipairs(locations) do
        vim.fn.cursor(loc["lnum"], loc["col"])
        vim.api.nvim_command("normal! zvzz")
    end
end

local function fzf_locations(source)
  local fzf_run = vim.fn["fzf#run"]

  fzf_run(fzf_wrap("functions", {
    source = source,
    sink = common_sink,
    options = { "--with-nth=3..", "--prompt=Func>" },
  }))
end

_G.Functions = function()
    local ts_locals = require('nvim-treesitter.locals')
    local bufnr = vim.api.nvim_get_current_buf()

    local results = {}
    for _, definitions in ipairs(ts_locals.get_definitions(bufnr)) do
        entries = {}
        for name, item in pairs(definitions) do
            vim.list_extend(entries, prepare_match(item, name))
        end
        for _, entry in ipairs(entries) do
            table.insert(results, entry)
        end
    end
    fzf_locations(results)
end

vim.api.nvim_set_keymap('n', '<space>o', ':lua Functions()<CR>', { noremap = true, silent = true })
