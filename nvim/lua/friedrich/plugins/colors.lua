-- use ":source $VIMRUNTIME/syntax/hitest.vim" to see the highlight groups

return {
    "ftschirpke/neovim-ayu",
    config = function()
        require("ayu").setup({ mirage = false })
        vim.cmd [[colorscheme ayu-dark]]
        vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#1B2733" })
    end,
}
