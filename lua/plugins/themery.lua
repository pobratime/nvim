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
                {
                    name = "Kanagawa",
                    colorscheme = "kanagawa",
                },
                {
                    name = 'Aura',
                    colorscheme = 'aura-theme',
                },
            },
            livePreview = true, -- Apply theme while picking. Default to true.
        })
    end
}
