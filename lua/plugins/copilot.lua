return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>',
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = '<M-l>',
          accept_word = false,
          accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        help = true,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = true,
      },
      copilot_node_command = 'node',
      server_opts_overrides = {},
    },
  },
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   dependencies = { 'zbirenbaum/copilot.lua', 'onsails/lspkind-nvim' },
  --   config = function()
  --     require('copilot_cmp').setup()
  --
  --     local cmp_config = require('cmp').get_config()
  --     table.insert(cmp_config.sources, 1, {
  --       name = 'copilot',
  --     })
  --     table.insert(cmp_config.sorting.comparators, 1, require('copilot_cmp.comparators').prioritize)
  --     cmp.setup(cmp_config)
  --     local lspkind = require 'lspkind'
  --     lspkind.init {
  --       symbol_map = {
  --         Copilot = '',
  --       },
  --     }
  --     vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })
  --   end,
  -- },
}

-- vim: ts=2 sts=2 sw=2 et
