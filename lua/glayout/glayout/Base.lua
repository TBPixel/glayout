---------------
-- Grid Base --
---------------
Base = {}


---------------------
-- Grid Properties --
---------------------

-- Base Margins
Base.margin = {}
    Base.margin.top         = 0
    Base.margin.right       = 0
    Base.margin.bottom      = 0
    Base.margin.left        = 0

-- Base Padding
Base.padding = {}
    Base.padding.top        = 0
    Base.padding.right      = 0
    Base.padding.bottom     = 0
    Base.padding.left       = 0

-- Base Container
Base.container = {}
    Base.container.x        = 0
    Base.container.y        = 0
    Base.container.width    = 0
    Base.container.height   = 0


-- Base Positioning
Base.x      = 0
Base.y      = 0

-- Base Size
Base.width  = 0
Base.height = 0


-----------------
-- CONSTRUCTOR --
-----------------

function Base:Create()

    -- Prepare copy of Base
    local new = table.Copy( self )
    

    -- Ensure new instance is valid
    if not IsValid( new ) then return false end


    -- Return new instance
    return new
end



----------
-- DRAW --
----------

-- Empty Draw method
-- Set by the user on grids & columns
function Base:Draw() end


-- Box Model Debugging Function
function Base:DrawDebug()

    -- Margin Settings
    local margin = {}
        margin.x        = self.container.x      - self.margin.left
        margin.y        = self.container.y      - self.margin.top
        margin.w        = self.container.width  + ( self.margin.left    + self.margin.right )
        margin.h        = self.container.height + ( self.margin.top     + self.margin.bottom )
        margin.color    = Color( 90, 215, 105, 255 )

    -- Padding Settings
    local padding = {}
        padding.x       = self.container.x
        padding.y       = self.container.y
        padding.w       = self.container.width
        padding.h       = self.container.height
        padding.color   = Color( 255, 145, 35, 255 )

    -- Box Settings
    local box = {}
        box.x           = self.x
        box.y           = self.y
        box.w           = self.width
        box.h           = self.height
        box.color       = Color( 0, 0, 0, 255 )


    local pushX             = self.margin.left
    local pushMultiplier    = 1
    -- Draw Margin
    draw.RoundedBox( 0, margin.x, margin.y, margin.w, margin.h, margin.color )

        -- Draw Margin Debug Text
        draw.DrawText( 'X: ' .. tostring( margin.x ), 'DermaDefault', margin.x + pushX * pushMultiplier, margin.y )
        pushMultiplier    = pushMultiplier + 3
        draw.DrawText( 'Y: ' .. tostring( margin.y ), 'DermaDefault', margin.x + pushX * pushMultiplier, margin.y )
        pushMultiplier    = pushMultiplier + 3
        draw.DrawText( 'W: ' .. tostring( margin.w ), 'DermaDefault', margin.x + pushX * pushMultiplier, margin.y )
        pushMultiplier    = pushMultiplier + 3
        draw.DrawText( 'H: ' .. tostring( margin.h ), 'DermaDefault', margin.x + pushX * pushMultiplier, margin.y )
        pushMultiplier    = 1
        -- END Margin Debug Text

    -- Draw Padding
    draw.RoundedBox( 0, padding.x, padding.y, padding.w, padding.h, padding.color )

        -- Draw Padding Debug Text
        pushX       = self.padding.left
        draw.DrawText( 'X: ' .. tostring( padding.x ), 'DermaDefault', padding.x + pushX * pushMultiplier, padding.y )
        pushMultiplier    = pushMultiplier + 3
        draw.DrawText( 'Y: ' .. tostring( padding.y ), 'DermaDefault', padding.x + pushX * pushMultiplier, padding.y )
        pushMultiplier    = pushMultiplier + 3
        draw.DrawText( 'W: ' .. tostring( padding.w ), 'DermaDefault', padding.x + pushX * pushMultiplier, padding.y )
        pushMultiplier    = pushMultiplier + 3
        draw.DrawText( 'H: ' .. tostring( padding.h ), 'DermaDefault', padding.x + pushX * pushMultiplier, padding.y )
        pushMultiplier    = 1
        -- END Padding Debug Text

    -- Draw Box
    draw.RoundedBox( 0, box.x, box.y, box.w, box.h, box.color )

        -- Draw Box Debug Text
        pushX       = self.padding.left
        draw.DrawText( 'X: ' .. tostring( box.x ), 'DermaDefault', box.x + pushX * pushMultiplier, box.y )
        pushMultiplier    = pushMultiplier + 3
        draw.DrawText( 'Y: ' .. tostring( box.y ), 'DermaDefault', box.x + pushX * pushMultiplier, box.y )
        pushMultiplier    = pushMultiplier + 3
        draw.DrawText( 'W: ' .. tostring( box.w ), 'DermaDefault', box.x + pushX * pushMultiplier, box.y )
        pushMultiplier    = pushMultiplier + 3
        draw.DrawText( 'H: ' .. tostring( box.h ), 'DermaDefault', box.x + pushX * pushMultiplier, box.y )
        pushMultiplier    = 1
        -- END Box Debug Text
