local skip_jump = { skip_groups = true, jump = true }

return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>do",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Trouble: Toggle diagnostics",
        },
        {
            "<leader>db",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Trouble: Toggle buffer diagonistcs",
        },
        {
            "<leader>dp",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Trouble: Toggle symbols",
        },
    }
}
