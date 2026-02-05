local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
	name = '@vue/typescript-plugin',
	location = "$HOME/.local/share/pnpm",
	languages = { 'vue' },
	configNamespace = 'typescript',
}

local servers = {
	gopls = {},
	svelte = {},
	dartls = {},
	lua_ls = {},
	ts_ls = {
		init_options = {
			plugins = {
				vue_plugin,
			},
		},
		filetypes = tsserver_filetypes,
	},
	vue_ls = {},
	templ = {
		cmd = { "go", "tool", "templ", "lsp" }
	},
	fennel_ls = {},
	emmet_ls = {},
	gleam = {},
	fsautocomplete = {},
	-- clojure_lsp = {},
	rust_analyzer = {
		cmd = { "rustup", "run", "stable", "rust-analyzer" },
	},
	elixirls = {
		cmd = { "/home/gabrielg/.local/bin/elixir-ls/language_server.sh" },
	},
	kotlin_lsp = {
		cmd = { "/home/gabrielg/.local/bin/kotlin-lsp/kotlin-lsp.sh", "--stdio" },
	},
}

for server, config in pairs(servers) do
	vim.lsp.enable(server)
	vim.lsp.config(server, config)
end
