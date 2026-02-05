local lint = require('lint')

lint.linters_by_ft = {
  markdown = {'vale'},
	clojure = { 'clj-kondo' },
	go = { 'golangci-lint' },
	javascript = { 'biomejs' },
	fish = { 'fish' },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufEnter" }, {
  callback = function()
    lint.try_lint()
  end,
})
