local neotest = require("neotest")
local test = neotest.run
-- Mappings
local opts = { noremap = true, silent = true }

-- QOL
vim.keymap.set("n", "<C-p>", FzfLua.files, opts)
vim.keymap.set("n", "<leader>/", FzfLua.live_grep, opts)
vim.keymap.set("n", "<TAB>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-TAB>", ":bprev<CR>", opts)
vim.keymap.set("n", "<leader>q", ":bdelete<CR>", opts)
-- move current line
vim.keymap.set("i", "<C-j>", "<esc>:m .+1<CR>==a", opts)
vim.keymap.set("i", "<C-k>", "<esc>:m .-2<CR>==a", opts)
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", opts)
vim.keymap.set({ "v", "x" }, "<C-k>", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set({ "v", "x" }, "<C-j>", ":m '>+1<CR>gv=gv", opts)
-- start/end of line
vim.keymap.set({ "n", "v", "x" }, "<C-h>", "^", opts)
vim.keymap.set({ "n", "v", "x" }, "<C-l>", "$", opts)
vim.keymap.set("i", "<C-h>", "<esc>^i", opts)
vim.keymap.set("i", "<C-l>", "<esc>$a", opts)
vim.keymap.set(
	"i",
	"<Tab>",
	[[pumvisible() ? "\<C-n>\<Tab>" : "\<Tab>"]],
	{ noremap = true, silent = true, expr = true }
)
-- paste without yanking
vim.keymap.set("x", "p", '"_dP', opts)

-- move to windows
vim.keymap.set("n", "<A-h>", "<C-w>h", opts)
vim.keymap.set("n", "<A-j>", "<C-w>j", opts)
vim.keymap.set("n", "<A-k>", "<C-w>k", opts)
vim.keymap.set("n", "<A-l>", "<C-w>l", opts)

-- better indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		-- Buffer local mappings.
		local opts = { buffer = ev.buf, noremap = true, silent = true }
		vim.keymap.set("n", "<leader>sd", FzfLua.lsp_definitions, opts)
		vim.keymap.set("n", "<leader>si", FzfLua.lsp_implementations, opts)
		vim.keymap.set("n", "<leader>sa", FzfLua.lsp_code_actions, opts)
		vim.keymap.set("n", "<leader>sn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>sr", FzfLua.lsp_references, opts)
		vim.keymap.set("n", "<leader>se", FzfLua.diagnostics_workspace, opts)
	end,
})

-- FORMAT
local conform = require("conform")
vim.keymap.set("n", "<leader>sf", function()
	conform.format({ async = true, lsp_format = "fallback" })
end, opts)

-- TEST
vim.keymap.set("n", "<leader>tt", function()
	test.run()
end, opts)
vim.keymap.set("n", "<leader>tf", function()
	test.run(vim.fn.expand("%"))
end, opts)
vim.keymap.set("n", "<leader>to", function()
	neotest.output.open()
end, opts)
vim.keymap.set("n", "<leader>tc", function()
	test.stop()
end, opts)
vim.keymap.set("n", "<leader>ts", function()
	neotest.summary.toggle()
end, opts)
