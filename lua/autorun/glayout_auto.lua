if SERVER then

    AddCSLuaFile 'cl_init.lua'
elseif CLIENT then
    
    include 'cl_init.lua'
end