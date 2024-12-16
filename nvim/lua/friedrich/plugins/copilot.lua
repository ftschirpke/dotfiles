local copilot_toggle = function()
    vim.b.copilot_enabled = not vim.b.copilot_enabled
    if vim.b.copilot_enabled then
        print("Copilot enabled")
    else
        print("Copilot disabled")
    end
end

return {
    "github/copilot.vim",
    keys = "<leader>ä", -- keymap to activate the copilot plugin
    config = function()
        vim.g.copilot_filetypes = {
            ['*'] = false,
        }
        -- as soon as the plugin is loaded, the keymap toggles the plugin
        vim.keymap.set("n", "<leader>ä", copilot_toggle, { desc = "Toggle GitHub Copilot" })
    end,
}
