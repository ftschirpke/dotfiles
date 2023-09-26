local lsp = require('lsp-zero')

lsp.preset('recommended')

local cmp = require('cmp')
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-z>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
    })
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    lsp.buffer_autoformat()
end)

lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp.default_setup,
    },
})

require('mason-tool-installer').setup({
    ensure_installed = {
        -- Bash (shell)
        'bash-language-server',
        'beautysh',
        -- C++ (C)
        'clang-format',
        'clangd',
        'cmake-language-server',
        'cmakelang',
        'cpptools',
        -- JSON
        'json-lsp',
        -- LaTeX
        'bibtex-tidy',
        'latexindent',
        'texlab',
        -- Lua
        'lua-language-server',
        'selene',
        -- Markdown
        'marksman',
        'prettier',
        -- Python
        'autopep8',
        'python-lsp-server',
    },
    run_on_start = false,
})
