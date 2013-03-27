local awful     = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

local M = {}

local terminal = "urxvt"

local awesomeMenu = {
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

local utilMenu = {
    { "ranger", terminal.." -e ranger"},
    { "speedcrunch", "speedcrunch"},
    { "awesome", awesomeMenu}
}

local graphicMenu = {
    { "shotwell", "shotwell"},
    { "gimp", "gimp" },
    { "inkskape", "inkscape" }
}

local mediaMenu = {
    { "ncmpcpp", terminal.." -e ncmpcpp"},
    { "mplayer2", terminal.." -e mplayer2" }
}

local mainMenu = awful.menu({
    items = { 
        { "chromium", "chromium" },
        { "irssi", terminal.." -e irssi"},
        { "terminal", terminal },
        { "Graphics", graphicMenu },
        { "Media", mediaMenu},
        { "Util", utilMenu }
    }
})

M.launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mainMenu
})

menubar.utils.terminal = terminal -- Set the terminal for applications that require it

return M
