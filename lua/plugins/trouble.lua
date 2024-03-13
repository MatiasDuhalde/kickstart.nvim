return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function()
    local trouble = require 'trouble'

    vim.keymap.set('n', '<leader>xx', function()
      trouble.toggle()
    end, { desc = 'Trouble toggle' })
    vim.keymap.set('n', '<leader>xw', function()
      trouble.toggle 'workspace_diagnostics'
    end, { desc = '[W]orkspace diagnostics' })
    vim.keymap.set('n', '<leader>xd', function()
      trouble.toggle 'document_diagnostics'
    end, { desc = '[D]ocument diagnostics' })
    vim.keymap.set('n', '<leader>xq', function()
      trouble.toggle 'quickfix'
    end, { desc = '[Q]uickfix' })
    vim.keymap.set('n', '<leader>xl', function()
      trouble.toggle 'loclist'
    end, { desc = '[L]oclist' })
    vim.keymap.set('n', 'gR', function()
      trouble.toggle 'lsp_references'
    end, { desc = 'LSP [R]eferences' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
