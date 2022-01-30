local nvim_lsp = require('lspconfig')
local cmp = require('cmp_nvim_lsp')

-- on_attach is a function run every time an LSP server attaches to the current buffer.
-- It should setup special keybindings, etc.
local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Keybindings for LSP
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', '<leader>sD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>sd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>sh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>sf', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<leader>si', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>ss', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>sa', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>sr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>sR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>sp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>sn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    vim.api.nvim_command [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
end

local capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- setup lsps from the `servers` table
local servers = {'pylsp', 'rust_analyzer', 'tsserver', 'gopls', 'ionide', 'svelte'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {debounce_text_changes = 150}
  }
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
    cmd = {"lua-language-server"},
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
}

nvim_lsp.elixirls.setup {
  cmd = {os.getenv("HOME") .. "/.local/bin/elixir-ls/language_server.sh"},
  on_attach = on_attach,
  capabilities = capabilities
}
