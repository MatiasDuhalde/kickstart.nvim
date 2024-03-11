return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      panel = {
        enabled = false,
        auto_refresh = false,
        keymap = {
          jump_prev = '[[',
          jump_next = ']]',
          accept = '<CR>',
          refresh = 'gr',
          open = '<M-CR>',
        },
      },
      suggestion = {
        enabled = false,
        auto_trigger = false,
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
  --   'nvim-cmp',
  --   dependencies = {
  --     {
  --       'zbirenbaum/copilot-cmp',
  --       dependencies = 'copilot.lua',
  --       opts = {},
  --       config = function(_, opts)
  --         local copilot_cmp = require 'copilot_cmp'
  --         copilot_cmp.setup(opts)
  --         -- attach cmp source whenever copilot attaches
  --         -- fixes lazy-loading issues with the copilot cmp source
  --         require('lazyvim.util').lsp.on_attach(function(client)
  --           if client.name == 'copilot' then
  --             copilot_cmp._on_insert_enter {}
  --           end
  --         end)
  --       end,
  --     },
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, 1, {
  --       name = 'copilot',
  --       group_index = 1,
  --       priority = 100,
  --     })
  --   end,
  -- },
}

-- vim: ts=2 sts=2 sw=2 et
