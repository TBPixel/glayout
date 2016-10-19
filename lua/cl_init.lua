include 'glayout/glayout.lua'

-- Setup our new grid
local grid = Grid:Create()

    -- Declare our sizing & positioning for our new grid
    grid:SetSize( ScrW(), ScrH() / 3 )
    grid:SetPos( 0, ScrH() * 0.667 )

    -- Declare the number of columns we'd like to use (DEFAULT: 3)
    grid:SetColumnCount( 12 )


-- Create a row within our grid
local row = grid:CreateRow()

-- Create a column within our row
local column = row:CreateCol( 6 )
column:SetHeight( ScrH() / 3 )

function column:Draw()

    draw.RoundedBox( 0, self.x, self.y, self.width, self.height, Color( 0, 0, 0, 100 ) )
end


function HUDPaint_custom()

    -- Draw our new grid
    grid:Draw()
end

hook.Add( 'HUDPaint', 'HUDPaint_custom', HUDPaint_custom )