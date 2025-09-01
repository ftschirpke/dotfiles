local make_autoformat_toggle = function()
    local counter = 0
    local id = 0
    return function()
        if counter % 2 == 0 then
            id = vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function(args) vim.lsp.buf.format() end,
            })
            print("Autoformat enabled")
        else
            vim.api.nvim_del_autocmd(id)
            print("Autoformat disabled")
        end
        counter = counter + 1
    end
end

local format_toggle = make_autoformat_toggle()

vim.keymap.set("n", "<leader>k", format_toggle,
    { desc = "Toggle autoformat-on-save (globally)" }
)

vim.keymap.set({ "n", "x" }, "<leader>f", function()
        vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
    end,
    { desc = "Manually format current buffer" }
)


vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

format_toggle()
