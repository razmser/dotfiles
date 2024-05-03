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
  lsp_cfg = true,
  lsp_on_attach = on_attach,
  diagnostic = {
    underline = false,
  }
}

local cfg = require'go.lsp'.config()
local override = {
  settings = {
    gopls = {
      analyses = {
        fieldalignment = false,
        shadow = false
      }
    }
  }
}
cfg = vim.tbl_deep_extend('force', cfg, override)

require('lspconfig').gopls.setup(cfg)

lsp.setup()
