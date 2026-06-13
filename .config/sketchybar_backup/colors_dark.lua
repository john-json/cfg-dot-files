return {
    yellow = 0xffdcaf6c,
    green = 0xff98a8a9,
    red = 0xffc6755b,
    blue = 0xffa2aab9,
    darkblue = 0xff6275a1,
    purple = 0xff6a6378,
    monotone = 0xff98a8a9,
    orange = 0xffd09367,
    quicksilver = 0xffb2b2b2,
    pink = 0xff725955,
    magenta = 0xff595066,

    primary = 0xffffffff,
    secondary = 0xff232323,

    black = 0xff000000,
    white = 0xffffffff,
    grey = 0xff5a5959,

    transparent = 0x00000000,
    semi_transparent = 0x40ffffff,
    border_transparent = 0x33ffffff,

    icon = {
        grey = 0xffcdcdcd,
        primary = 0xff5d5d5d,
        secondary = 0xff191919,
    },
    bar = {
        bg = 0xff2a2a2a,
        bg2 = 0xff1c1c1c,
        bg_transparent = 0x4d000000,
        accent = 0xffffffff,
        accent_transparent = 0x00ffffff,
        active = 0xff9eaeb3,
        selected = 0xff593c3c,
        transparent = 0xe51e1e1e,
        border = 0x4dffffff,
        secondary = 0xff383838,
        white_transparent = 0x0dffffff,
        inactive = 0xff2d2e2f,
        icons = 0xff61817f,
        foreground = 0xffd3d3d3,
        foreground_hover = 0xff828282,
    },
    media = {
        primary = 0xcc212121,
        secondary = 0xffffffff,
    },
    popup = {
        text = 0xffcccccc,
        bg = 0x991c1c1c,
        bg_alt = 0xff2a2a2a,
        icons = 0xffa0a0a0,
        border = 0xff4d4f4f,
        buttons = 0xff959697,
        blur_radius = 60,
        with_alpha = function(color, alpha)
            if alpha > 1.0 or alpha < 0.0 then return color end
            return (color and 0x001e1e1e) or (math.floor(alpha * 255.0) < 24)
        end
    }
}
