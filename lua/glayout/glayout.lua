--[[
	Name: GLayout
	Author: Tony "TBPixel" Barry
	Author_Git: https://github.com/TBPixel
	Description: Tools for building HUD Layouts
	Repository:
]]--

if SERVER then

	-- Server Load Scripts --
	AddCSLuaFile 'grids/Base.lua'
    AddCSLuaFile 'grids/Grid.lua'
    AddCSLuaFile 'grids/Row.lua'
    AddCSLuaFile 'grids/Column.lua'
else

	-- Client Load Scripts --
	include 'grids/Base.lua'
	include 'grids/Grid.lua'
	include 'grids/Row.lua'
	include 'grids/Column.lua'
end