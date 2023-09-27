require('lualine').setup({
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
})
