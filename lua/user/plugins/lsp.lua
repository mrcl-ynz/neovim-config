local M = {}

local lspconfig = require("lspconfig")

local diagnostic_config = {
	virtual_text = {
		source = "if_many",
	},
	float = {
		source = "if_many",
	},
	signs = true,
	underline = false,
	severity_sort = true
}

local mappings = {
	['gD'] = vim.lsp.buf.declaration,
	['gd'] = vim.lsp.buf.definition,
	['K'] = vim.lsp.buf.hover,
	['<C-f>'] = vim.lsp.buf.signature_help,
	['<space>D'] = vim.lsp.buf.type_definition,
	['<space>rn'] = vim.lsp.buf.rename,
	['<space>ca'] = vim.lsp.buf.code_action,
	['<space>f'] = function() vim.lsp.buf.format({ async = true }) end,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local server_handlers = {
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = capabilities
		})
	end,
	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
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

function M.setup()
	require("mason").setup()

	require("mason-lspconfig").setup({ handlers = server_handlers})

	vim.diagnostic.config(diagnostic_config)

	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', {}),
		callback = function(ev)
			local opts = { buffer = ev.buf }

			for k, v in pairs(mappings) do
				vim.keymap.set('n', k, v, opts)
			end
		end
	})
end

return M
