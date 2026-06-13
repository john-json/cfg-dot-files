return {
    paddings = 5,
    group_paddings = 10,
    height = 18,                -- Height of the bar
    corner_radius = 15,         -- Corner radius for the bar
    border_width = 1,           -- Border width for the bar
    bordwer_color = 0xffcccccc, -- Border color for the bar

    icons = "sf-symbols",       -- Options: "sf-symbols", "nerdfont"
    animated_icons = false,     -- Set to true if you want to use animated icons

    font = {
        text = "Operator Mono Nerd Font",    -- Used for text
        numbers = "Operator Mono Nerd Font", -- Used for numbers
        icons = "sf-symbols",                -- Used for icons (or NerdFont)
        style_map = {
            ["Regular"] = "Regular",
            ["Semibold"] = "Medium",
            ["Bold"] = "semiBold",
            ["Heavy"] = "Bold",
            ["Black"] = "ExtraBold"
        }
    }
}
