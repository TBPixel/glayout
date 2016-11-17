-----------------------------------
--   Our HUD Callable function   --
-----------------------------------
function DrawHUD()

    -- Create our new grid
    local grid = Grid:Create()

        -- Declare Sizing & Positioning of Grid
        grid:SetStartSize( ScrW(), ScrH() / 10 )
        grid:SetStartPos( 0, ScrH() - ( ScrH() / 10 ) )


    -- Create a grid row
    local row = grid:CreateRow()
        -- Sets Margins for Row in order: Top, Right, Bottom, Left
        row:SetMargin( {0, 20, 20, 20} )


    -- Create Columns
    local col = {}

    -- Create First Column
    col[1] = row:CreateCol( 3 )

    -- Sets Margin Right for column
    col[1]:SetMarginRight( 10 )


    -- Stores player in local variable
    local ply = LocalPlayer()
    local hp = ( ply:Health() / ply:GetMaxHealth() )

    -- Draw what you want inside the column
    col[1].Draw = function( self )

        -- Linear Interpolation on Health Bar
        hp = Lerp( 10 * FrameTime(), hp, ply:Health() / ply:GetMaxHealth() )

        draw.RoundedBox( 0, self.x, self.y, self.width * hp, self.height, Color( 255, 60, 60, 200 ) )
    end


    -- Create Second Column
    col[2] = row:CreateCol( 3 )
    col[2]:Shift( 6 )

    -- Sets Margin Left for column
    col[2]:SetMarginLeft( 10 )

    -- Draw what you want inside the column
    col[2].Draw = function( self )

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



----------------------------------
--   HUD Function Should Call   --
----------------------------------

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