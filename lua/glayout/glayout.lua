--[[
    Name: GLayout
    Author: Tony "TBPixel" Barry
    Author_Git: https://github.com/TBPixel
    Description: Tools for building HUD Layouts
    place this file in your load as both an AddCSLuaFile
    & an include
    Repository: https://github.com/TBPixel/glayout
]]--

-- Server Load Scripts
AddCSLuaFile( 'glayout/grids/Calculations.lua' )
AddCSLuaFile( 'glayout/grids/Base.lua' )
AddCSLuaFile( 'glayout/grids/Grid.lua' )
AddCSLuaFile( 'glayout/grids/Row.lua' )
AddCSLuaFile( 'glayout/grids/Column.lua' )

-- Client Load Scripts --
include( 'glayout/grids/Calculations.lua' )
include( 'glayout/grids/Base.lua' )
include( 'glayout/grids/Grid.lua' )
include( 'glayout/grids/Row.lua' )
include( 'glayout/grids/Column.lua' )