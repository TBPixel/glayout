-----------------------------------
--   Our HUD Callable function   --
-----------------------------------
function DrawHUD()

    -- Create our new grid
    local grid  = Grid:Create(
    {
        -- Position
        pos         =
        {
            x       = 0,
            y       = ScrH() - ( ScrH() / 10 )
        },
        -- Width
        size        =
        {
            width   = ScrW(),
        },
        -- Margins
        margin      =
        {
            right   = 20,
            bottom  = 20,
            left    = 20
        },
    })

    -- Initialize Our Grid
    grid:Init()


    -- Create Columns
    local col = {}

    -- Set Column Styles
    local colStyles =
    {
        span        = 6,
        size        =
        {
            height      = ScrH() / 10,
        },
    }


    -- Create First Column
    col[1] = grid:CreateCol( colStyles )

        -- Set Margin-Right for this column only
        col[1]:SetMarginRight( 10 )

    -- Initialize Our Column
    col[1]:Init()


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
    col[2] = grid:CreateCol( colStyles )

        -- Set Margin-Left for this column only
        col[2]:SetMarginLeft( 10 )

    -- Initialize Our Column
    col[2]:Init()

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