local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'ionide/Ionide-vim',
  'echasnovski/mini.nvim',
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    }
  },
  'folke/trouble.nvim',
  'nvim-tree/nvim-web-devicons',
  'neovim/nvim-lspconfig',
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'dcampos/nvim-snippy',
  'dcampos/cmp-snippy',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  'declancm/cinnamon.nvim',
  'rebelot/kanagawa.nvim',
  'AlexvZyl/nordic.nvim',
  {
    'olivercederborg/poimandres.nvim',
    config = function()
      require('poimandres').setup()
    end
  },
}, {
  version = nil,
})

vim.cmd([[let g:fsharp#lsp_auto_setup = 0]])

vim.g.mapleader = ' '
vim.opt.termguicolors = true

require 'mini.comment'.setup({})
require 'mini.tabline'.setup({})
require 'mini.statusline'.setup({})
require 'mini.pairs'.setup({})

require 'cinnamon'.setup()

-- CONFIGS
require 'settings'
require 'treesitter'
require 'lsp'
require 'keymaps'
require 'completion'

require 'telescope'.setup {
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = require 'telescope.actions'.close
      },
    },
  }
}

require 'trouble'.setup()
require 'noice'.setup({
  routes = {
    {
      -- this is needed to filter out excessive lsp progress messages from Ionide(F#)
      -- we just check if the message contains .fs extension and skip it
      filter = {
        event = "lsp",
        kind = "progress",
        find = ".*.fs.*",
      },
      opts = { skip = true },
    },
  },
})


vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.templ' },
  command = 'setfiletype templ',
})

vim.cmd.colorscheme 'nordic'
