return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gf', vim.cmd.Git, { desc = 'Open [F]ugitive' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
