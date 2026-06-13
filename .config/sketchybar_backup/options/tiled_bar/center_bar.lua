local sbar = require("sketchybar")
local colors = require("colors")
local settings = require("settings")



local spaces = require("items.widgets.spaces")

-- Check if we're using bar-full.lua
local is_bar_full = os.getenv("BAR_CONFIG") == "bar-full"

-- Create the bracket and include the items
local center_bar = sbar.add(
    "bracket",
    "center_bar.bracket",
    { spaces.name, },
    {
        shadow = false,
        position = "center",
        width = "dynamic",
        background = {
            padding_left  = 10,
            padding_right = 10,
            corner_radius = 15,
            color         = colors.bar.accent_transparent,

        },
    }
)



return center_bar
