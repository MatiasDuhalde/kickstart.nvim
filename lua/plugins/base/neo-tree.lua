return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
  },
  opts = {
    source_selector = {
      winbar = true,
      statusline = false,
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
