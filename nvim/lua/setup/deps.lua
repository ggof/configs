-- easier lsp configuration
MiniDeps.add('neovim/nvim-lspconfig')

MiniDeps.add({
	source = 'nvim-treesitter/nvim-treesitter',
	checkout = 'main',
	monitor = 'main',
	hooks = { post_checkout = function() vim.cmd.TSUpdate() end },
})

-- colorscheme
MiniDeps.add("vague-theme/vague.nvim")


MiniDeps.add("ibhagwan/fzf-lua")

MiniDeps.add({
	source = "nvim-neotest/neotest",
	depends = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"fredrikaverpil/neotest-golang",
	}
})
MiniDeps.add("mattn/emmet-vim")
MiniDeps.add('Olical/conjure')

MiniDeps.add('stevearc/conform.nvim')
MiniDeps.add('mfussenegger/nvim-lint')
