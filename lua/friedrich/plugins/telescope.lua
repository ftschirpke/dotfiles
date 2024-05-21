return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.7",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
        config = function()
            local trouble = require("trouble.providers.telescope")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = { ["<c-t>"] = trouble.open_with_trouble },
                        n = { ["<c-t>"] = trouble.open_with_trouble },
                    },
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

            vim.keymap.set("n", "gr", builtin.lsp_references, {})
            vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
            vim.keymap.set("n", "gi", builtin.lsp_implementations, {})

            vim.keymap.set("n", "<leader>ld", builtin.lsp_document_symbols, {})
            vim.keymap.set("n", "<leader>ls", builtin.lsp_dynamic_workspace_symbols, {})

            vim.keymap.set("n", "<leader>ds", builtin.diagnostics, {})
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }
}
