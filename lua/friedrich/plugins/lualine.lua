local lualine_options = {
    options = {
        icons_enabled = false,
        theme = 'ayu',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diagnostics' },
        lualine_c = { { 'filename', path = 1, shorting_target = 80 } },
        lualine_x = { 'encoding' },
        lualine_y = { 'filetype' },
        lualine_z = { 'location', 'progress' },
    },
}

return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = lualine_options,
    },
}
