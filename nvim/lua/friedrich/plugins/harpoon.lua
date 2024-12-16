return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
            { desc = "Harpoon: Add current buffer to quick menu list" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Harpoon: Toogle quick menu list" })
        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon: Select 1" })
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(2) end, { desc = "Harpoon: Select 2" })
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(3) end, { desc = "Harpoon: Select 3" })
        vim.keymap.set("n", "<C-m>", function() harpoon:list():select(4) end, { desc = "Harpoon: Select 4" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(5) end, { desc = "Harpoon: Select 5" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(6) end, { desc = "Harpoon: Select 6" })
    end,
}