end



-----------------
-- GET METHODS --
-----------------

--          --
-- MARGIN'S --
--          --


-- Returns all sides of Margin as numbers
function Base:GetMargin()

    -- Returns all 4 values going clockwise
    -- Top -> Right -> Bottom -> Left
    return
        self:GetMarginTop(),
        self:GetMarginRight(),
        self:GetMarginBottom(),
        self:GetMarginLeft()
end


    -- Returns margin top as a number
    function Base:GetMarginTop()    return self.margin.top end


    -- Returns margin right as a number
    function Base:GetMarginRight()  return self.margin.right end


    -- Returns margin bottom as a number
    function Base:GetMarginBottom() return self.margin.bottom end


    -- Returns margin left as a number
    function Base:GetMarginLeft()   return self.margin.left end


--         --
-- PADDING --
--         --

-- Returns all sides of Padding as numbers
function Base:GetPadding()

    -- Returns all 4 values going clockwise
    -- Top -> Right -> Bottom -> Left
    return
        self:GetPaddingTop(),
        self:GetPaddingRight(),
        self:GetPaddingBottom(),
        self:GetPaddingLeft()
end


    -- Returns Padding Top as a number
    function Base:GetPaddingTop()       return self.padding.top end


    -- Returns Padding Right as a number
    function Base:GetPaddingRight()     return self.padding.top end


    -- Returns Padding Bottom as a number
    function Base:GetPaddingBottom()    return self.padding.top end


    -- Returns Padding Left as a number
    function Base:GetPaddingLeft()      return self.padding.top end



--               --
-- CONTAINER POS --
--               --

-- Returns both x & y as numbers
function Base:GetContainerPos()

    return
        self:GetContainerX(),
        self:GetContainerY()
end


    -- Returns x container position as number
    function Base:GetContainerX() return self.container.x end


    -- Returns y container position as number
    function Base:GetContainerY() return self.container.y end



--                --
-- CONTAINER SIZE --
--                --

-- Returns both width & height as numbers
function Base:GetContainerSize()

    return
        self:GetContainerWidth(),
        self:GetContainerHeight()
end


    -- Returns container width as number
    function Base:GetContainerWidth() return self.container.width end


    -- Returns container height as number
    function Base:GetContainerHeight() return self.container.height end



--          --
-- POSITION --
--          --

-- Returns both x & y as numbers
function Base:GetPos()

    -- Returns X & Y Positions
    return
        self:GetX(),
        self:GetY()
end


    -- Returns x position as number
    function Base:GetX() return self.x end


    -- Returns y position as number
    function Base:GetY() return self.y end


--      --
-- SIZE --
--      --

-- Returns both width & height as numbers
function Base:GetSize()

    -- Returns Width & Height
    return
        self:GetWidth(),
        self:GetHeight()
end


    -- Returns width as a number
    function Base:GetWidth()    return self.width end


    -- Returns height as a number
    function Base:GetHeight()   return self.height end



--------------------
-- BOOLEAN CHECKS --
--------------------

-- Returns true ( tells GMod that this is a valid entity )
function Base:IsValid() return true end



-----------------
-- SET METHODS --
-----------------


    ------------------------------
    -- PASS PROPERTIES AS TABLE --
    ------------------------------
    function Base:PassProps( props )

        -- Ensure Props is a table
        assert( istable( props ), '\'props\' must be a table of property->value pairs!' )


        -- Check for margins
        if props.margin then

            -- Store local reference to margins
            local prop = props.margin

            -- Margin Top
            if prop.top then        self:SetMarginTop( prop.top ) end
            -- Margin Right
            if prop.right then      self:SetMarginRight( prop.right ) end
            -- Margin Bottom
            if prop.bottom then     self:SetMarginBottom( prop.bottom ) end
            -- Margin Left
            if prop.left then       self:SetMarginLeft( prop.left ) end
        end

        -- Check for padding
        if props.padding then

            -- Store local reference to padding
            local prop = props.padding

            -- Padding Top
            if prop.top then        self:SetPaddingTop( prop.top ) end
            -- Padding Right
            if prop.right then      self:SetPaddingRight( prop.right ) end
            -- Padding Bottom
            if prop.bottom then     self:SetPaddingBottom( prop.bottom ) end
            -- Padding Left
            if prop.left then       self:SetPaddingLeft( prop.left ) end
        end


        -- Check for Size
        if props.size then

            -- Store local reference to size
            local prop = props.size

            -- Width
            if prop.width then      self:SetWidth( prop.width ) end
            -- Height
            if prop.height then     self:SetHeight( prop.height ) end
        end


        -- Check for Position
        if props.pos then

            -- Store local reference to position
            local prop = props.pos

            -- X
            if prop.x then          self:SetX( prop.x ) end

            -- Y
            if prop.y then          self:SetY( prop.y ) end
        end
    end



