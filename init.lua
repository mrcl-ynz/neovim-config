vim.opt.whichwrap = 'b,s,h,l,<,>'
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.fillchars = 'eob: '
vim.opt.cmdheight = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.hlsearch = false
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.colorcolumn = '80'
vim.opt.hidden = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showtabline = 0
vim.opt.title = true
vim.opt.mouse = 'a'
vim.opt.shortmess = "aoOtI"
vim.opt.undofile = true
vim.opt.completeopt = {'menuone', 'noinsert'}
vim.opt.pumheight = 10
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.updatetime = 200
vim.opt.signcolumn = 'yes'

vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })

vim.keymap.set('i', '<A-Up>', '<C-\\><C-N><C-w>k', { noremap = true, silent = true })
vim.keymap.set('i', '<A-Down>', '<C-\\><C-N><C-w>j', { noremap = true, silent = true })
vim.keymap.set('i', '<A-Left>', '<C-\\><C-N><C-w>h', { noremap = true, silent = true })
vim.keymap.set('i', '<A-Right>', '<C-\\><C-N><C-w>l', { noremap = true, silent = true })

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

vim.keymap.set('n', '<Space>e', ':Ex<CR>', { noremap = true, silent = true })

vim.cmd(":colorscheme lunaperche")

