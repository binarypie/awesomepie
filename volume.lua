local wibox     = require("wibox")
local beautiful = require("beautiful")
local awful     = require("awful")

local M = {}

M.icon = wibox.widget.imagebox()
M.icon:set_image(beautiful.widget_vol)

M.widget = wibox.widget.textbox()

function update_volume(widget)
   local fd = io.popen("amixer sget Master")
   local status = fd:read("*all")
   fd:close()

   -- local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
   local volume = string.match(status, "(%d?%d?%d)%%")
   --volume = string.format("% 3d", volume)
   status = string.match(status, "%[(o[^%]]*)%]")

   if string.find(status, "on", 1, true) then
       -- For the volume numbers
       volume = volume .. "%"
   else
       -- For the mute button
       volume = volume .. "M"
   end
   widget:set_markup(volume)
end

update_volume(M.widget)

mytimer = timer({ timeout = 0.2 })
mytimer:connect_signal("timeout", function () update_volume(M.widget) end)
mytimer:start()

return M
