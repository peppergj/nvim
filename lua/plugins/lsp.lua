local ensure_installed = {
	"rust_analyzer",
	"lua_ls",
	"tinymist",
	"basedpyright",
}

local default_server_opts = {

}

return {
	{
		"williamboman/mason.nvim",
		opts = {}
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall","LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		init = function()
			vim.opt.signcolumn = "yes"
		end,
		config = function()
			local lspconfig = require("lspconfig")

			-- Stuff that only works when there is an active LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					-- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
					-- MOVED TO SNACKS PICKER
					-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
					vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)
					vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
				end
			})

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
				automatic_enable = {
					exclude = {
						"rust_analyzer",
					},
				},
			})

			require("mason-lspconfig").setup_handlers({
			  function(server_name)
				if server_name ~= "rust_analyzer" then
				  lspconfig[server_name].setup(default_server_opts)
				end
			  end,
			})
		end
	}
}
