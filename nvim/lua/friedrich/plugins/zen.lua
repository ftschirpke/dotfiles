return {
    "folke/zen-mode.nvim",
    config = function()
        require("zen-mode").setup({
            window = {
                backdrop = 0.85,
            },
            plugins = {
                tmux = { enabled = true },
            },
        })
        vim.keymap.set("n", "<leader>z", function() require("zen-mode").toggle() end)
    end,
}
