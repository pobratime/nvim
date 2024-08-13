return {
    'zaldih/themery.nvim',

    config = function()
        require("themery").setup({
            themes = {
                {
                    name = "Gruvbox",
                    colorscheme = "gruvbox",
                },
                {
                    name = "Catppuccin",
                    colorscheme = "catppuccin",
                }
            },
            livePreview = true,
        })
    end
}
