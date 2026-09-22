-- A list of parser names (the five listed parsers should always be installed)
local ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query", "cpp", "python", "rust",
    "gdscript", "godot_resource", "gdshader",
}

-- The `main` branch of nvim-treesitter (required for Neovim >= 0.12) only manages
-- parser installation; highlighting is enabled per buffer via `vim.treesitter.start`.
-- Requires the `tree-sitter-cli` package to compile parsers.
local treesitter_config = function()
    local ts = require("nvim-treesitter")
    ts.install(ensure_installed)

    -- Automatically install missing parsers when entering a buffer, then enable highlighting
    vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
            local lang = vim.treesitter.language.get_lang(args.match)
            if not lang or not vim.tbl_contains(ts.get_available(), lang) then
                return
            end
            ts.install(lang):await(function()
                pcall(vim.treesitter.start, args.buf, lang)
            end)
        end,
    })
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = treesitter_config,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("treesitter-context").setup({})
        end,
    },
}
