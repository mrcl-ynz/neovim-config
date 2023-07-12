local M = {}

options = {
	whichwrap = 'b,s,h,l,<,>',
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	scrolloff = 8,
	sidescrolloff = 8,
	fillchars = 'eob: ',
	cmdheight = 1,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	hlsearch = false,
	termguicolors = true,
	cursorline = true,
	colorcolumn = '80',
	hidden = true,
	splitbelow = true,
	splitright = true,
	showtabline = 0,
	title = true,
	mouse = 'a',
	shortmess = "aoOtI",
	undofile = true,
	completeopt = {'menuone', 'noinsert'},
	pumheight = 10,
	tabstop = 4,
	shiftwidth = 4,
	smarttab = true,
	smartindent = true,
	backup = false,
	updatetime = 200,
	signcolumn = 'yes',
}

function M.setup()
	for k, v in pairs(options) do
		vim.opt[k] = v
	end
end

return M
