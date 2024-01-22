require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")

-- Define the jump functions
local function jump_forward_snips()
    if ls.jumpable(1) then
        ls.jump(1)
    end
end

local function jump_backward_snips()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end

-- Set key mappings to call the jump functions in insert mode
vim.keymap.set({"i", "s"}, '<C-J>', jump_forward_snips, { noremap = true, silent = true })
vim.keymap.set({"i", "s"}, '<C-H>', jump_backward_snips, { noremap = true, silent = true })
