return {
  'onsails/lspkind-nvim',
  dependencies = {
    'hrsh7th/nvim-cmp',
  },
  config = function()
    local lspkind = require 'lspkind'

    local cmp = require 'cmp'

    cmp.setup {
      formatting = {
        fields = {
          'kind',
          'abbr',
          'menu',
        },
        expandable_indicator = true,
        format = lspkind.cmp_format {
          mode = 'symbol', -- show only symbol annotations
          maxwidth = {
            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- menu = function() return math.floor(0.45 * vim.o.columns) end,
            menu = 50, -- leading text (labelDetails)
            abbr = 50, -- actual suggestion item
          },
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function(_, vim_item)
            -- ...
            return vim_item
          end,
        },
      },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
