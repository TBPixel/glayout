---------------
-- Grid Base --
---------------
Base = {}



-----------------
-- CONSTRUCTOR --
-----------------

function Base:Create()
    local base = {}


    ---------------------
    -- Grid Properties --
    ---------------------

    -- Margins
    local margin = {}
        margin.top         = 0
        margin.right       = 0
        margin.bottom      = 0
        margin.left        = 0

    -- Padding
    local padding = {}
        padding.top        = 0
        padding.right      = 0
        padding.bottom     = 0
        padding.left       = 0

    -- Container
    local container = {}
        container.x        = 0
        container.y        = 0
        container.width    = 0
        container.height   = 0


    -- Positioning
    local x      = 0
    local y      = 0

    -- Size
    local width  = 0
    local height = 0



    ----------
    -- DRAW --
    ----------

    -- Empty Draw method
    -- Set by the user on grids & columns
    function base:Draw() end


    -- Box Model Debugging Function
    function base:DrawDebug()

        -- Margin Settings
        local m = {}
            m.x        = self:GetContainerX()       - self:GetMarginLeft()
            m.y        = self:GetContainerY()       - self:GetMarginTop()
            m.w        = self:GetContainerWidth()   + ( self:GetMarginLeft()    + self:GetMarginRight() )
            m.h        = self:GetContainerHeight()  + ( self:GetMarginTop()     + self:GetMarginBottom() )
            m.color    = Color( 90, 215, 105, 255 )

        -- Padding Settings
        local p = {}
            p.x       = self:GetContainerX()
            p.y       = self:GetContainerY()
            p.w       = self:GetContainerWidth()
            p.h       = self:GetContainerHeight()
            p.color   = Color( 255, 145, 35, 255 )

        -- Box Settings
        local box = {}
            box.x           = self:GetX()
            box.y           = self:GetY()
            box.w           = self:GetWidth()
            box.h           = self:GetHeight()
            box.color       = Color( 0, 0, 0, 255 )


        -- Draw Margin
        draw.RoundedBox( 0, m.x, m.y, m.w, m.h, m.color )

            local marginText = 'X: ' .. m.x .. ' Y: ' .. m.y .. ' W: ' .. m.w .. ' H: ' .. m.h
            -- Draw Margin Debug Text
            draw.DrawText( marginText, 'DermaDefault', m.x, m.y )
            -- END Margin Debug Text

        -- Draw Padding
        draw.RoundedBox( 0, p.x, p.y, p.w, p.h, p.color )

            local paddingText = 'X: ' .. p.x .. ' Y: ' .. p.y .. ' W: ' .. p.w .. ' H: ' .. p.h
            -- Draw Padding Debug Text
            draw.DrawText( paddingText, 'DermaDefault', p.x, p.y )
            -- END Padding Debug Text

        -- Draw Box
        draw.RoundedBox( 0, box.x, box.y, box.w, box.h, box.color )

            local boxText = 'X: ' .. box.x .. ' Y: ' .. box.y .. ' W: ' .. box.w .. ' H: ' .. box.h

            -- Draw Box Debug Text
            draw.DrawText( boxText, 'DermaDefault', box.x, box.y )
            -- END Box Debug Text
    end



    -----------------
    -- GET METHODS --
    -----------------

    --          --
    -- MARGIN'S --
    --          --


    -- Returns all sides of Margin as a table of key->value pairs
    function base:GetMargin()

        local m = {}
            m.top       = self:GetMarginTop()
            m.right     = self:GetMarginRight()
            m.bottom    = self:GetMarginBottom()
            m.left      = self:GetMarginLeft()

        return m
    end


        -- Returns margin top as a number
        function base:GetMarginTop()    return margin.top end


        -- Returns margin right as a number
        function base:GetMarginRight()  return margin.right end


        -- Returns margin bottom as a number
        function base:GetMarginBottom() return margin.bottom end


        -- Returns margin left as a number
        function base:GetMarginLeft()   return margin.left end


    --         --
    -- PADDING --
    --         --

    -- Returns all sides of Padding as a table of key->value pairs
    function base:GetPadding()


        local p = {}
            p.top       = self:GetPaddingTop()
            p.right     = self:GetPaddingRight()
            p.bottom    = self:GetPaddingBottom()
            p.left      = self:GetPaddingLeft()

        return p
    end


        -- Returns Padding Top as a number
        function base:GetPaddingTop()       return padding.top end


        -- Returns Padding Right as a number
        function base:GetPaddingRight()     return padding.top end


        -- Returns Padding Bottom as a number
        function base:GetPaddingBottom()    return padding.top end


        -- Returns Padding Left as a number
        function base:GetPaddingLeft()      return padding.top end



    --           --
    -- CONTAINER --
    --           --

    function base:GetContainer()

        return
            self:GetContainerPos(),
            self:GetContainerSize()
    end



    --               --
    -- CONTAINER POS --
    --               --

    -- Returns both x & y as a table of key->value pairs
    function base:GetContainerPos()

        local pos = {}
            pos.x = self:GetContainerX()
            pos.y = self:GetContainerY()

        return pos
    end


        -- Returns x container position as number
        function base:GetContainerX() return container.x end


        -- Returns y container position as number
        function base:GetContainerY() return container.y end



    --                --
    -- CONTAINER SIZE --
    --                --

    -- Returns both width & height as a table of key->value pairs
    function base:GetContainerSize()

        local size = {}
            size.x = self:GetContainerWidth()
            size.y = self:GetContainerHeight()

        return size
    end


        -- Returns container width as number
        function base:GetContainerWidth() return container.width end


        -- Returns container height as number
        function base:GetContainerHeight() return container.height end



    --          --
    -- POSITION --
    --          --

    -- Returns both x & y as a table of key->value pairs
    function base:GetPos()

        local pos = {}
            pos.x = self:GetX()
            pos.y = self:GetY()

        return pos
    end


        -- Returns x position as number
        function base:GetX() return x end


        -- Returns y position as number
        function base:GetY() return y end


    --      --
    -- SIZE --
    --      --

    -- Returns both width & height as a table of key->value pairs
    function base:GetSize()

        local size = {}
            size.x = self:GetWidth()
            size.y = self:GetHeight()

        return size
    end


        -- Returns width as a number
        function base:GetWidth()    return width end


        -- Returns height as a number
        function base:GetHeight()   return height end



    --------------------
    -- BOOLEAN CHECKS --
    --------------------

    -- Returns true ( tells GMod that this is a valid entity )
    function base:IsValid() return true end



    -----------------
    -- SET METHODS --
    -----------------


        ------------------------------
        -- PASS PROPERTIES AS TABLE --
        ------------------------------
        function base:PassProps( props )

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


            -- Check for shift
            if props.shift and self.SetShift then self:SetShift( props.shift ) end
        end



    --          --
    -- MARGIN'S --
    --          --

    -- Sets the margin of the instance, taking all 4 number arguments
    function base:SetMargin( top, right, bottom, left )

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
        function base:SetMarginTop( number )    margin.top      = number end


        -- Sets Margin Right
        function base:SetMarginRight( number )  margin.right    = number end


        -- Sets Margin Bottom
        function base:SetMarginBottom( number ) margin.bottom   = number end


        -- Sets Margin Left
        function base:SetMarginLeft( number )   margin.left     = number end


    --         --
    -- PADDING --
    --         --

    -- Sets padding of the instance, taking all 4 number arguments
    function base:SetPadding( top, right, bottom, left )

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
        function base:SetPaddingTop( number )    padding.top    = number end


        -- Sets Margin Right
        function base:SetPaddingRight( number )  padding.right  = number end


        -- Sets Margin Bottom
        function base:SetPaddingBottom( number ) padding.bottom = number end


        -- Sets Margin Left
        function base:SetPaddingLeft( number )   padding.left   = number end



    --               --
    -- CONTAINER POS --
    --               --

    -- Sets Container Position of instance, taking both x & y as number arguments
    function base:SetContainerPos( x, y )

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
        function base:SetContainerX( number ) container.x = number end


        -- Sets Container Y Position
        function base:SetContainerY( number ) container.y = number end



    --                --
    -- CONTAINER SIZE --
    --                --

    -- Sets Container Size of instance, taking both width & height as number arguments
    function base:SetContainerSize( width, height )

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
        function base:SetContainerWidth( number ) container.width   = number end


        -- Sets Container Height
        function base:SetContainerHeight( number ) container.height = number end



    --          --
    -- POSITION --
    --          --

    -- Sets position of instance, taking both x & y as number arguments
    function base:SetPos( x, y )

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
        function base:SetX( number ) x = number end


        -- Sets Y Position
        function base:SetY( number ) y = number end


    --      --
    -- SIZE --
    --      --

    -- Sets size of instance, taking both width & height as arguments
    function base:SetSize( width, height )

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
        function base:SetWidth( number ) width      = number end


        -- Sets Height
        function base:SetHeight( number ) height    = number end



    --------------------------
    -- END INSTANCE METHODS --
    --------------------------

    -- Ensure new instance is valid
    if not IsValid( base ) then return false end


    -- Return new instance
    return base
end
