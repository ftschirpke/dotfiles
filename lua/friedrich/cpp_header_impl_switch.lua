local switch_impl_header = function()
    local fileroot = vim.fn.expand("%:r")
    local extension = vim.fn.expand("%:e")
    if (extension == "cpp") then
        vim.cmd("e " .. fileroot .. ".hpp")
    elseif (extension == "hpp") then
        vim.cmd("e " .. fileroot .. ".cpp")
    elseif (extension == "c") then
        vim.cmd("e " .. fileroot .. ".h")
    elseif (extension == "h") then
        vim.cmd("e " .. fileroot .. ".c")
    elseif (extension == "cc") then
        vim.cmd("e " .. fileroot .. ".hh")
    elseif (extension == "hh") then
        vim.cmd("e " .. fileroot .. ".cc")
    end
end

vim.keymap.set("n", "<leader>h", switch_impl_header)
