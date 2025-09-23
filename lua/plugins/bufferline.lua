return {
	"akinsho/bufferline.nvim",
	version="*",
	lazy=false,
	dependencies="nvim-tree/nvim-web-devicons",
	opts={
		options={
			mode="buffers",
			indicator={
				style="icon"
			}
		}
	},
		keys = {
        { "<leader><Tab>", function() require("bufferline").cycle(1) end, desc = "Next tab", silent = true },
        { "<leader><BS>", function() require("bufferline").cycle(-1) end, desc = "Previous tab", silent = true },
        { "<leader><S-Tab>", function() require("bufferline").move(1) end, desc = "Move tab right", silent = true },
        { "<leader><S-BS>", function() require("bufferline").move(-1) end, desc = "Move tab left", silent = true },
    }
}
