local nvim_lsp = require('lspconfig')
local configs = require('lspconfig.configs')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    vim.keymap.set('n', '<leader>sD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>sd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>sh', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>sf', function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set('n', '<leader>si', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>ss', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>sa', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>sr', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>sR', vim.lsp.buf.references, opts)
  end
})

local servers = { 'pylsp', 'tsserver', 'gopls', 'svelte', 'dartls', 'lua_ls', 'clojure_lsp',
  'ocamllsp', 'templ', 'fennel_ls', 'ionide', 'gleam' }

for _, server in ipairs(servers) do
  nvim_lsp[server].setup { capabilities = capabilities }
end

nvim_lsp["rust_analyzer"].setup({
  capabilities = capabilities,
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
})
