local fn = vim.fn
local execute = vim.api.nvim_command
local cmd = vim.cmd

vim.g.mapleader = ' '
vim.o.termguicolors = true
cmd 'colorscheme base16-monokai'

require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself
    "kyazdani42/nvim-web-devicons";

    "neovim/nvim-lspconfig";          -- Mind the semi-colons

    "windwp/nvim-autopairs";
    "hrsh7th/nvim-compe";
    "karb94/neoscroll.nvim";
    "b3nj5m1n/kommentary";

    "nvim-treesitter/nvim-treesitter";

    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";
    "nvim-telescope/telescope.nvim";
    {"lervag/vimtex", opt=true};      -- Use braces when passing options

    "norcalli/nvim-colorizer.lua";
    "glepnir/galaxyline.nvim";
}

-- PLUGINS
require"nvim-autopairs.completion.compe".setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})
require"nvim-autopairs".setup()
require"neoscroll".setup()
require"colorizer".setup()

-- CONFIGS
require('settings')
require('config')
require('lsp')
require('keymaps')
require('eviline')

