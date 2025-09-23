-- clear search automatically
vim.keymap.set("n", "<ESC>", ":nohlsearch<CR>", {silent=true}) --n means normal mode, esc = binding, CR executes command, silent does not say in thingymabob
vim.keymap.set("n", "<leader>d", ":bd<CR>", {silent=true}) -- close tab

-- telescope bindings
vim.keymap.set("n", "<leader>o", ":Telescope find_files<CR>", {silent=true}) -- open files
vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics<CR>", {silent=true}) -- lets you jump to errors in code
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", {silent=true}) -- search for text in files :)
vim.keymap.set("n", "<leader>fs", ":Telescope spell_suggest<CR>", {silent=true}) -- I HATE YOU HCHAP1 (suggests spelling)
vim.keymap.set("n", "<leader>fr", ":Telescope lsp_references<CR>", {silent=true}) -- it just shows where the variable is in the coding

-- open toggle terminal
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", {silent=true}) -- open termy
