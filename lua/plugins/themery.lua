return {
    'zaldih/themery.nvim',

    config = function()
        -- Minimal config
        require("themery").setup({
            themes = {
                {
                    name = "Gruvbox",
                    colorscheme = "gruvbox",
                },
                {
                    name = "Catppuccin",
                    colorscheme = "catppuccin",
                },
            },
            livePreview = true, -- Apply theme while picking. Default to true.
        })
    end
}
