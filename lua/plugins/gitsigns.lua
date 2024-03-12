-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },
    yadm = {
      enable = false,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Go to next hunk' })

      map('n', '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Go to previous hunk' })

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk, { desc = '[S]tage [H]unk' })
      map('n', '<leader>hr', gs.reset_hunk, { desc = '[R]eset [H]unk' })
      map('v', '<leader>hs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[S]tage [H]unk' })
      map('v', '<leader>hr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[R]eset [H]unk' })
      map('n', '<leader>hS', gs.stage_buffer, { desc = '[S]tage buffer' })
      map('n', '<leader>hu', gs.undo_stage_hunk, { desc = '[U]ndo stage [H]unk' })
      map('n', '<leader>hR', gs.reset_buffer, { desc = '[R]eset buffer' })
      map('n', '<leader>hp', gs.preview_hunk, { desc = '[P]review [H]unk' })
      map('n', '<leader>hb', function()
        gs.blame_line { full = true }
      end, { desc = '[B]lame line' })
      map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = '[T]oggle current line [B]lame' })
      map('n', '<leader>hd', gs.diffthis, { desc = '[D]iff this' })
      map('n', '<leader>hD', function()
        gs.diffthis '~'
      end, { desc = '[D]iff this (previous)' })
      map('n', '<leader>td', gs.toggle_deleted, { desc = '[T]oggle [D]eleted' })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select [H]unk' })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
