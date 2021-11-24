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

    use 'norcalli/nvim-colorizer.lua'
end)

vim.g.mapleader = ' '
vim.o.termguicolors = true

require'neoscroll'.setup()
require'mini.comment'.setup({})
require'mini.tabline'.setup({})
require'mini.surround'.setup({})
require'mini.pairs'.setup({})
require'mini.statusline'.setup({})

local palette = require'colors.base16-material-darker'

require'mini.base16'.setup({
  palette = palette,
  use_cterm = true,
})

require'colorizer'.setup()

-- CONFIGS
require'settings'
require'treesitter'
require'lsp'
require'keymaps'
require'syntax'
require'complete'
