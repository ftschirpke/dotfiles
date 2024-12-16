return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
        config = function()
            local trouble = require("trouble.sources.telescope")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = { ["<c-t>"] = trouble.open },
                        n = { ["<c-t>"] = trouble.open },
                    },
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find file in project files" })
            vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find file in git files" })
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Grep find in project files" })

            vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "LSP: go to references" })
            vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "LSP: go to definition(s)" })
            vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "LSP: go to implementation(s)" })

            vim.keymap.set("n", "<leader>ld", builtin.lsp_document_symbols, { desc = "LSP: list document symbols" })
            vim.keymap.set("n", "<leader>ls", builtin.lsp_dynamic_workspace_symbols,
                { desc = "LSP: list workspace symbols" })

            vim.keymap.set("n", "<leader>ds", builtin.diagnostics, { desc = "LSP: list workspace diagnostics (errors)" })
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }
}
