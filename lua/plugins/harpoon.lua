return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
  config = function(_, opts)
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'

    vim.keymap.set('n', '<leader>a', mark.add_file, { desc = '[A]dd file to Harpoon' })
    vim.keymap.set('n', '<C-q>', ui.toggle_quick_menu, { desc = 'Toggle [Q]uick menu' })

    require('harpoon').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
