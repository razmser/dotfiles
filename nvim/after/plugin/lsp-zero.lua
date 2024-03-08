local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({
    buffer = bufnr,
    -- force lsp-zero keybindings because I use which-key plugin
    preserve_mappings = false,
  })
end)

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

lsp.setup()
