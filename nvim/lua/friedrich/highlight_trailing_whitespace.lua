vim.api.nvim_set_hl(0, 'TrailingWhitespace', { fg = 'red', bg = 'red' })
vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        vim.fn.matchadd('TrailingWhitespace', '\\s\\+$')
    end,
})
