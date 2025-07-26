local map = vim.keymap.set
local opts = { noremap = true }
vim.opt.syntax="c"

map("i",",.", "->")
map("n", "<Leader>c", "<S-i>/*<Esc><S-a>*/<Esc>")
