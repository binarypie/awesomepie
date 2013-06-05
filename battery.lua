local wibox     = require("wibox")
local beautiful = require("beautiful")
local vicious   = require("vicious")

local M = {}

M.icon = wibox.widget.imagebox()
M.widget = wibox.widget.textbox()

vicious.register(M.widget, function(format, warg)
    local args = vicious.widgets.bat(format, warg)

        if args[2] < 25 then
            M.icon:set_image(beautiful.widget_batt_empty)
        elseif args[2] < 50 then
            M.icon:set_image(beautiful.widget_batt_low)
        elseif args[2] < 100 then
            M.icon:set_image(beautiful.widget_batt)
        else
            M.icon:set_image(beautiful.widget_batt_full)
        end

    return args
end, '<span>$2%</span>', 10, 'BAT0')

vicious.cache(M.widget)

return M
