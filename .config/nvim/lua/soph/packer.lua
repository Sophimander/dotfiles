-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    use "rebelot/kanagawa.nvim"

    use {
        'ThePrimeagen/harpoon', branch = 'harpoon2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'hrsh7th/cmp-nvim-lua'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-cmdline'},
        {'saadparwaiz1/cmp_luasnip'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},     -- Required
        {'rafamadriz/friendly-snippets'},
    }
}

-- Vim practice tool
use 'ThePrimeagen/vim-be-good'

-- DAP things
use 'mfussenegger/nvim-dap'
use 'theHamsta/nvim-dap-virtual-text'
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

-- File tree
use 'nvim-tree/nvim-tree.lua'
use 'nvim-tree/nvim-web-devicons'

-- Git signs in editor
use 'lewis6991/gitsigns.nvim'

-- Status line
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

-- Splash screen
use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}

-- Indent guide
use 'lukas-reineke/indent-blankline.nvim'

-- Shows keymappings
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

use("github/copilot.vim")

end)
