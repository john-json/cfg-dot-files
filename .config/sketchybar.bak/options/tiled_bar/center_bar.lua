local sbar = require("sketchybar")
local colors = require("colors")
local settings = require("settings")


local front_app = require("items.widgets.front_app")


-- Check if we're using bar-full.lua
local is_bar_full = os.getenv("BAR_CONFIG") == "bar-full"

-- Create the bracket and include the items
local center_bar = sbar.add(
    "bracket",
    "center_bar.bracket",
    { front_app.name, },
    {
        shadow = false,
        corner_radius = 25,
        position = "center",
        width = "dynamic",
        background = {
            padding_left = 10,
            padding_right = 10,
            corner_radius = 25,
            color = colors.bar.bg2
        },
    }
)



return center_bar
