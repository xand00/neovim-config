local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.twig = {
  install_info = {
    url = "https://github.com/eirabben/tree-sitter-twig",
    files = {"src/parser.c"},
    branch = "main",
    generate_requires_npm = true,
    requires_generate_from_grammar = true,
  },
  filetype = "twig",
  used_by = {"html", "htm"}
}
