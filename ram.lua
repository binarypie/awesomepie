local wibox     = require("wibox")
local beautiful = require("beautiful")
local vicious   = require("vicious")

local M = {}

M.icon = wibox.widget.imagebox()
M.icon:set_image(beautiful.widget_mem)

M.widget = wibox.widget.textbox()
vicious.register(M.widget, vicious.widgets.mem, "<span>$1%</span>", 1)
vicious.cache(M.widget)

return M