--          --
-- MARGIN'S --
--          --

-- Sets the margin of the instance, taking all 4 number arguments
function Base:SetMargin( top, right, bottom, left )

    -- Sets default values for arguments
    top     = top       or 0
    right   = right     or 0
    bottom  = bottom    or 0
    left    = left      or 0

     -- Assert Arguments
    multi_assert( isnumber( top ), isnumber( right ), isnumber( bottom ), isnumber( left ) )


    -- Set Top Margin
    self:SetMarginTop( top )

    -- Set Top Margin
    self:SetMarginRight( right )

    -- Set Top Margin
    self:SetMarginBottom( bottom )

    -- Set Top Margin
    self:SetMarginLeft( left )
end


    -- Sets Margin Top
    function Base:SetMarginTop( number )    self.margin.top     = number end


    -- Sets Margin Right
    function Base:SetMarginRight( number )  self.margin.right   = number end


    -- Sets Margin Bottom
    function Base:SetMarginBottom( number ) self.margin.bottom  = number end


    -- Sets Margin Left
    function Base:SetMarginLeft( number )   self.margin.left    = number end


--         --
-- PADDING --
--         --

-- Sets padding of the instance, taking all 4 number arguments
function Base:SetPadding( top, right, bottom, left )

    -- Sets default values for arguments
    top     = top       or 0
    right   = right     or 0
    bottom  = bottom    or 0
    left    = left      or 0

    -- Assert Arguments
    multi_assert( isnumber( top ), isnumber( right ), isnumber( bottom ), isnumber( left ) )


    -- Set Top Margin
    self:SetPaddingTop( top )

    -- Set Top Margin
    self:SetPaddingRight( right )

    -- Set Top Margin
    self:SetPaddingBottom( bottom )

    -- Set Top Margin
    self:SetPaddingLeft( left )
end


    -- Sets Margin Top
    function Base:SetPaddingTop( number )    self.padding.top       = number end


    -- Sets Margin Right
    function Base:SetPaddingRight( number )  self.padding.right     = number end


    -- Sets Margin Bottom
    function Base:SetPaddingBottom( number ) self.padding.bottom    = number end


    -- Sets Margin Left
    function Base:SetPaddingLeft( number )   self.padding.left      = number end



--               --
-- CONTAINER POS --
--               --

-- Sets Container Position of instance, taking both x & y as number arguments
function Base:SetContainerPos( x, y )

    -- Sets fallback values for arguments
    x = x or 0
    y = y or 0

    -- Assert arguments
    multi_assert( isnumber( x ), isnumber( y ) )


    -- Set Container Position
    self:SetContainerX( x )
    self:SetContainerY( y )
end

    
    -- Sets Container X Position
    function Base:SetContainerX( number ) self.container.x = number end


    -- Sets Container Y Position
    function Base:SetContainerY( number ) self.container.y = number end



--                --
-- CONTAINER SIZE --
--                --

-- Sets Container Size of instance, taking both width & height as number arguments
function Base:SetContainerSize( width, height )

    -- Sets fallback values for arguments
    width   = width     or 0
    height  = height    or 0

    -- Assert Arguments
    multi_assert( isnumber( width ), isnumber( height ) )


    -- Set Container Size
    self:SetContainerWidth( width )
    self:SetContainerHeight( height )
end

    
    -- Sets Container Width
    function Base:SetContainerWidth( number ) self.container.width      = number end


    -- Sets Container Height
    function Base:SetContainerHeight( number ) self.container.height    = number end



--          --
-- POSITION --
--          --

-- Sets position of instance, taking both x & y as number arguments
function Base:SetPos( x, y )

    -- Sets default values for arguments
    x = x or 0
    y = y or 0

     -- Assert Arguments
    multi_assert( isnumber( x ), isnumber( y ) )


    -- Set Position
    self:SetX( x )
    self:SetY( y )
end


    -- Sets X Position
    function Base:SetX( number ) self.x = number end


    -- Sets Y Position
    function Base:SetY( number ) self.y = number end


--      --
-- SIZE --
--      --

-- Sets size of instance, taking both width & height as arguments
function Base:SetSize( width, height )

    -- Sets default values for arguments
    width   = width or 0
    height  = height or 0

    -- Assert Arguments
    multi_assert( isnumber( width ), isnumber( height ) )


    -- Set Width
    self:SetWidth( width )

    -- Set Height
    self:SetHeight( height )
end


    -- Sets Width
    function Base:SetWidth( number )    self.width  = number end


    -- Sets Height
    function Base:SetHeight( number )   self.height = number end
