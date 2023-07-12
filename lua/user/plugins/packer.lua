local M = {}

local plugins = {
	-- Plugin manager
	'wbthomason/packer.nvim',

	-- LSP support
	'neovim/nvim-lspconfig',

	-- LSP Installer
	{
		'williamboman/mason.nvim',
		run = ':MasonUpdate'
	},
	'williamboman/mason-lspconfig.nvim',

	-- Completion
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',

	-- Snippets
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
}

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

function M.setup()
	local packer_bootstrap = ensure_packer()

	require('packer').startup({
		function(use)
			use(plugins)

			if packer_bootstrap then
				require('packer').sync()
			end
		end,
		config = {
			display = {
				open_fn = function()
					return require("packer/util").float({ border = 'single' })
				end
			}
		}
	})
end

return M
