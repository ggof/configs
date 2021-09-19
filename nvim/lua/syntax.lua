local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.carp = {
  install_info = {
    url = "~/git/tree-sitter-carp", -- local path or git repo
    files = {"src/parser.c"}
  }
}

parser_config.gleam = {
  install_info = {
    url = "~/git/tree-sitter-gleam", -- local path or git repo
    files = {"src/parser.c"}
  }
}
