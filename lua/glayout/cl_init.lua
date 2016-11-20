-----------------------------------
--   HUD Callable function   --
-----------------------------------

function DrawHUD()


    -- Stores player in local variable
    local ply = LocalPlayer()
    -- Get local hp as decimal value of Player Health / Player Max Health
    local hp = ( ply:Health() / ply:GetMaxHealth() )


    -- Create a new grid
    local grid  = Grid:Create(
    {
        -- Position
        pos         =
        {
            x       = 0,
            y       = ScrH()
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

        -- Draw to our grid
        grid.Draw = function( self )

            draw.RoundedBox( 0, self.x, self.y, self.width, self.height, Color( 0, 0, 0, 200 ) )
        end

    -- Initialize Grid
    grid:Init()


    -- Contains columns as an array
    local col = {}

    -- Set Column Styles
    local colStyles =
    {
        -- Columns to span
        span        = 6,
        -- Size of column
        size        =
        {
            -- Height of column
            height      = ScrH() / 10,
        },
    }


    -- Create First Column
    col[1] = grid:CreateCol( colStyles )

        -- Set Margin-Right for this column only
        col[1]:SetMarginRight( 10 )

        -- Draw what you want inside the column
        col[1].Draw = function( self )

            -- Linear Interpolation on Health Bar
            hp = Lerp( 10 * FrameTime(), hp, ply:Health() / ply:GetMaxHealth() )

            -- Draw healthbar at column starting position, width * hp & column height
            -- Give it a faded red colour
            draw.RoundedBox( 0, self.x, self.y, self.width * hp, self.height, Color( 255, 60, 60, 200 ) )
        end

    -- Initialize Column
    col[1]:Init()


    -- Create First Column
    col[2] = grid:CreateCol( colStyles )

        -- Set Margin-Right for this column only
        col[2]:SetMarginLeft( 10 )

        -- Draw what you want inside the column
        col[2].Draw = function( self )

            -- Give it a faded black colour
            draw.RoundedBox( 0, self.x, self.y, self.width, self.height, Color( 255, 255, 255, 200 ) )
        end

    -- Initialize Column
    col[2]:Init()


    -- Updates Y Position of Grid & all child columns automatically
    grid:AutoUpdateY()


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