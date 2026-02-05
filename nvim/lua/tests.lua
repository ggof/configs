require("neotest").setup({
	-- your neotest config here
	diagnostic = { enabled = true },
log_level = vim.log.levels.DEBUG,
	adapters = {
		require("neotest-golang")({runner = "gotestsum"}),
	},
})
