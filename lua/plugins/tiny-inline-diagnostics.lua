return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
	opts = {
		preset = "modern",
		options = {
			show_all_diags_on_cursorline = true,
		}
	},
    init = function()
        vim.diagnostic.config({ virtual_text = false })
    end
}
