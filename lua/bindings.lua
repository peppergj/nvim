-- clear search automatically
vim.keymap.set("n", "<ESC>", ":nohlsearch<CR>", {silent=true}) --n means normal mode, esc = binding, CR executes command, silent does not say in thingymabob
vim.keymap.set("n", "<leader>d", ":bd<CR>", {silent=true}) -- close tab

-- telescope bindings
vim.keymap.set("n", "<leader>o", ":Telescope find_files<CR>", {silent=true}) -- close tab
