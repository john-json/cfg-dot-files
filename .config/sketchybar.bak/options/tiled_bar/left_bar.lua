local sbar = require("sketchybar")
local colors = require("colors")
local settings = require("settings")

local spaces = require("items.widgets.spaces")
local add_space = require("items.widgets.add_space")


-- Check if we're using bar-full.lua
local is_bar_full = os.getenv("BAR_CONFIG") == "bar-full"
-- Create the bracket and include the items
local left_bar = sbar.add(
    "bracket",
    "left_bar.bracket",
    { spaces.name },
    {
        shadow = false,
        corner_radius = 12,
        width = "dynamic",
        position = "left",
        background = {
            padding_left = settings.group_paddings,
            padding_right = settings.group_paddings,
            color = colors.bar.bg2,

        },

    }
)

return left_bar
