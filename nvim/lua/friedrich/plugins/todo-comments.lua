return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup({
            signs = false,
            highlight = {
                multiline = false,
            },
        })
        vim.keymap.set("n", "<leader>tq", "<cmd>TodoQuickFix<cr>",
            { desc = "TodoComments: Show Todos in quick fix list" })
        vim.keymap.set("n", "<leader>to", "<cmd>TodoTrouble<cr>", { desc = "TodoComments: Show Todos in Trouble list" })
        vim.keymap.set("n", "<leader>tp", "<cmd>TodoTelescope<cr>", { desc = "TodoComments: Show Todos in Telescope" })
        vim.keymap.set("n", "<leader>tn", function() require("todo-comments").jump_next() end,
            { desc = "TodoComments: Jump to next Todo comment" })
        vim.keymap.set("n", "<leader>tN", function() require("todo-comments").jump_prev() end,
            { desc = "TodoComments: Jump to previous Todo comment" })
    end,
}
