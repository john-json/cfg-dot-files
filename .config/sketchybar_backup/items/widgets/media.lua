-- path: miniplayer.lua

local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local whitelist = {
    ["Spotify"] = true
}

local PADDING = 5
local HEIGHT = 80
local HEIGHT_BEFORE = 0

-- Debug logger using io.open
local function log_debug(msg)
    local file = io.open("/tmp/sketchybar_debug.log", "a")
    if file then
        file:write(msg .. "\n")
        file:close()
    end
end

local function setup_media_items()
    local media_artist = sbar.add("item", {
        position = "left",
        align = "left",
        padding_left = 10,
        label = {
            y_offset = 0,
            align = "left",
            position = "left",
            color = colors.red,
            max_chars = 20,
            font = { size = 14 },
        },
        drawing = false,
    })

    local media_title = sbar.add("item", {
        position = "left",
        padding_left = 5,
        label = {
            align = "left",
            position = "left",
            max_chars = 20,
            color = colors.white,
            font = { size = 14 },
        },
        drawing = false,
    })

    local media_icon = sbar.add("item", {
        position = "right",
        display = 1,
        background = {
            padding_left = PADDING,
            border_width = 0,
            border_color = colors.bar.border,
            width = "dynamic",
        },
        align = "right",
        label = {
            padding_left = settings.paddings,
            padding_right = settings.paddings,
            drawing = true,
            color = colors.bar.accent,
        },
        icon = {
            padding_left = 10,
            padding_right = 15,
            drawing = true,
            string = icons.media.icon,
            color = colors.bar.accent,
            font = { size = 16 },
        },
        drawing = true,
        updates = true,
    })

    local media_cover = sbar.add("item", {
        position = "right",
        background = {
            padding_left = 10,
            padding_right = 5,
            image = {
                margin = 20,
                string = "media.artwork",
                scale = 2,
            },
            height = HEIGHT,
        },
        drawing = true,
        updates = true,
    })

    return media_icon, media_cover, media_artist, media_title
end

local media_icon, media_cover, media_artist, media_title = setup_media_items()

local controls = {}
local function create_controls()
    local control_items = {
        { icon = icons.media.forward,    action = "nowplaying-cli next" },
        { icon = icons.media.play_pause, action = "nowplaying-cli togglePlayPause" },
        { icon = icons.media.back,       action = "nowplaying-cli previous" },
    }

    for _, control in ipairs(control_items) do
        local control_item = sbar.add("item", {
            display = 1,
            padding_right = 0,
            padding_left = 10,
            align = "right",
            position = "right",
            width = 0,
            background = {
                padding_left = 10,
                padding_right = 10,
                color = colors.transparent,
                height = 22,
                border_width = 0,
            },
            icon = {
                align = "center",
                position = "right",
                color = colors.primary,
                string = control.icon,
                font = { size = 12 },
            },
            click_script = control.action,
            drawing = false,
        })
        table.insert(controls, control_item)
    end
end

create_controls()

local controls_visible = true
local function toggle_controls()
    controls_visible = controls_visible
    for _, control in ipairs(controls) do
        sbar.animate("elastic", 15, function()
            control:set({ drawing = controls_visible, width = 35, padding_right = 5, padding_left = 5 })
        end)
    end
end

media_icon:subscribe("media_change", function(env)
    log_debug("🔄 Media change: app=" .. tostring(env.INFO.app) ..
        " state=" .. tostring(env.INFO.state) ..
        " artist=" .. tostring(env.INFO.artist) ..
        " title=" .. tostring(env.INFO.title))

    if whitelist[env.INFO.app] then
        local is_playing = (env.INFO.state == "playing")
        log_debug("🎵 Playing state: " .. tostring(is_playing))

        media_cover:set({ drawing = is_playing })
        media_artist:set({ drawing = is_playing, label = { string = env.INFO.artist or "?" } })
        media_title:set({ drawing = is_playing, label = { string = env.INFO.title or "?" } })

        if is_playing then
            sbar.animate("elastic", 15, function()
                media_artist:set({ drawing = true, label = { string = env.INFO.artist or "?" } })
                media_title:set({ drawing = true, label = { string = env.INFO.title or "?" } })
            end)
            sbar.animate("elastic", 15, function()
                toggle_controls()
            end)
        end
    end
end)



return media_icon
