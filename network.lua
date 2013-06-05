local wibox     = require("wibox")
local beautiful = require("beautiful")
local vicious   = require("vicious")

local M = {}

M.downicon = wibox.widget.imagebox()
M.downicon:set_image(beautiful.widget_netdown)

M.upicon = wibox.widget.imagebox()
M.upicon:set_image(beautiful.widget_netup)

M.downwidget = wibox.widget.textbox()
vicious.register(M.downwidget, function(format, warg)
    local args = vicious.widgets.net(format, warg)
    local down  = 0
    for key,value in pairs(args) do
        if string.find(key, 'down_kb') ~= nil then
            down = down + args[key]
        end
    end
    args['{down}'] = string.format("%.2fk", down)
    return args
end, "<span>${down}</span>", 1)
vicious.cache(M.downwidget)

M.upwidget = wibox.widget.textbox()
vicious.register(M.upwidget, function(format, warg)
    local args = vicious.widgets.net(format, warg)
    local up  = 0
    for key,value in pairs(args) do
        if string.find(key, 'up_kb') ~= nil then
            up = up + args[key]
        end
    end
    args['{up}'] = string.format("%.2fk", up)
    return args
end, "<span>${up}</span>", 1)
vicious.cache(M.upwidget)

return M
