require("user/base")

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') ..
		'/site/pack/packer/start/packer.nvim'

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			install_path
		})
		vim.cmd("packadd packer.nvim")
		return true
	end

	return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup({
	function(use)
		use({
			'wbthomason/packer.nvim',
			'neovim/nvim-lspconfig',
			{
				'williamboman/mason.nvim',
				run = ':MasonUpdate'
			},
			'williamboman/mason-lspconfig.nvim',
		})

		if packer_bootstrap then
			require('packer').sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end
		}
	}
})

local lspconfig = require('lspconfig')

vim.keymap.set('n', '<space>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<C-f>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end
})

vim.diagnostic.config({
	virtual_text = {
		source = "if_many",
	},
	float = {
		source = "if_many",
	},
	signs = true,
	underline = false,
	severity_sort = true
})

require('mason').setup()
require('mason-lspconfig').setup({
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({})
		end,
		["lua_ls"] = function()
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' }
						},
					}
				}
			})
		end,
	}
})

vim.cmd(":colorscheme lunaperche")
