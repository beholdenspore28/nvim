-- ---------------------------------------------------------------------------
-- NVIM OPTIONS
-- ---------------------------------------------------------------------------

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.mouse          = "a"
vim.opt.tabstop        = 2
vim.opt.softtabstop    = 2
vim.opt.shiftwidth     = 2

vim.opt.expandtab      = true
vim.opt.smartindent    = true
vim.opt.breakindent    = true
vim.opt.undofile       = true
vim.opt.swapfile       = false
vim.opt.backup         = false

vim.opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.guicursor      = ""
vim.opt.incsearch      = true
vim.opt.scrolloff      = 200
vim.opt.signcolumn     = "yes"
vim.opt.colorcolumn    = "0"

vim.opt.cursorline     = true
vim.opt.termguicolors  = false
vim.opt.completeopt    = { "menu", "menuone", "longest", "preview" }
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

vim.opt.confirm        = true

-- NOTE. you have to have xclip or another external provider for this to work.
-- once its installed, it should 'just work'
vim.schedule(function()
  vim.opt.clipboard      = 'unnamedplus'
end)

vim.opt.inccommand = "split" --preview substitutions live

--vim.opt.list = true -- whitespace characters
--vim.opt.listchars = {
  --tab = '» ',
  --trail = '·',
  --nbsp = '␣' ,
  --eol = '↵',
  --multispace = ' '
--}

vim.opt.isfname:append("@-@")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local map = vim.keymap.set
local opts = { noremap = true }

-- ---------------------------------------------------------------------------
-- NORMAL MODE MAPS
-- ---------------------------------------------------------------------------

-- clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

--save buffer
map("n","<leader>w",":w<CR>", opts)
map("n","<leader>W",":wa<CR>", opts)

--git
map("n","<leader>gs",":!git status<CR>", opts)
map("n","<leader>gd",":!git diff ", opts)
map("n","<leader>gc",":!git add . && git commit -m \"\"<Left>", opts)
map("n","<leader>gp",":!git push<CR>", opts)
map("n","<leader>gl",":!git log --oneline<CR>g", opts)

--open nvim config
map("n", "<leader>`", ":so ~/.config/nvim/init.lua<CR>")
map("n", "<leader>~", ":e ~/.config/nvim/init.lua<CR>")

--disable arrow keys "normal mode"
map("n", "<Left>", "<Nop>");
map("n", "<Right>", "<Nop>");
map("n", "<Up>", "<Nop>");
map("n", "<Down>", "<Nop>");

-- ---------------------------------------------------------------------------
-- INSERT MODE MAPS
-- ---------------------------------------------------------------------------

--auto complete
map("i", "<C-p","<C-x-C-i>",opts)
map("i", "<C-n","<C-x-C-i>",opts)

--disable arrow keys "insert mode"
map("i", "<Left>", "<Nop>");
map("i", "<Right>", "<Nop>");
map("i", "<Up>", "<Nop>");
map("i", "<Down>", "<Nop>");

--find file
map("n","<leader>f",":find ./**/*", opts)

--netrw (file tree / file manager)
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3 --tree style netrw
map("n", "<leader>e", ":Ex<CR>")

--buffers
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprev<CR>", opts)
map("n", "<leader>d", ":bd!<CR>", opts)
map("n", "<leader><Tab>", ":buffers<CR>", opts)

--window switching
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- ---------------------------------------------------------------------------
-- VISUAL MODE MAPS
-- ---------------------------------------------------------------------------

map("v", "<Left>", "<Nop>");
map("v", "<Right>", "<Nop>");
map("v", "<Up>", "<Nop>");
map("v", "<Down>", "<Nop>");

-- ---------------------------------------------------------------------------
-- TERMINAL MODE MAPS
-- ---------------------------------------------------------------------------

--exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ---------------------------------------------------------------------------
-- COLORSCHEME
-- ---------------------------------------------------------------------------
vim.cmd [[colorscheme default]]
vim.opt.background = "dark"

-- ---------------------------------------------------------------------------
-- AUTOCOMMANDS
-- ---------------------------------------------------------------------------

-- highlight the text you just yanked for a short moment.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
