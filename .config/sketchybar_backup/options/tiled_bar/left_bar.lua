local sbar = require("sketchybar")
local colors = require("colors")
local settings = require("settings")

local front_app = require("items.widgets.front_app")


-- Check if we're using bar-full.lua
local is_bar_full = os.getenv("BAR_CONFIG") == "bar-full"
-- Create the bracket and include the items
local left_bar = sbar.add(
    "bracket",
    "left_bar.bracket",
    { front_app.name },
    {
        shadow = false,
        corner_radius = 12,
        width = "dynamic",
        position = "left",
        background = {
            padding_left = settings.group_paddings,
            padding_right = settings.group_paddings,
            color = colors.transparent,

        },

    }
)

return left_bar
