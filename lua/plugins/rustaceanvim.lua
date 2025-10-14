return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	lazy = false,
	keys = {
		{ "<leader>ca", function() vim.cmd.RustLsp("codeAction") end, ft = "rust" }
	},
	init = function()
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {
			},
			-- LSP configuration
			server = {
				on_attach = function(client, bufnr)
					-- you can also put keymaps in here
				end,
				default_settings = {
					-- rust-analyzer language server configuration
					['rust-analyzer'] = {
						cargo = {
							features = "all"
						}
					},
				},
			},
			-- DAP configuration
			dap = {
			},
		}
	end
}
