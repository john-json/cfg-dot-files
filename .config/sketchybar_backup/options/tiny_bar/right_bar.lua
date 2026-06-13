local sbar     = require("sketchybar")
local colors   = require("colors")
local icons    = require("icons")
local settings = require("settings")

local cal      = require("items.widgets.cal")
local weather  = require("items.widgets.weather")
local media    = require("items.widgets.media")



local systray =
    sbar.add(
        "bracket",
        "systray.bracket",
        { weather.name, cal.name },
        {

            display = 1,
            width = "dynamic",
            icon = {
                padding_left = 10,
                padding_right = 10,

            },
            background = {
                padding_left = settings.group_paddings,
                padding_right = settings.group_paddings,
                color = colors.transparent,
            },
        }
    )


local right_bar =
    sbar.add(
        "bracket",
        "right_bar.bracket",
        { systray.name, media.name, cal.name },
        {

            shadow = false, -- Shadow is false for bar-full.lua
            position = "right",
            align = "right",
            width = "dynamic",
            icon = {
                color = colors.bar.bg,
            },
            background = {
                padding_left = settings.group_paddings,
                padding_right = settings.group_paddings,
                color = colors.transparent,
                corner_radius = 25,
                height = 28
            },


        }
    )


return right_bar
