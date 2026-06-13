local sbar = require("sketchybar")
local colors = require("colors")
local settings = require("settings")



local spaces = require("items.widgets.spaces")




-- Create the bracket and include the items
local center_bar = sbar.add(
    "bracket",
    "center_bar.bracket",
    { spaces.name },
    {
        shadow = false, -- Shadow is false for bar-full.lua
        position = "center",
        align = "center",
        width = "dynamic",
        background = {
            padding_left = 10,
            padding_right = 10,
            corner_radius = 12,
            height = 28,
            color = colors.transparent
        },
    }
)



return center_bar
