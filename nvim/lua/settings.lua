local utils = require('utils')

local indent = 2

vim.cmd.syntax('enable')
vim.cmd.filetype('plugin indent on')

vim.g.fsharp = { lsp_auto_setup = 0 }
vim.g.mapleader = ' '
vim.opt.termguicolors = true

utils.opt('o', 'completeopt', 'menu,menuone,noselect')
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', false)
utils.opt('o', 'scrolloff', 2)
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'ruler', true)
utils.opt('o', 'cursorline', true)
utils.opt('o', 'mouse', 'a')
utils.opt('o', 'showtabline', 2)
