local colors = require("colors")
local settings = require("settings")
local sbar = require("sketchybar")

-- Load the bar with widgets in the correct position first
sbar.bar({
    alpha = 0,
    y_offset = -50, -- Start off-screen
    position = "top",
    height = 22,
    padding_right = 5,
    padding_left = 5,
    color = colors.transparent,
    border_width = 0,
    border_color = colors.bar.border,
    margin = 20,
    corner_radius = 12,
    shadow = false,
    blur_radius = 0,
})


-- Animate with a smooth rubber band effect
sbar.animate("sin", 15, function()
    local start_pos = -70
    local overshoot = 15 -- Drop below before bouncing up
    local final_pos = 8

    -- Move from start -> overshoot -> final position
    sbar.bar({ y_offset = final_pos + overshoot })

    -- Bounce back up to final position
    sbar.animate("sin", 15, function()
        sbar.bar({ y_offset = final_pos, alpha = 1 })
    end)
end)
