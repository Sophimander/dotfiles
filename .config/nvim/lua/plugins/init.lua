return {
    'nvim-lua/plenary.nvim',
    'rebelot/kanagawa.nvim',
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },
            {
                -- Additional lua configuration, makes nvim stuff amazing!
                'folke/neodev.nvim',
            },
        }
    },
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',

            'hrsh7th/cmp-cmdline',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },
    {
        "folke/which-key.nvim", opts = {},
        dependencies = {
            { 'echasnovski/mini.icons', version = '*' },
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup({})
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            require("ibl").setup {
                scope = {
                    show_start = false,
                }
            }
        end
    },
}
