local copilot_toggle = function()
    local copilot_status = vim.api.nvim_exec("Copilot status", true)
    if copilot_status.find(copilot_status, "Enabled") then
        copilot_status = vim.api.nvim_exec("Copilot disable", true)
    elseif copilot_status.find(copilot_status, "Disabled") then
        copilot_status = vim.api.nvim_exec("Copilot enable", true)
    else
        print("Copilot status unknown: \"" .. copilot_status .. "\"")
        return
    end
    copilot_status = vim.api.nvim_exec("Copilot status", true)
    print(copilot_status)
end

return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_filetypes = {
            tex = false,
            latex = false,
            plaintex = false,
        }
        vim.keymap.set("n", "<leader>ä", copilot_toggle)
    end,
}
