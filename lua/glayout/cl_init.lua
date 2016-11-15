function DrawHUD()

    -- Setup our new grid
    local grid = Grid:Create()

        -- Declare our sizing & positioning for our new grid
        grid:SetSize( ScrW(), ScrH() / 12 )
        grid:SetPos( 0, ScrH() - ( ScrH() / 12 ) )

        -- Declare the number of columns we'd like to use (DEFAULT: 12)
        grid:SetColumnCount( 12 )


    -- Create a row within our grid
    local row = grid:CreateRow()
        row:SetMargin( { 0, 0, 16, 16 } )


    -- Stores player in local variable
    local ply = LocalPlayer()
    local hp = ( ply:Health() / ply:GetMaxHealth() )


    -- Create Table of columns
    local cols = {}


    -- Create a column within our row
    cols[1] = row:CreateCol( 3 )

    -- Draw everything we want to draw within this column
    cols[1].Draw = function( self )

        -- Linear Interpolation on Health Bar
        hp = Lerp( 10 * FrameTime(), hp, ply:Health() / ply:GetMaxHealth() )

        -- Draw Health Bar
        draw.RoundedBox( 0, self.x, self.y, self.width * hp, self.height, Color( 255, 60, 60, 200 ) )
    end


    -- Create a column within our row
    cols[2] = row:CreateCol( 3 )
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
end


-- Draws HUD if LocalPlayer() is valid -- Used mainly for Lua Auto Refresh
if IsValid( LocalPlayer() ) then DrawHUD() end

-- Draws HUD if InitPostEntity runs
hook.Add( 'InitPostEntity', 'PlayerIsValid', DrawHUD )


--------------------------------------
--   REMOVES DEFAULT HUD ELEMENTS   --
--------------------------------------

-- List of Removable HUD Elements
local DefaultHUD = { 'CHudHealth', 'CHudBattery', 'CHudAmmo', 'CHudSecondaryAmmo', 'CHudDamageIndicator' }

-- Remove Default HUD
local function HideDefaultHUD ( name )
  -- Loop Over Removeable HUD Elements
  for _, v in ipairs( DefaultHUD ) do
    if name == v then return false end
  end
end
hook.Add ( 'HUDShouldDraw', 'HideDefaultHUD', HideDefaultHUD )