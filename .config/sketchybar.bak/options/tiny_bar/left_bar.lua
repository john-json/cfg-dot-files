local sbar = require("sketchybar")
local colors = require("colors")
local settings = require("settings")



-- Create the bracket and include the items
local left_bar = sbar.add(
    "bracket",
    "left_bar.bracket",
    {},
    {
        shadow = false, -- Shadow is false for bar-full.lua
        width = "dynamic",
        position = "left",
        background = {
            padding_left = settings.group_paddings,
            padding_right = settings.group_paddings,
            color = colors.bar.bg2,
            corner_radius = 25,
            height = 28
        },

    }
)

return left_bar
