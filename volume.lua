local wibox     = require("wibox")
local beautiful = require("beautiful")
local vicious   = require("vicious")
local awful     = require("awful")

local M = {}

M.icon = wibox.widget.imagebox()
M.icon:set_image(beautiful.widget_vol)

M.widget = wibox.widget.textbox()
vicious.register(M.widget, vicious.widgets.volume, "<span>$1%</span>", 1, "Master" )
M.widget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.util.spawn("amixer -q sset Master toggle", false) end)
))
vicious.cache(M.widget)

return M
