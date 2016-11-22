--[[
    Name: GLayout
    Repository: https://github.com/TBPixel/glayout
    Description: Tools for building HUD Layouts
    place this file in your load as both an AddCSLuaFile
    & an include
    Author: Tony "TBPixel" Barry
    Author_Git: https://github.com/TBPixel
]]--

-- Server Load Scripts
AddCSLuaFile( 'glayout/glayout/Helpers.lua' )
AddCSLuaFile( 'glayout/glayout/Calculations.lua' )
AddCSLuaFile( 'glayout/glayout/Base.lua' )
AddCSLuaFile( 'glayout/glayout/Grid.lua' )
AddCSLuaFile( 'glayout/glayout/Column.lua' )

-- Client Load Scripts --
include( 'glayout/glayout/Helpers.lua' )
include( 'glayout/glayout/Calculations.lua' )
include( 'glayout/glayout/Base.lua' )
include( 'glayout/glayout/Grid.lua' )
include( 'glayout/glayout/Column.lua' )