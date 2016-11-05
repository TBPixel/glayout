--[[
    Name: GLayout
    Author: Tony "TBPixel" Barry
    Author_Git: https://github.com/TBPixel
    Description: Tools for building HUD Layouts
    Repository: https://github.com/TBPixel/glayout
]]--

if SERVER then

    -- Server Load Scripts --
    AddCSLuaFile 'grids/Calculations.lua'
    AddCSLuaFile 'grids/Base.lua'
    AddCSLuaFile 'grids/Grid.lua'
    AddCSLuaFile 'grids/Row.lua'
    AddCSLuaFile 'grids/Column.lua'
else

    -- Client Load Scripts --
    include 'grids/Calculations.lua'
    include 'grids/Base.lua'
    include 'grids/Grid.lua'
    include 'grids/Row.lua'
    include 'grids/Column.lua'
end