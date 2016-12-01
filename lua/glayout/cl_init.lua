-- Testing & Development cl_init.lua

function DrawHUD()

    -- Stores player in local variable
    local ply = LocalPlayer()
    -- Get local hp as decimal value of Player Health / Player Max Health
    local hp = ( ply:Health() / ply:GetMaxHealth() )


    -- Create a grid
    local grid  = Grid:Create(
    {
        size    =
        {
            width = ScrW()
        },
        pos     =
        {
            x   = 0,
            y   = ScrH() - ( ScrH() / 8 )
        },
        margin  =
        {
            right = 20,
            bottom = 20,
            left = 20
        }
    })


    -- Store local list of all columns
    local cols      = {}

    -- Re-Usable column styles
    local colStyles =
    {
        -- Set columns to span
        span    = 3,
        -- Set Size of column
        size    =
        {
            -- Set Height of Column
            height = ScrH() / 8
        },
    }


    -- Draw First Column
    cols[1] = grid:CreateColumn( colStyles )
        cols[1].Draw = function( self )

            -- Linear Interpolation on Health Bar
            hp = Lerp( 10 * FrameTime(), hp, ply:Health() / ply:GetMaxHealth() )

            -- Draw healthbar at column starting position, width * hp & column height
            -- Give it a faded red colour
            draw.RoundedBox( 0, self:GetX(), self:GetY(), self:GetWidth() * hp, self:GetHeight(), Color( 255, 60, 60, 200 ) )
        end

    colStyles.shift = 6
    -- Draw First Column
    cols[2] = grid:CreateColumn( colStyles )
        cols[2].Draw = function( self )

            -- Give it a faded black colour
            draw.RoundedBox( 0, self:GetX(), self:GetY(), self:GetWidth(), self:GetHeight(), Color( 0, 0, 0, 200 ) )
        end


    -- Finally, Initialize the Grid
    grid:Init()


    -- Simple HUDPaint Function
    function HUDPaint_custom()

        -- Draw Columns
        grid:DrawGrid()
    end

    -- Hook custom function into HUDPaint
    hook.Add( 'HUDPaint', 'HUDPaint_custom', HUDPaint_custom )
end



----------------------------------
--   HUD Function Should Call   --
----------------------------------

-- Draws HUD if LocalPlayer() is valid -- Used mainly for Lua Auto Refresh
if IsValid( LocalPlayer() ) then DrawHUD() end

-- Ensures DrawHUD is ran when player enters the game ( LocalPlayer() will always be valid after this hook )
hook.Add( 'InitPostEntity', 'PlayerIsValid', DrawHUD )



--------------------------------------
--   REMOVES DEFAULT HUD ELEMENTS   --
--------------------------------------

-- List of Removable HUD Elements
local DefaultHUD = { 'CHudHealth', 'CHudBattery', 'CHudAmmo', 'CHudSecondaryAmmo', 'CHudDamageIndicator' }

-- Remove Default HUD
local function HideDefaultHUD( name )

    -- Loop Over Removeable HUD Elements
    for _, v in ipairs( DefaultHUD ) do

        -- Returns false if HUD element name matches element in table
        if name == v then return false end
    end
end

-- Tell HUD what not to draw
hook.Add ( 'HUDShouldDraw', 'HideDefaultHUD', HideDefaultHUD )
