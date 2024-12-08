vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.templ' },
  command = 'setfiletype templ',
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.re' },
  command = 'setfiletype reason',
})

local base16 = require 'mini.base16'
local colors = require 'colors.completions'

vim.api.nvim_create_user_command("Palette", function(opts)
  local color = opts.fargs[1]
  base16.setup({ palette = require("colors." .. color) })
end, {
  nargs = 1,
  complete = function(arg)
    return MiniFuzzy.filtersort(arg, colors)
  end
})
