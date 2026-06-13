local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Function to get the appropriate weather icon
local function get_weather_icon(condition)
    local icon_map = {
        ["clear"] = icons.weather.sun,
        ["cloudy"] = icons.weather.cloud,
        ["partly cloudy"] = icons.weather.cloud_sun,
        ["rain"] = icons.weather.rain,
        ["rain shower"] = icons.weather.rain,
        ["snow"] = icons.weather.snowflake,
        ["thunderstorm"] = icons.weather.bolt,
        ["mist"] = icons.weather.fog,
        ["fog"] = icons.weather.fog,
        ["drizzle"] = icons.weather.cloud_rain,
    }

    for key, icon in pairs(icon_map) do
        if string.find(condition:lower(), key) then
            return icon
        end
    end
    return icons.question -- Default if no match
end


-- Add weather widget to SketchyBar
local weather = sbar.add("item", "widgets.weather", {

    position = "right",
    align = "center",
    display = 1,
    icon = {
        color = colors.white,
        string = icons.weather.cloud_sun,

    },                                                                                                                                                         -- Default icon
    label = { style = settings.font.style_map["Bold"], size = 16, color = colors.white, background = { height = 20, }, padding_left = 5, padding_right = 10 }, -- Hide temperature by default
})

-- Function to update weather widget
local function update_weather()
    sbar.exec("curl -s 'wttr.in/Nuremberg?format=%C+%t' ", function(output)
        local condition, temperature = output:match("([^%s]+) (.+)")
        if condition and temperature then
            local weather_icon = get_weather_icon(condition)
            weather:set({
                label = { size = 1, },
                icon = { string = weather_icon },
                -- Keep temperature hidden initially
            })

            -- Store temperature for later use
            weather.temperature = temperature
        else
            weather:set({ label = "N/A", icon = { string = icons.question } })
        end
    end)
end

update_weather()

-- Show temperature on mouse enter with delay
weather:subscribe("mouse.entered", function()
    sbar.animate("elastic", 15, function()
        sbar.delay(0.4, function() -- 0.3s delay before showing
            if weather.temperature then
                weather:set({
                    icon = {
                        color = colors.white,
                    },
                    label = { style = settings.font.style_map["Bold"], size = 16, string = weather.temperature, padding_left = 5 },
                    background = { color = colors.transparent },
                })
            end
        end)
    end)
end)

-- Hide temperature on mouse exit with delay
weather:subscribe("mouse.exited", function()
    sbar.animate("elastic", 15, function()
        sbar.delay(0.3, function() -- 0.3s delay before hiding
            weather:set({
                icon = {
                    color = colors.white,
                },
                background = { color = colors.transparent },
                label = { style = settings.font.style_map["Bold"], size = 16, string = weather.temperature, padding_left = 5, padding_right = 10 },
            })
        end)
    end)
end)

return weather
