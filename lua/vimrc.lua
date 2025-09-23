vim.g.mapleader=' ' -- set space character as leader key
vim.g.maplocalleader='\\' -- sigma
vim.o.termguicolors=true --24 bit colour
vim.opt.mouse=""
vim.o.expandtab=false
vim.o.ts=4 --how wide tabs are
vim.o.sw=4 -- this is how many tabs used when youre auto-indenting
vim.o.scrolloff=6 -- this is how many lines are between cursor and bottom of file when scrolling
vim.o.number=true -- whether to show line numbers
vim.o.autoindent=true
vim.o.encoding="UTF-8"
vim.o.relativenumber=false
vim.o.cursorline=true -- slightly highlights line that you are editing
vim.o.smarttab=true
vim.o.wildmenu=true --autocomplete in commandbar
vim.o.wildmode="longest,full"
vim.o.lbr=true
vim.o.showmatch=false -- move to matching bracket when closing it
vim.o.wmh=0 

-- Due to the way neovim loads formatoptins, set it upon entering any buffer
vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter"},{pattern={"*"},callback=function()
    vim.o.formatoptions = "qn1"
end})
