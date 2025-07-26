local map = vim.keymap.set

map("i",",.", "->")
map("n", "<Leader>c", "<S-i>/*<Esc><S-a>*/<Esc>")
map("i","`fori","for(unsigned int i = @; i < @; i++) {<CR>@<CR>}<Esc>kk/@<CR>");

--make
map("n", "<leader>r",":term bear -- make -j12<CR>", opts); --build
map("n", "<leader>R",":term bear -- make -Bj12<CR>", opts); --rebuild

local root_markers = {
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'configure.ac', -- AutoTools
  '.git',
}

local paths = vim.fs.find(root_markers, {stop = vim.env.HOME})
local root_dir = vim.fs.dirname(paths[1])

if root_dir then
	vim.lsp.start({
  	name='clangd',
		cmd = {'clangd'},
		root_dir = root_dir,
	})
end
