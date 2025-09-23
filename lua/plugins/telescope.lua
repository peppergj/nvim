return{
	"nvim-telescope/telescope.nvim",
	dependencies={
		"nvim-lua/plenary.nvim"
	},
	defaults={
		find_command={"rg", "--hidden", "--files", "--glob", "!.git/*"}
	}
}
