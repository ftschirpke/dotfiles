require('ayu').setup({
    mirage = false,
    overrides = {
        -- use ":source $VIMRUNTIME/syntax/hitest.vim" to see the highlight groups
        -- light grey: #292D33, #1B2733
        ColorColumn = { bg = '#1B2733' },
        CursorLine = { bg = '#402410' },
        LineNr = { fg = '#5C6773' },
    },
})
vim.cmd [[colorscheme ayu-dark]]

vim.api.nvim_set_hl(0, 'TreesitterContext', { fg = "#1B2733", bg = "#1B2733" })
