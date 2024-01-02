return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup({
                signs = false,
            })
            vim.keymap.set("n", "<leader>tq", "<cmd>TodoQuickFix<cr>")
            vim.keymap.set("n", "<leader>to", "<cmd>TodoTrouble<cr>")
            vim.keymap.set("n", "<leader>tp", "<cmd>TodoTelescope<cr>")
            vim.keymap.set("n", "<leader>tn", function() require("todo-comments").jump_next() end)
            vim.keymap.set("n", "<leader>tN", function() require("todo-comments").jump_prev() end)
        end,
    },
}
