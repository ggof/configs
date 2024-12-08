local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
end

require 'mini.notify'.setup({ lsp_progress = { enable = false } })

vim.notify = MiniNotify.make_notify()

require 'mini.comment'.setup({})
require 'mini.pairs'.setup({})
require 'mini.tabline'.setup({})
require 'mini.statusline'.setup({})
require 'mini.fuzzy'.setup({})
require 'mini.pick'.setup({})

require 'mini.deps'.setup({ path = { package = path_package } })

MiniDeps.add('nvim-tree/nvim-web-devicons')
MiniDeps.add('neovim/nvim-lspconfig')
MiniDeps.add('honza/vim-snippets')
MiniDeps.add('dcampos/nvim-snippy')
MiniDeps.add('dcampos/cmp-snippy')
MiniDeps.add('mattn/emmet-vim')
MiniDeps.add('dcampos/cmp-emmet-vim')
MiniDeps.add('hrsh7th/cmp-nvim-lsp')
MiniDeps.add('hrsh7th/nvim-cmp')
MiniDeps.add('ionide/ionide-vim')
MiniDeps.add('karb94/neoscroll.nvim')
MiniDeps.add('olivercederborg/poimandres.nvim')

MiniDeps.add({
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'master',
  monitor = 'master',
  hooks = { post_checkout = function() vim.cmd.TSUpdate() end },
})

MiniDeps.add('danielo515/nvim-treesitter-reason')

require 'cmds'
require 'settings'
require 'keymaps'
require 'completion'
require 'lsp'
require 'treesitter'

require 'neoscroll'.setup()

vim.cmd.Palette('tokyo-night-terminal-dark')
