local sbar     = require("sketchybar")
local colors   = require("colors")
local icons    = require("icons")
local settings = require("settings")

local cal      = require("items.widgets.cal")
local weather  = require("items.widgets.weather")
local media    = require("items.widgets.media")



-- Check if we're using bar-full.lua
local is_bar_full = os.getenv("BAR_CONFIG") == "bar-full"


local systray =
    sbar.add(
        "bracket",
        "systray.bracket",
        { media.name, weather.name },
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

-- Create the bracket and include the items
local clock   =
    sbar.add(
        "bracket",
        "clock.bracket",
        { cal.name },
        {
            width = "dynamic",
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
        { clock.name, systray.name },
        {
            corner_radius = 25,
            shadow = false, -- Shadow is false for bar-full.lua
            position = "right",
            align = "right",
            width = "dynamic",
            padding_left = 10,
            padding_right = 10,

            background = {
                padding_left = settings.group_paddings,
                padding_right = settings.group_paddings,
                color = colors.transparent
            },


        }
    )


return right_bar
