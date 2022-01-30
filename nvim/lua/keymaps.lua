local function set_keymap(...) vim.api.nvim_set_keymap(...) end
-- local function set_option(...) vim.api.nvim_set_option(...) end

-- set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings
local opts = { noremap=true, silent=true }
set_keymap('n', '<C-p>', ':Files<CR>', opts)
set_keymap('n', '<C-b>', ':Buffers<CR>', opts)
set_keymap('n', '<TAB>', ':bnext<CR>', opts)
set_keymap('n', '<S-TAB>', ':bprev<CR>', opts)
set_keymap('n', '<leader>q', ':bdelete<CR>', opts)

set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', opts)
set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', opts)
set_keymap('i', '<C-j>', '<esc>:m .+1<CR>==', opts)
set_keymap('i', '<C-k>', '<esc>:m .-2<CR>==', opts)
set_keymap('n', '<leader>j', ':m .+1<CR>==', opts)
set_keymap('n', '<leader>k', ':m .-2<CR>==', opts)
