vim.api.nvim_create_autocmd('FileType', {
	callback = function(args)
		if vim.treesitter.language.add(vim.bo.filetype) then
			vim.treesitter.start(args.buf)
		end
	end,
})

