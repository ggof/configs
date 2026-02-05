-- install mini.nvim to enable all mini packages (including mini.deps)
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

require 'setup.mini'
require 'setup.deps'

require 'fzf-lua'.setup()

vim.cmd.colorscheme('vague')

require 'setup.treesitter'
require 'setup.conform'
require 'setup.nvim-lint'
require 'lsp'
require 'tests'
require 'settings'
require 'keymaps'
