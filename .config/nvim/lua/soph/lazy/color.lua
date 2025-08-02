function ColorMyPencils(color)
	color = color or "kanagawa-wave"
	vim.cmd.colorscheme(color)
end

return {
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        opts = {},
        config = function ()
            ColorMyPencils()
        end
    },
}

