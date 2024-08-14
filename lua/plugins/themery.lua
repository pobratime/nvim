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
                    name = 'Tokyonight',
                    colorscheme = 'tokyonight',
                },
                {
                    name = 'Aura',
                    colorscheme = 'aura',
                },
            },
            livePreview = true, -- Apply theme while picking. Default to true.
        })
    end
}
