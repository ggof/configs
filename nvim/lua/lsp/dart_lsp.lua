require'lspconfig'.dartls.setup {
  cmd = {'dart', '/opt/dart-sdk/bin/snapshots/analysis_server.dart.snapshot', '--lsp'};
}
