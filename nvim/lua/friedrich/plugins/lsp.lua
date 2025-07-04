local configure_lsp_zero = function()
    local lsp_zero = require("lsp-zero")
    lsp_zero.preset("recommended")

    lsp_zero.configure("lua_ls", {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    })
    local cmp = require("cmp")
    local cmp_select = lsp_zero.cmp_action()

    cmp.setup({
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
            ["<C-z>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<Tab>"] = nil,
            ["<S-Tab>"] = nil,
        })
    })

    vim.o.winborder = "single"

    lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
        local opts = { buffer = bufnr, remap = false }
        opts["desc"] = "LSP: Hover element (show hovering information)"
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        opts["desc"] = "LSP: Show (and execute) code actions"
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        opts["desc"] = "LSP: Rename a named element"
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        opts["desc"] = "LSP: Format file"
        vim.keymap.set({ "n", "x" }, "<leader>f", function()
            vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
        end, opts)

        opts["desc"] = "LSP: Toggle format on save (autoformat)"
        vim.keymap.set("n", "<leader>k", function()
            vim.b.lsp_zero_enable_autoformat = not vim.b.lsp_zero_enable_autoformat
            if vim.b.lsp_zero_enable_autoformat then
                print("Autoformat enabled")
            else
                print("Autoformat disabled")
            end
        end, opts)

        opts["desc"] = "LSP: Switch between source and header (Clangd)"
        vim.keymap.set("n", "<leader>h", ":ClangdSwitchSourceHeader<CR>", opts)
    end)

    lsp_zero.format_on_save({
        format_opts = {
            async = false,
            timeout_ms = 5000,
        },
        servers = {
            ["clangd"] = { "c", "cpp" },
            ["lua_ls"] = { "lua" },
            ["pylsp"] = { "py", "python" },
            ["gopls"] = { "go" },
            ["texlab"] = { "tex", "bib" },
            ["rust_analyzer"] = { "rs", "rust" },
            ["zls"] = { "zig" },
        },
    })

    lsp_zero.setup()
end

local rust_analyzer_handler = function()
    require("lspconfig").rust_analyzer.setup({
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                checkOnSave = true,
                check = {
                    enable = true,
                    command = "clippy",
                    features = "all",
                },
                procMacro = {
                    enable = true
                },
            }
        }
    })
end

for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end

local configure_mason = function()
    require("mason").setup({})
    require("mason-lspconfig").setup({
        handlers = {
            require("lsp-zero").default_setup,
            rust_analyzer = rust_analyzer_handler,
        },
    })
    require("mason-tool-installer").setup({
        ensure_installed = {
            -- Bash (shell)
            "bash-language-server",
            "beautysh",
            -- C++ (C)
            "clang-format",
            "clangd",
            "cmake-language-server",
            -- JSON
            "json-lsp",
            -- LaTeX
            "bibtex-tidy",
            "latexindent",
            "texlab",
            -- Lua
            "lua-language-server",
            "selene",
            -- Markdown
            "marksman",
            "prettier",
            -- Python
            "autopep8",
            "python-lsp-server",
        },
        run_on_start = false,
    })
end

return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            configure_lsp_zero()
            configure_mason()
        end,
    },
    "WhoIsSethDaniel/mason-tool-installer.nvim",
}
