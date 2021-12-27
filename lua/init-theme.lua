local onedarkpro = require("onedarkpro")
onedarkpro.setup({
    options = {
        cursorline = true, -- Use cursorline highlighting?
        transparency = true, -- Use a transparent background?
        terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
    },
})
onedarkpro.load()
