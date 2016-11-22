-- GLayout must be BOTH AddCSLuaFile'd & Included to work
AddCSLuaFile( 'glayout.lua' ) -- GLayout.lua loads it's indiviudal files for you so you don't have to
include( 'glayout.lua' ) -- Thus why it requires a server include alongside an AddCSLuaFile

-- Demo cl_init.lua file
AddCSLuaFile( 'cl_init.lua' )