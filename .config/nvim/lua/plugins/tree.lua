-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true


return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
      local function my_on_attach(bufnr)
          local api = require "nvim-tree.api"

          -- default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- custom mappings
      end

      vim.api.nvim_create_autocmd("BufEnter", {
          nested = true,
          callback = function()
              if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
                  vim.cmd "quit"
              end
          end
      })

    require("nvim-tree").setup { on_attach = my_on_attach }
    vim.keymap.set('n', '<leader>pv', require("nvim-tree.api").tree.toggle, { desc = '[P]roject [V]iew' })
  end,
}
