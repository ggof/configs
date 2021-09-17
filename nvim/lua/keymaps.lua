local function set_keymap(...) vim.api.nvim_set_keymap(...) end
local function set_option(...) vim.api.nvim_set_option(...) end

set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings
local opts = { noremap=true, silent=true }
set_keymap('n', '<C-p>', ':Files<CR>', opts)
set_keymap('n', '<C-b>', ':Buffers<CR>', opts)
set_keymap('n', '<TAB>', ':bnext<CR>', opts)
set_keymap('n', '<S-TAB>', ':bprev<CR>', opts)
set_keymap('n', '<leader>bp', ':bprevious<CR>', opts)
set_keymap('n', '<leader>bn', ':bnext<CR>', opts)
set_keymap('n', '<leader>bq', ':bdelete<CR>', opts)
