local ensure_installed = {
	"lua_ls",
	"pyright",
}
return {
	{ 
		"williamboman/mason.nvim",
		opts = {}
	},
	{
		"neovim/nvim-lspconfig",
		cmd = {"LspInfo", "LspInstall", "LspStart"},
		event = {"BufReadPre", "BufNewFile"},
		dependencies = {			
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim"
		},

		init = function()
			vim.opt.signcolumn = "yes"
		end,

		config = function ()
			local lspconfig = require("lspconfig")

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions", 
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				end
			})
			require("mason-lspconfig").setup ({
				ensure_installed = ensure_installed,
			})
		end 
	}
}
