local utils = require('utils')

local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'

-- utils.opt('o', 'tabline', '%!v:lua.require\'luatab\'.tabline()')
utils.opt('o', 'completeopt', "menuone,noselect")
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4 )
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard','unnamed,unnamedplus')
utils.opt('o', 'ruler', true)
utils.opt('o', 'cursorline', true)
utils.opt('o', 'mouse', 'a')
utils.opt('o', 'showtabline', 2)
-- utils.opt('g', 'fsharp#backend', "disable")
--

vim.api.nvim_set_var("fsharp#backend", "disable")
vim.api.nvim_set_var("fsharp#lsp_auto_setup", 0)
vim.api.nvim_command([[
autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp
]])

