local sbar = require("sketchybar")
local colors = require("colors")
local settings = require("settings")


local menu_watcher = require("items.widgets.menus")



-- Create the bracket and include the items
local left_bar = sbar.add(
    "bracket",
    "left_bar.bracket",
    { menu_watcher.name },
    {
        shadow = false, -- Shadow is false for bar-full.lua
        width = "dynamic",
        position = "left",
        background = {
            padding_left = settings.group_paddings,
            padding_right = settings.group_paddings,
            color = colors.transparent,
            corner_radius = 12,
            height = 28
        },

    }
)

return left_bar
