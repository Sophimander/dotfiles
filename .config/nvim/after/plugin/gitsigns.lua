require('gitsigns').setup({
signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  on_attach = function (bufnr)
      local gs = package.loaded.gitsigns

      -- Actions
      vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { buffer = bufnr, desc = '[H]unk [S]tage'})
      vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { buffer = bufnr, desc = '[H]unk [R]eset'})
      vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { buffer = bufnr, desc = '[H]unk [S]tage'})
      vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { buffer = bufnr, desc = '[H]unk [R]eset'})
  end
})
