local awful     = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

local M = {}

local terminal = "urxvt"

local awesomeMenu = {
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

local mainMenu = awful.menu({
    items = { 
        { "settings", awesomeMenu },
        { "chromium", "chromium" },
        { "spacefm", "spacefm"},
        { "shotwell", "shotwell"},
        { "ncmpcpp", terminal.." -e ncmpcpp"},
        { "irssi", terminal.." -e irssi"},
        { "terminal", terminal }
    }
})

M.launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mainMenu
})

menubar.utils.terminal = terminal -- Set the terminal for applications that require it

return M
