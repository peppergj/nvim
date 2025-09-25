return {
	"lewis6991/hover.nvim",

	config = function()
		require("hover").setup {
			init = function()
				require("hover.providers.lsp")
				require('hover.providers.diagnostic')
				require('hover.providers.fold_preview')
			end,

			preview_opts = {
				border = "rounded"
			},
		}

		vim.keymap.set("n", "K", function() require("hover").hover() end, {desc = "hover.nvim"})
		vim.keymap.set("n", "gK", function() require("hover").hover_select() end, {desc = "hover.nvim (select)"})
		vim.keymap.set("n", "<C-p>", function()
			require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
		vim.keymap.set("n", "<C-n>", function()
			require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})
	end
}
