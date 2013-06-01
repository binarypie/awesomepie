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
    { "irssi", terminal.." -e irssi" },
    { "ranger", terminal.." -e ranger" },
    { "speedcrunch", "speedcrunch" },
    { "awesome", awesomeMenu }
}

local browserMenu = {
    { "chrome", "google-chrome" },
    { "chromium", "chromium" },
    { "firefox", "firefox" }
}

local graphicMenu = {
    { "darktable", "darktable" },
    { "gimp", "gimp" },
    { "inkskape", "inkscape" },
}

local gameMenu = {
    { "minecraft", "java -jar /home/binarypie/bin/minecraft/TechnicLauncher.jar" },
    { "steam", "steam" }
}

local mediaMenu = {
    { "mplayer2", terminal.." -e mplayer2" },
    { "ncmpcpp", terminal.." -e ncmpcpp" },
    { "google music", "google-musicmanager" }
}

local mainMenu = awful.menu({
    items = { 
        { "Terminal", terminal },
        { "Browsers", browserMenu },
        { "Games", gameMenu },
        { "Graphics", graphicMenu },
        { "Media", mediaMenu },
        { "Util", utilMenu }
    }
})

M.launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mainMenu
})

menubar.utils.terminal = terminal -- Set the terminal for applications that require it

return M
