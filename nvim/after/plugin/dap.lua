local dap = require('dap')
local widgets = require('dap.ui.widgets')

dap.adapters.go = {
  type = 'server';
  port = '8000',
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "remote debug",
    request = "attach",
    mode = "remote",
  }
}

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end, { desc = "[D]ap toggle [b]reapoint" })
vim.keymap.set('n', '<Leader>dt', dap.terminate, { desc = "[D]ap [t]erminate" })

