require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'echasnovski/mini.nvim'

    use 'kyazdani42/nvim-web-devicons'
    use 'neovim/nvim-lspconfig'

    use 'karb94/neoscroll.nvim'

    use 'nvim-treesitter/nvim-treesitter'

    -- COMPLETION
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- FUZZY FINDER
    use  'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use {
      'ionide/ionide-vim',
      run = 'make fsautocomplete'
    }
end)

vim.g.mapleader = ' '
vim.o.termguicolors = true

require'neoscroll'.setup()

require('mini.comment').setup({})
require'mini.tabline'.setup({})
require'mini.surround'.setup({})
require'mini.statusline'.setup({})
require'mini.pairs'.setup({})

vim.cmd [[let g:fsharp#lsp_recommended_colorscheme = 0]]
vim.cmd [[let g:fsharp#lsp_auto_setup = 0]]

require'ionide'.setup{}

-- CONFIGS
require'settings'
require'treesitter'
require'lsp'
require'keymaps'
require'completion'
local palette = require'colors.base16-gruvbox-dark-hard'
require'mini.base16'.setup({palette=palette})
