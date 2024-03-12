return {
  'mbbill/undotree',
  opts = {},
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = '[U]ndotree toggle' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
