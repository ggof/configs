require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'echasnovski/mini.nvim'

    use 'kyazdani42/nvim-web-devicons'
    use 'neovim/nvim-lspconfig'

    use 'karb94/neoscroll.nvim'

    use 'nvim-treesitter/nvim-treesitter'

    use 'lfe-support/vim-lfe'

    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'ionide/Ionide-vim'


end)

vim.cmd([[let g:fsharp#lsp_auto_setup = 0]])

vim.g.mapleader = ' '
vim.o.termguicolors = true

require'neoscroll'.setup()

require'mini.comment'.setup({})
require'mini.tabline'.setup({})
require'mini.surround'.setup({})
require'mini.statusline'.setup({})
require'mini.pairs'.setup({})
require'mini.completion'.setup({})

-- CONFIGS
require'settings'
require'treesitter'
require'lsp'
require'keymaps'
local palette = require'colors.base16-chalk'
require'mini.base16'.setup({palette=palette, use_cterm=true})
