local switch_impl_header = function()
    local fileroot = vim.fn.expand("%:r")
    local extension = vim.fn.expand("%:e")
    if (extension == "cpp") then
        vim.cmd("e " .. fileroot .. ".hpp")
    elseif (extension == "hpp") then
        vim.cmd("e " .. fileroot .. ".cpp")
    end
end

vim.keymap.set("n", "<leader>h", switch_impl_header)
