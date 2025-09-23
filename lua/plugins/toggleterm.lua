return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup{
      direction = "vertical", -- terminal on side, set to float if wanting in the middle yay
      shade_terminals = true,
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true,
      float_opts = {
        border = "curved",
        winblend = 5,
        width = 80,
        height = 30
      },
      highlights = {
          FloatBorder = {
              guifg = "#4b0082"
          }
      }
    }
  end
}
