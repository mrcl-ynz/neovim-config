local M = {}

local opts = { noremap = true, silent = true }

local modes = {
	insert = 'i',
	normal = 'n',
	visual = 'v',
}

local keymaps = {
	insert = {
		['<A-j>'] = '<Esc>:m .+1<CR>==gi',
		['<A-k>'] = '<Esc>:m .-2<CR>==gi',

		['<A-Up>'] = '<C-\\><C-N><C-w>k',
		['<A-Down>'] = '<C-\\><C-N><C-w>j',
		['<A-Left>'] = '<C-\\><C-N><C-w>h',
		['<A-Right>'] = '<C-\\><C-N><C-w>l',
	},
	normal = {
		['<C-h>'] = '<C-w>h',
		['<C-j>'] = '<C-w>j',
		['<C-k>'] = '<C-w>k',
		['<C-l>'] = '<C-w>l',
		['<C-Up>'] = ':resize -2<CR>',
		['<C-Down>'] = ':resize +2<CR>',
		['<C-Left>'] = ':vertical resize -2<CR>',
		['<C-Right>'] = ':vertical resize +2<CR>',
		['<A-j>'] = ':m .+1<CR>==',
		['<A-k>'] = ':m .-2<CR>==',

		['<Space>e'] = ':Ex<CR>',
	},
	visual = {
		['<'] = '<gv',
		['>'] = '>gv',
	}
}

function M.setup()
	for mode, mappings in pairs(keymaps) do
		for k,v in pairs(mappings) do
			vim.keymap.set(modes[mode], k, v, opts)
		end
	end
end

return M
