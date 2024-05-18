local lsp_zero = require('lsp-zero')
lsp_zero.preset("recommended")

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
require('lsp-zero.cmp').extend()

cmp.setup({
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({
            reason = cmp.ContextReason.Auto,
        }), {"i", "c"}),
		['<C-n>'] = cmp_action.luasnip_jump_forward(),
		['<C-p>'] = cmp_action.luasnip_jump_backward(),
		['<C-y>'] = cmp.mapping.confirm({select = true}),
    },
		sources = {
		{name = 'nvim_lsp'}
	}
})

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})

