include 'glayout/glayout.lua'

-- Setup our new grid
local grid = Grid:Create()

    -- Declare our sizing & positioning for our new grid
    grid:SetSize( ScrW(), ScrH() / 3 )
    grid:SetPos( 0, ScrH() * 0.75 )

    -- Declare the number of columns we'd like to use (DEFAULT: 12)
    grid:SetColumnCount( 12 )


-- Create a row within our grid
local row = grid:CreateRow()

-- Create Table of columns
local cols = {}


-- Create a column within our row
cols[1] = row:CreateCol( 3 )
cols[1]:SetHeight( ScrH() / 4 )
cols[1]:SetMargin( {16} )

-- Draw everything we want to draw within this column
cols[1].Draw = function( self )

    draw.RoundedBox( 0, self.x, self.y, self.width, self.height, Color( 0, 0, 0, 200 ) )
end


-- Create a column within our row
cols[2] = row:CreateCol( 3 )
cols[2]:SetHeight( ScrH() / 4 )
cols[2]:SetMargin( {16} )
cols[2]:Shift( 9 )

-- Draw everything we want to draw within this column
cols[2].Draw = function( self )

    draw.RoundedBox( 0, self.x, self.y, self.width, self.height, Color( 0, 0, 0, 200 ) )
end



-- Simple HUDPaint Function
function HUDPaint_custom()

    -- Draw our new grid
    grid:Draw()
end

-- Hook custom function into HUDPaint
hook.Add( 'HUDPaint', 'HUDPaint_custom', HUDPaint_custom )