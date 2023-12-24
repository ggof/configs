local nvim_lsp = require('lspconfig')
local trouble = require('trouble')
-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- on_attach is a function run every time an LSP server attaches to the current buffer.
-- It should setup special keybindings, etc.
local function on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Keybindings for LSP
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '<leader>sD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<leader>sd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<leader>sh', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>sf', function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.keymap.set('n', '<leader>si', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>ss', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>sa', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>sr', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>sR', function() trouble.toggle('lsp_references') end, opts)
  vim.keymap.set('n', '<leader>xx', function() trouble.toggle('workspace_diagnostics') end, opts)
  vim.keymap.set('n', '<leader>xq', function() trouble.toggle('quickfix') end, opts)
end


local function setup(server)
  server.setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    -- capabilities = capabilities,
  }
end

-- init ionide first
vim.cmd [[let g:fsharp#lsp_auto_setup = 0]]

-- setup lsps from the `servers` table
local servers = { 'pylsp', 'rust_analyzer', 'tsserver', 'gopls', 'svelte', 'dartls', 'kotlin_language_server', 'lua_ls',
  'clojure_lsp', 'ocamllsp', 'templ', 'fennel_ls' }

for _, lsp in ipairs(servers) do
  setup(nvim_lsp[lsp])
end

setup(require('ionide'))

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { focusable = false }
)
