local wibox     = require("wibox")
local beautiful = require("beautiful")
local vicious   = require("vicious")

local M = {}

M.widget = wibox.widget.textbox()
vicious.register(M.widget, vicious.widgets.date, "%b %d %I:%M%p", 60)

return M
