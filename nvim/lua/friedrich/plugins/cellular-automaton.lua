return {
    "eandrju/cellular-automaton.nvim",
    config = function()
        vim.keymap.set("n", "<leader>FML", "<cmd>CellularAutomaton make_it_rain<CR>",
            { desc = "CellularAutomaton: Make it Rain" })
        vim.keymap.set("n", "<leader>WTF", "<cmd>CellularAutomaton game_of_life<CR>",
            { desc = "CellularAutomaton: Game of Life" })
    end,
}
