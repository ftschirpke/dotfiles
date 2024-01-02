local skip_jump = { skip_groups = true, jump = true }

return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({})
            vim.keymap.set("n", "<leader>do", function() require("trouble").toggle("workspace_diagnostics") end)
            vim.keymap.set("n", "<leader>dc", function() require("trouble").toggle() end)
            vim.keymap.set("n", "<leader>dq", function() require("trouble").toggle("quickfix") end)
            vim.keymap.set("n", "<leader>n", function() require("trouble").next(skip_jump) end)
            vim.keymap.set("n", "<leader>dn", function() require("trouble").next(skip_jump) end)
            vim.keymap.set("n", "<leader>N", function() require("trouble").previous(skip_jump) end)
            vim.keymap.set("n", "<leader>dN", function() require("trouble").previous(skip_jump) end)
        end,
    }
}
