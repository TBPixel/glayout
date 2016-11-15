if SERVER then
    include( 'glayout/init.lua' )
else
    include( 'glayout/glayout.lua' )
    include( 'glayout/cl_init.lua' )
end