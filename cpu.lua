local wibox     = require("wibox")
local beautiful = require("beautiful")
local vicious   = require("vicious")

local M = {}

M.icon = wibox.widget.imagebox()
M.icon:set_image(beautiful.widget_cpu)

M.widget = wibox.widget.textbox()
vicious.register(M.widget, vicious.widgets.cpu, "<span>$1%</span>", 3)
vicious.cache(M.widget)

return M
