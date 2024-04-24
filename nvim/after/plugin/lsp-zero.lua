local lsp = require('lsp-zero').preset({})

local on_attach = function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({
    buffer = bufnr,
    -- force lsp-zero keybindings because I use which-key plugin
    preserve_mappings = false,
  })
end

lsp.on_attach(on_attach)

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

--automatic setup of language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  },
})

-- gopls config provided by go.nvim
require('go').setup{
  lsp_cfg = false
}
local cfg = require('go.lsp').config()
cfg['on_attach'] = on_attach
require('lspconfig').gopls.setup(cfg)

lsp.setup()
