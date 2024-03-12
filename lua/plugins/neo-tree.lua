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
    event_handlers = {
      {
        event = 'file_opened',
        handler = function()
          vim.cmd 'Neotree close'
        end,
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          'node_modules',
          '.git',
        },
      },
      components = {
        harpoon_index = function(config, node, _)
          local Marked = require 'harpoon.mark'
          local path = node:get_id()
          local success, index = pcall(Marked.get_index_of, path)
          if success and index and index > 0 then
            return {
              text = string.format(' ⥤ %d', index), -- <-- Add your favorite harpoon like arrow here
              highlight = config.highlight or 'NeoTreeDirectoryIcon',
            }
          else
            return {}
          end
        end,
      },
      renderers = {
        file = {
          { 'indent' },
          { 'icon' },
          {
            'container',
            content = {
              { 'name', use_git_status_colors = true, zindex = 10 },
              {
                'symlink_target',
                zindex = 10,
                highlight = 'NeoTreeSymbolicLinkTarget',
              },
              { 'harpoon_index', zindex = 10 }, --> This is what actually adds the component in where you want it
              { 'clipboard', zindex = 10 },
              { 'bufnr', zindex = 10 },
              { 'modified', zindex = 20, align = 'right' },
              { 'diagnostics', zindex = 20, align = 'right' },
              { 'git_status', zindex = 10, align = 'right' },
              { 'file_size', zindex = 10, align = 'right' },
              { 'type', zindex = 10, align = 'right' },
              { 'last_modified', zindex = 10, align = 'right' },
              { 'created', zindex = 10, align = 'right' },
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.keymap.set('n', '<leader>n', '<Cmd>Neotree toggle<CR>', { desc = '[N]eotree toggle' })

    require('neo-tree').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
