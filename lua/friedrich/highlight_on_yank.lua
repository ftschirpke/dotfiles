local friedrich_group = vim.api.nvim_create_augroup('friedrich', {})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = friedrich_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 60,
        })
    end,
})
