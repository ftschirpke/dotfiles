require('lualine').setup({
    options = {
        icons_enabled = false,
        theme = 'ayu',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diagnostics' },
        lualine_c = { { 'filename', path = 1, shorting_target = 80 } },
        lualine_x = { 'filetype', 'encoding' },
        lualine_y = { 'location', 'progress' },
        lualine_z = { { 'datetime', style = '%a %d-%m-%Y | %H:%M' } }
    },
})
