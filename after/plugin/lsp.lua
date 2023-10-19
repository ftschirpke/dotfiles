local lsp_zero = require('lsp-zero')

lsp_zero.preset('recommended')

lsp_zero.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

local cmp = require('cmp')
local cmp_select = require('lsp-zero').cmp_action()

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

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
    end, opts)
end)

lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 5000,
    },
    servers = {
        ['clangd'] = { 'c', 'cpp' },
        ['lua_ls'] = { 'lua' },
        --['pylsp'] = { 'py' },
        ['texlab'] = { 'tex', 'bib' },
        ['rust_analyzer'] = { 'rs', 'rust' },
    },
})

lsp_zero.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
        rust_analyzer = function()
            require('lspconfig').rust_analyzer.setup({
                on_attach = function(client)
                    require('completion').on_attach(client)
                end,
                settings = {
                    ["rust-analyzer"] = {
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true
                        },
                    }
                }
            })
        end,
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
