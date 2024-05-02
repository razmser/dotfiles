require('telescope').setup({
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      -- theme = "dropdown",
      -- previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["d"] = "delete_buffer",
        }
      }
    }
  }
})
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- telescope mappings
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>?', telescope.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', telescope.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuraion to telescope to change theme, layout, etc.
  telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', telescope.git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set('n', '<leader>sf', telescope.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', '<leader>sh', telescope.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set('n', '<leader>sg', telescope.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set('n', '<leader>sd', telescope.diagnostics, { desc = "[S]earch [D]iagnostics" })

