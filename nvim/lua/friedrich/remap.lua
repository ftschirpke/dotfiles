vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

vim.keymap.set({ "n", "v" }, "<leader>w", ":set wrap!<CR>", { desc = "Toggle line wrapping" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down a line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up a line" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Go half page down and center view" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Go half page up and center view" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next search result and center view" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous search result and center view" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent selection to the left, without using selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent selection to the right, without using selection" })

vim.keymap.set("x", "<leader>p", "\"_dP",
    { desc = "Pasting over selection into void buffer (without saving into paste buffer)" })
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d",
    { desc = "Deleting into void buffer (without saving into paste buffer)" })

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = "Yank to system clipboard" })

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Map Esc to Ctrl+C" })

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    { desc = "Find and replace the word the cursor is on" })

local make_toggle_inline_diagnostics = function()
    local counter = 0
    return function()
        if counter % 2 == 0 then
            vim.diagnostic.config({
                virtual_text = true,
                virtual_lines = false,
                signs = true,
                underline = true,
                severity_sort = true,
            })
        else
            vim.diagnostic.config({
                virtual_text = false,
                virtual_lines = { current_line = false },
                signs = true,
                underline = true,
                severity_sort = true,
            })
        end
        counter = counter + 1
    end
end

local toggle_inline_diagnostics = make_toggle_inline_diagnostics()
toggle_inline_diagnostics()

vim.keymap.set("n", "<leader>dl", toggle_inline_diagnostics,
    { desc = "Toggle diagnostic display between inline and virtual lines below" })
